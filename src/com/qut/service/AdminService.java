package com.qut.service;

import java.util.List;

import com.qut.pojo.Admin;

public interface AdminService {

	public Admin login(Admin admin);
	
	public int addAdmin(Admin admin);
	
	public int delAdminById(int adminId);
	
	public int updAdm(Admin admin);
	
	public Admin findAdminById(int adminId);

	public List<Admin> selectAdmin();

	
}

