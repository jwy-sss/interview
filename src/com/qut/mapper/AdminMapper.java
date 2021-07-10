package com.qut.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qut.pojo.Admin;


@Repository
public interface AdminMapper {

	public Admin findAdmin(Admin admin);
	
	public int addAdmin(Admin admin);
	
	public int delAdminById(int adminId);

	public int updAdm(Admin admin);

	//admin结果集
	public List<Admin> selectAdmin();
	
	public Admin findAdminById(int adminId);
	
}
