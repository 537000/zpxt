package com.zpxt.vo;

import java.io.Serializable;
import java.util.Date;

public class InterviewInfo implements Serializable{

	private static final long serialVersionUID = 1L;

	private int interviewNo;
	private String interviewAddr;
	private String interviewOwn;
	private Date applyTime;
	private Date passTime;
	private int interviewState;
	private String interviewUser;
	private String email;
	private String telphone;
	private String work;
	private String hope;
	private String ypzw;
	private String ypbm;
	private Double zpgz;
	private char sex;
	private int state;

	public String getHope() {
		return hope;
	}
	public void setHope(String hope) {
		this.hope = hope;
	}
	public int getInterviewNo() {
		return interviewNo;
	}
	public void setInterviewNo(int interviewNo) {
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
	public String getYpzw() {
		return ypzw;
	}
	public void setYpzw(String ypzw) {
		this.ypzw = ypzw;
	}
	public String getYpbm() {
		return ypbm;
	}
	public void setYpbm(String ypbm) {
		this.ypbm = ypbm;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Double getZpgz() {
		return zpgz;
	}
	public void setZpgz(Double zpgz) {
		this.zpgz = zpgz;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
