package com.qut.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.qut.pojo.TestPro;
import com.qut.service.TestProService;
import com.qut.service.TestService;

@Controller
public class TestProController {

	@Autowired
	private TestService testService;
	
	@Autowired
	private TestProService testProService;
	
	@RequestMapping("/insertTestPro")
	public ModelAndView insertTestPro(HttpServletRequest request){
		String scores[]=request.getParameterValues("score");
		String proids[]=request.getParameterValues("proId");
		int testId=Integer.parseInt(request.getParameter("testId"));
		int totalscore=0;
		for(int i=0;i<proids.length;i++)
		{
			TestPro testpro=new TestPro();
			testpro.setTpProid(Integer.parseInt(proids[i]));
			testpro.setTpScore(Integer.parseInt(scores[i]));
			totalscore+=Integer.parseInt(scores[i]);
			testpro.setTpTestid(Integer.parseInt(request.getParameter("testId")));
			testProService.insertTestPro(testpro);
		}
		int res=testService.updateScoreByTestId(totalscore, testId);
		ModelAndView view=new ModelAndView();
		if(res!=0)
		{
			view.setViewName("success");
		}
		else
		{
			view.setViewName("error");
		}
		return view;

	}
}
