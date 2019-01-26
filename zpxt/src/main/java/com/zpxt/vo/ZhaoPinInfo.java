package com.zpxt.vo;

import java.io.Serializable;
import java.util.Date;

public class ZhaoPinInfo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int zpNo;
	private String zpDept;
	private String zpJob;
	private int zpNum;
	private String description;
	private Double salary;
	private String workAddr;
	private Date lastDate;
	private String zpOwn;
	private int zpState;	
	private String remark;
	public int getZpNo() {
		return zpNo;
	}
	public void setZpNo(int zpNo) {
		this.zpNo = zpNo;
	}
	public String getZpDept() {
		return zpDept;
	}
	public void setZpDept(String zpDept) {
		this.zpDept = zpDept;
	}
	public String getZpJob() {
		return zpJob;
	}
	public void setZpJob(String zpJob) {
		this.zpJob = zpJob;
	}
	public int getZpNum() {
		return zpNum;
	}
	public void setZpNum(int zpNum) {
		this.zpNum = zpNum;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getSalary() {
		return salary;
	}
	public void setSalary(Double salary) {
		this.salary = salary;
	}
	public String getWorkAddr() {
		return workAddr;
	}
	public void setWorkAddr(String workAddr) {
		this.workAddr = workAddr;
	}
	public Date getLastDate() {
		return lastDate;
	}
	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}
	public String getZpOwn() {
		return zpOwn;
	}
	public void setZpOwn(String zpOwn) {
		this.zpOwn = zpOwn;
	}
	public int getZpState() {
		return zpState;
	}
	public void setZpState(int zpState) {
		this.zpState = zpState;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "ZhaoPin [zpNo=" + zpNo + ", zpDept=" + zpDept + ", zpJob=" + zpJob + ", zpNum=" + zpNum
				+ ", description=" + description + ", salary=" + salary + ", workAddr=" + workAddr + ", lastDate="
				+ lastDate + ", zpOwn=" + zpOwn + ", zpState=" + zpState + ", remark=" + remark + "]";
	}
	
}
