package com.zpxt.pojo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_zhaopin")
public class ZhaoPin implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id@Column(length=20,name="zp_no")
	private String zpNo;
	@Column(length=20,name="zp_dept")
	private String zpDept;
	@Column(length=20,name="zp_job")
	private String zpJob;
	@Column(name="zp_Num")
	private int zpNum;
	@Column(length=100,name="description")
	private String description;
	@Column(name="salary")
	private Double salary;
	@Column(length=100,name="work_addr")
	private String workAddr;
	@Column(name="last_Date")
	private Date lastDate;
	@Column(length=20,name="zp_own")
	private String zpOwn;
	@Column(name="zp_state")
	private int zpState;	
	@Column(length=100,name="remark")
	private String remark;
	public String getZpNo() {
		return zpNo;
	}
	public void setZpNo(String zpNo) {
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
