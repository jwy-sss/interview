package com.qut.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;





import com.qut.mapper.ProblemMapper;
import com.qut.mapper.TestMapper;
import com.qut.mapper.TestProMapper;
import com.qut.pojo.Problem;
import com.qut.pojo.Test;
import com.qut.pojo.TestPro;
import com.qut.service.TestService;


@Service
@Transactional(rollbackFor=Exception.class)
public class TestServiceImpl implements TestService{

	@Autowired
	private TestMapper testMapper;
	@Autowired
	private ProblemMapper problemMapper;
	@Autowired
	private TestProMapper testProMapper;
	
	public int addTest(Test t) {
		return testMapper.addTest(t);
	}
	
	//public Test findTestById(int TestId) {
	//	return testMapper.findTestById(TestId);
	//}
	
	public List<Test> selectTest(@Param("teaId") int teaId, @Param("testTime") String testTime){
		return testMapper.selectTest(teaId,testTime);
	}
	
	public List<Test> selectTestByTeaid(int teaId){
		return testMapper.selectTestByTeaid(teaId);
	}
	
	public int updateScoreByTestId(int score, int TestId) {
		return testMapper.updateScoreByTestId(score, TestId);
	}
			
	public Test findTestById(int testId){
		int[] proId = testProMapper.findProByTestid(testId);
		Test t = testMapper.findTestById(testId);
		List<Problem> proList = new ArrayList<Problem>();
		for(int i=0;i<proId.length;i++){
		proList.add(problemMapper.findProById(proId[i]));
		}
		t.setProList(proList);
		return t;
	}
	
	public List<Test> selectAllTest(Test t){
		return testMapper.selectAllTest(t);
	}
	
	
}
