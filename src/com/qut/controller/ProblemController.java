package com.qut.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.qut.pojo.Problem;
import com.qut.service.ProblemService;


@Controller
public class ProblemController {
	
	@Autowired
	private ProblemService problemService;
	
	@RequestMapping("/addPro")     //添加
	public ModelAndView addPro(Problem pro){
		int res = problemService.addPro(pro);
		ModelAndView view = new ModelAndView();
		if(res != 0){
			//添加成功
			view.setViewName("success");
		}else{
			//添加失败
			view.setViewName("error");
		}
		return view;
	}

	@RequestMapping("/delProById")     //删除某个试题
	public ModelAndView delProById(int proId){
		int res = problemService.delProById(proId);
		ModelAndView view = new ModelAndView();
		if(res != 0){
			//删除成功
			view.setViewName("success");
		}else{
			//删除失败
			view.setViewName("error");
		}
		return view;
	}

	@RequestMapping("/findProById")     //查出待修改的试题
	public ModelAndView findProById(int proId,HttpServletRequest request){
		Problem pro = problemService.findProById(proId);
		ModelAndView view = new ModelAndView();
		if(pro!= null){
			view.addObject("pro",pro);
			view.setViewName("Admin_EditProblem");   
		}else{
			view.setViewName("error");
		}
		return view;
	}
	
	@RequestMapping("/selectAllPro")     //查出所有试题
	public ModelAndView selectAllPro(){
		List<Problem> proList = problemService.selectAllPro();
		ModelAndView view = new ModelAndView();
		if(proList != null){
			view.addObject("proList", proList);
			view.setViewName("Admin_SearchProblem");
		}
		else{
			view.setViewName("error");
		}
		return view;
	
	}
	
	@RequestMapping("/updPro")     //更改某个试题
	public ModelAndView updPro(Problem problem){
		
		int res = problemService.updPro(problem);
		System.out.println(res);
		ModelAndView view = new ModelAndView();
		if(res != 0){
			view.setViewName("success");			
		}else{
			view.setViewName("error");
		}
		return view;
	}
	
	@RequestMapping("/selectPro")     //选择某些试题
	public ModelAndView selectPro(Problem problem){
		List<Problem> proList = problemService.selectPro(problem);
		ModelAndView view = new ModelAndView();
		if(proList != null){
			view.addObject("proList", proList);
			view.setViewName("Admin_SearchProblem");			
		}else{
			
			view.setViewName("error");
		}
		return view;
	}
	
}
