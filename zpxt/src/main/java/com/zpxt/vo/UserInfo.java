package com.zpxt.vo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

public class UserInfo implements Serializable{

	private static final long serialVersionUID = 1L;

	private String userNo;
	private String userName;
	private char userSex;
	private String userTel;
	private String work;
	private String xueli;
	private String deptNo;
	private String jobNo;
	private String interviewNo;
	private String email;
	private int state;
	private Date lzsqTime;
	private Date lzTime;
	
	public Date getLzsqTime() {
		return lzsqTime;
	}
	public void setLzsqTime(Date lzsqTime) {
		this.lzsqTime = lzsqTime;
	}
	public Date getLzTime() {
		return lzTime;
	}
	public void setLzTime(Date lzTime) {
		this.lzTime = lzTime;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public char getUserSex() {
		return userSex;
	}
	public void setUserSex(char userSex) {
		this.userSex = userSex;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getXueli() {
		return xueli;
	}
	public void setXueli(String xueli) {
		this.xueli = xueli;
	}
	public String getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}
	public String getJobNo() {
		return jobNo;
	}
	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}
	public String getInterviewNo() {
		return interviewNo;
	}
	public void setInterviewNo(String interviewNo) {
		this.interviewNo = interviewNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
