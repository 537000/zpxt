package com.zpxt.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_user")
public class User implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id@Column(length=20,name="user_no")
	private String userNo;
	@Column(length=20,name="user_name")
	private String userName;
	@Column(name="user_sex")
	private char userSex;
	@Column(length=20,name="user_tel")
	private String userTel;
	@Column(length=100,name="work")
	private String work;
	@Column(length=100,name="xueli")
	private String xueli;
	@Column(name="user_dept")
	private int deptNo;
	@Column(name="user_job")
	private int jobNo;
	@Column(length=20,name="user_interview")
	private String interviewNo;
	@Column(length=50,name="user_email")
	private String email;
	@Column(name="user_state")
	private int state;
	@Column(name="lzsq_time")
	private Date lzsqTime;
	@Column(name="lz_time")
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
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	public int getJobNo() {
		return jobNo;
	}
	public void setJobNo(int jobNo) {
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

