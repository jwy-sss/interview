package com.qut.service;

import com.qut.pojo.TestPro;

public interface TestProService {

	
	public int insertTestPro(TestPro testpro);
	
	
	public int[] findProByTestid(int testId);


}