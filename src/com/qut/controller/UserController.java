package com.qut.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.qut.pojo.Admin;
import com.qut.pojo.Teacher;
import com.qut.pojo.User;
import com.qut.service.AdminService;
import com.qut.service.TeacherService;

@Controller
public class UserController {
	
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private AdminService adminService;
	
	
	@RequestMapping("/User.action")//对应前端JSP页面form表单中的action名称
	public ModelAndView login(User u,String identity,HttpSession session){
		ModelAndView view = new ModelAndView();
		switch (identity){
		
				case "tea":{
					Teacher tea=new Teacher();
					tea.setTeaNo(u.getUser());
					tea.setTeaPwd(EncoderByMd5(u.getPwd()));
					Teacher t = teacherService.login(tea);
					if(t!=null){
						session.setAttribute("type", "tea");
						session.setAttribute("userId", t.getTeaId());
						view.addObject("user", u);
						view.setViewName("Tea_main");
					}else{
						session.setAttribute("errorInfo","账号或密码错误,请重试");
						view.setViewName("Login");
					}
					break;
				}
				case "adm":{
					Admin adm=new Admin();
					adm.setAdminNo(u.getUser());
					System.out.println(EncoderByMd5(u.getPwd()));
					adm.setAdminPwd(EncoderByMd5(u.getPwd()));
					Admin a = adminService.login(adm);
					
					if(a!=null){
						session.setAttribute("type", "adm");
						session.setAttribute("userId", a.getAdminId());
						view.addObject("user", u);
						view.setViewName("Admin_main");
					}else{
						session.setAttribute("errorInfo","账号或密码错误,请重试");
						view.setViewName("Login");
					}
					break;
				}
		}
		return view;
	}
	
	//注销不起作用，session会话没正常结束？
	@RequestMapping("/Logout.action")
	public String logout(HttpSession session){
		session.invalidate();
		return "Login";
	}
	
	@RequestMapping("/updUser.action")
	public ModelAndView updUser(User u,String pwdNew,String type,int userId,HttpServletResponse response){
		ModelAndView view = new ModelAndView();
		
			switch (type){
					case "tea":{
						
						Teacher tea=teacherService.findTeaById(userId);
						
						//如果是从UpdatePersonPassword界面跳转过来的，要先判断原密码
						if(!tea.getTeaPwd().equals(EncoderByMd5(u.getPwd())))
						{	view.setViewName("UpdatePersonPassword");
							String tip="原密码输入错误，请重试";
							view.addObject("tip",tip);
							break;
						}
						u.setPwd(pwdNew);
						tea.setTeaId(userId);
						String teaNo=u.getUser();
						tea.setTeaNo(teaNo);
						tea.setTeaPwd(EncoderByMd5(u.getPwd()));
						System.out.println(tea.getTeaNo());
						int res = teacherService.updTea(tea);
						if(res!=0){
							view.setViewName("success");
						}else{
							view.setViewName("error");
						}
						break;
					}
					case "adm":{
						Admin adm = adminService.findAdminById(userId);
						
						String Encodedpassword=EncoderByMd5(u.getPwd());
						
						//如果密码不一致，则提示输入错误
						//如果是从UpdatePersonPassword界面跳转过来的，要先判断原密码
						if(!adm.getAdminPwd().equals(Encodedpassword))
						{	view.setViewName("UpdatePersonPassword");
							String tip="原密码输入错误,请重试";
							view.addObject("tip",tip);
							break;
						}
						u.setPwd(EncoderByMd5(pwdNew));
						adm.setAdminId(userId);
						String adminNo=u.getUser();
						adm.setAdminNo(adminNo);
						adm.setAdminPwd(u.getPwd());
						int res = adminService.updAdm(adm);
						if(res!=0){
							view.setViewName("success");
						}
						else{
							view.setViewName("error");
						}
						break;
					}
			}
			return view;
		
	}
	
	public static String EncoderByMd5(String pass) 
	{
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance(("MD5"));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 //生成随机东东 不可逆
        byte[] bytes = md5.digest(pass.getBytes());
        
        String str = Base64.getEncoder().encodeToString(bytes);
        
        return str;
		
	}
}
