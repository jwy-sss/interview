package com.qut.controller;

import com.qut.pojo.Problem;
import com.qut.pojo.Test;
import com.qut.service.ProblemService;
import com.qut.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Controller
public class TestController {

	@Autowired
	private TestService testService;
	@Autowired
	private ProblemService problemService;
	
	//添加面试同时生成试卷返回
	@RequestMapping("/addTest")                
	public ModelAndView addTest(HttpServletRequest request){
		Test test=new Test();
		String[] ProTypes=request.getParameterValues("ProTypes");
		String[] NecessaryProTypes=request.getParameterValues("NecessaryProTypes");
		List<Problem> proList=new ArrayList<Problem>(); //缓冲存储
		List<Problem> finalproList=new ArrayList<Problem>(); //最终返回值
		int pronum=Integer.parseInt(request.getParameter("testNum")); //得到问题数量
		ModelAndView view = new ModelAndView();
		
		test.setTeaId(Integer.parseInt(request.getParameter("teaId")));
		test.setEeNo(request.getParameter("eeNo"));
		test.setEeName(request.getParameter("eeName"));
		test.setEeSex(request.getParameter("eeSex"));
		//test.setTestSum(Integer.parseInt(request.getParameter("testSum")));
		test.setTestTime(new Date());
		int Nprolength=0;
		if(NecessaryProTypes!=null)
			Nprolength=NecessaryProTypes.length;
		//如果必考题目比题目类型多或者题目数比必考题目类型多
		if(ProTypes==null||ProTypes.length<Nprolength||Nprolength>pronum)
		{
			view.setViewName("error");
			System.out.println("参数设置错误");
			return view;
		}
		
		SecureRandom random=new SecureRandom(); //随机数大法选题目
		//读取所有符合选择类型的题目
//		for(String item:ProTypes)
//		{
//			System.out.println(item);
//			Problem problem=new Problem();
//			problem.setProType(item);
//			List<Problem> proList1 = problemService.selectPro(problem); 
//			proList.addAll(proList1);
//		}
		int alreadyget=0; //已经抽取的题目数
		
		//先抽取必考题,每种必考题抽一道
		if(NecessaryProTypes!=null)
		{
		for(String item:NecessaryProTypes)
		{
			Problem problem=new Problem();
			problem.setProType(item);
			List<Problem> proList1 = problemService.selectPro(problem); 
			int index=random.nextInt(proList1.size());
			finalproList.add(proList1.get(index));
			proList1.remove(index);
			proList.addAll(proList1);
			alreadyget++;
		}
		}
		//读取非必考题目
		for(int i=0;i<ProTypes.length;i++)
		{
			Boolean searchflag =  true;
			//题目之前已经提取过了，则下一个
			for(int j=0;Nprolength!=0&&j<NecessaryProTypes.length;j++)
				if(ProTypes[i].equals(NecessaryProTypes[j]))
				{
					searchflag=false;
					break;
				}
			if(searchflag==false)
				continue;
			
			//读取非必考题目
			Problem problem=new Problem();
			problem.setProType(ProTypes[i]);
			List<Problem> proList1 = problemService.selectPro(problem);
			proList.addAll(proList1);
		}

		while(alreadyget<pronum)
		{
			int index=random.nextInt(proList.size());
			finalproList.add(proList.get(index));
			proList.remove(index);
			alreadyget++;
		}
		
		for(Problem item:finalproList)
		{
			System.out.println(item.getProType());
		}
		int res = testService.addTest(test);
		int testId=test.getTestId();
		System.out.println(test.getTestId());
		//int res=1;
		if(res != 0){
			//添加成功
			view.addObject("testId",testId);
			view.addObject("finalproList",finalproList);
			view.setViewName("Stu_Exam2");
		}else{
			//添加失败
			view.setViewName("error");
		}
		return view;
	}
	
	
	@RequestMapping("/selectTestByTeaid")             //查询登录老师，创建的所有试卷
	public ModelAndView selectTestByTeaid(              
			HttpServletRequest request
			//HttpServletResponse response,
			//Model model
			){
		int userId=Integer.parseInt(request.getParameter("userId"));
		ModelAndView view =new ModelAndView();
		List<Test> testList = testService.selectTestByTeaid(userId);
		if(testList != null){
		view.addObject("testList", testList);
		view.setViewName("Tea_SearchTest");
		}else
			view.setViewName("Tea_SearchTest");
		return view;

	}	
	
	
	@RequestMapping("/selectAllTest")             //管理员查询所有面试记录
	public ModelAndView selectAllTest( 
			Test test,
			HttpServletRequest request
			//HttpServletResponse response,
			//Model model
			){
		ModelAndView view =new ModelAndView();
		List<Test> testList = testService.selectAllTest(test);
		if(testList != null){
		view.addObject("testList", testList);
		view.setViewName("Admin_SearchTest");
		}else
			view.setViewName("Admin_SearchTest");
		return view;

	}
	@RequestMapping("/selectTest")             //管理员查询所有面试记录
	public ModelAndView selectTest(HttpServletRequest request){	
		ModelAndView view = new ModelAndView();
		int teaId=Integer.parseInt(request.getParameter("teaId"));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String testTime=request.getParameter("testTime").toString();
		List<Test> testList = testService.selectTest(teaId,testTime);
		if( testList != null){
			view.addObject("testList", testList);
			view.setViewName("Admin_SearchTest");			
		}else{			
			view.setViewName("Admin_SearchTest");
		}
		return view;
	}	
	@RequestMapping("/findTestById")     //试题详情
	public ModelAndView findTestById(int testId,HttpServletRequest request){
		Test t = testService.findTestById(testId);
		ModelAndView view = new ModelAndView();
		if(t != null){
			List<Problem> proList = t.getProList();
			view.addObject("proList", proList);
			//view.addObject("testId",t.getTestId());
			view.addObject("test",t);
			view.setViewName("Tea_DetailText"); //试题详情页面
			
		}else{
			
			view.setViewName("Tea_DetailText");
		}
		return view;
	}
	
	
}