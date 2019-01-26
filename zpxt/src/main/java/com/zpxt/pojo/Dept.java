package com.zpxt.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_dept")
public class Dept implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id@Column(name="dept_no")@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int deptNo;
	@Column(length=20,name="dept_name")
	private String deptName;
	@Column(name="dept_own")
	private String deptOwn;
	@Column(length=20,name="dept_tel")
	private String deptTel;
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getDeptOwn() {
		return deptOwn;
	}
	public void setDeptOwn(String deptOwn) {
		this.deptOwn = deptOwn;
	}
	public String getDeptTel() {
		return deptTel;
	}
	public void setDeptTel(String deptTel) {
		this.deptTel = deptTel;
	}
	
	
}
