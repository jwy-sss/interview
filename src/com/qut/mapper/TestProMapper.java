package com.qut.mapper;

import org.springframework.stereotype.Repository;

import com.qut.pojo.TestPro;


@Repository
public interface TestProMapper {

	public int insertTestPro(TestPro testpro);

	public int[] findProByTestid(int testId);
	
	
	
}
