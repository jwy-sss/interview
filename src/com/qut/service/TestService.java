package com.qut.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qut.pojo.Test;

public interface TestService {


	// 查询某一个老师的所有试卷
	public List<Test> selectTestByTeaid(int teaId);
	
	//管理员查询所有面试记录
	public List<Test> selectAllTest(Test t);

	// 查出某个试题
	public Test findTestById(int testId);

	public int addTest(Test t);

	public List<Test> selectTest(@Param("teaId") int teaId, @Param("testTime") String testTime);

	public int updateScoreByTestId(int score, int TestId);

}
