package com.zpxt.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_interview")
public class Interview implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id@Column(length=20,name="interview_no")
	private String interviewNo;
	@Column(length=50,name="interview_addr")
	private String interviewAddr;
	@Column(length=20,name="interview_own")
	private String interviewOwn;
	@Column(length=100,name="apply_time")
	private Date applyTime;
	@Column(length=100,name="pass_time")
	private Date passTime;
	@Column(name="interview_state")
	private int interviewState;
	@Column(length=20,name="interview_user")
	private String interviewUser;
	@Column(length=50,name="email")
	private String email;
	@Column(length=20,name="telphone")
	private String telphone;
	@Column(length=100,name="work")
	private String work;
	private char sex;

	public String getInterviewNo() {
		return interviewNo;
	}
	public void setInterviewNo(String interviewNo) {
		this.interviewNo = interviewNo;
	}
	public String getInterviewAddr() {
		return interviewAddr;
	}
	public void setInterviewAddr(String interviewAddr) {
		this.interviewAddr = interviewAddr;
	}
	public String getInterviewOwn() {
		return interviewOwn;
	}
	public void setInterviewOwn(String interviewOwn) {
		this.interviewOwn = interviewOwn;
	}
	public Date getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	public Date getPassTime() {
		return passTime;
	}
	public void setPassTime(Date passTime) {
		this.passTime = passTime;
	}
	public int getInterviewState() {
		return interviewState;
	}
	public void setInterviewState(int interviewState) {
		this.interviewState = interviewState;
	}
	public String getInterviewUser() {
		return interviewUser;
	}
	public void setInterviewUser(String interviewUser) {
		this.interviewUser = interviewUser;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public char getSex() {
		return sex;
	}
	public void setSex(char sex) {
		this.sex = sex;
	}
}
