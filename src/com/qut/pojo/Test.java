package com.qut.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Test {
	private int testId;	
	private Date testTime;
	private String eeNo;
	private String eeName;
	private String eeSex;
	private double testSum;
	private int teaId;
	private List<Problem> proList =new ArrayList<Problem>();
	
	//private String[] ProTypes;
	//private String[] NecessaryProTypes;
	
	public int getTestId() {
		return testId;
	}
	public void setTestId(int testid) {
		this.testId = testid;
	}
	public Date getTestTime() {
		return testTime;
	}
	public void setTestTime(Date testTime) {
		this.testTime = testTime;
	}
	public String getEeNo() {
		return eeNo;
	}
	public void setEeNo(String eeNo) {
		this.eeNo = eeNo;
	}
	public String getEeName() {
		return eeName;
	}
	public void setEeName(String eeName) {
		this.eeName = eeName;
	}
	public String getEeSex() {
		return eeSex;
	}
	public void setEeSex(String eeSex) {
		this.eeSex = eeSex;
	}
	public double getTestSum() {
		return testSum;
	}
	public void setTestSum(double testSum) {
		this.testSum = testSum;
	}
	public int getTeaId() {
		return teaId;
	}
	public void setTeaId(int teaId) {
		this.teaId = teaId;
	}
		
	public List<Problem> getProList() {
		return proList;
	}
	public void setProList(List<Problem> proList) {
		this.proList = proList;
	}

	
}
