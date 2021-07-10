package com.qut.mapper;

import java.util.List;
import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.qut.pojo.Test;


@Repository
public interface TestMapper {

	public int addTest(Test test);

	public int delTestById(int testId);

	public List<Test> selectTestByTeaid(int teaId);	
	
	public Test findTestById(int testId);

	public Test findLastTest();
	
	public List<Test> selectTest(@Param("teaId") int teaId, @Param("testTime") String testTime);
	
	public List<Test> selectAllTest(Test t);	
	
	public int updateScoreByTestId(int score, int testId);


}
