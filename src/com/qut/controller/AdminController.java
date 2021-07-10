package com.qut.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.qut.pojo.Admin;
import com.qut.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	
	public ModelAndView login(Admin admin){
		Admin a = adminService.login(admin);
		ModelAndView view = new ModelAndView();
		if(a!=null){
			//验证成功，跳转Admin_main.jsp页面
			view.setViewName("Admin_main");
		}else{
			//验证失败，跳转到Login.jsp页面
			view.setViewName("Login");
		}
		return view;
	}
	
	@RequestMapping("/addAdmin")     //添加其他管理员信息
	public ModelAndView addAdmin(Admin admin){
		
		admin.setAdminPwd((UserController.EncoderByMd5(admin.getAdminPwd())));
		int res = adminService.addAdmin(admin);
		ModelAndView view = new ModelAndView();
		if(res != 0){
			//添加成功
			view.setViewName("success");
		}else{
			//添加失败
			view.setViewName("admin_main");
		}
		return view;
	}
	
	//修改管理员信息
	
	@RequestMapping("/updAdm")     
	public ModelAndView updAdm(Admin admin){
		admin.setAdminPwd((UserController.EncoderByMd5(admin.getAdminPwd())));
		int res = adminService.updAdm(admin);
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
	
	//修改admin信息
	@RequestMapping("/findAdminById")     
	public ModelAndView findAdminById(int adminid){
		Admin ad = adminService.findAdminById(adminid);
		ModelAndView view = new ModelAndView();
		if(ad!=null)
		{
			view.addObject("admin", ad);
			view.setViewName("Admin_UpdateInfoAdm");
		}
		else
		{
			view.setViewName("error");
		}
		return view;
	}
	
	//选择全部标签
	@RequestMapping("/selectAdmin")    
	public ModelAndView selectAdmin(){
		ModelAndView view =new ModelAndView();
		List<Admin> adminList = adminService.selectAdmin();
		view.addObject("admList", adminList);   //添加信息项
		view.setViewName("Admin_SearchAdmin");  //设置要跳转到的界面
		return view;
	}
	
	//删除标签
	@RequestMapping("/delAdminById")     
	public ModelAndView delAdm(int adminid){
		int res = adminService.delAdminById(adminid);
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
	
	
}