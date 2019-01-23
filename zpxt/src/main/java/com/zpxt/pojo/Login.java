package com.zpxt.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_login")
public class Login implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id@Column(length=20,name="login_no")
	private String loginNo;
	@Column(length=50,name="password")
	private String password;
	@Column(length=20,name="user_type")
	private String userType;
	
	public String getLoginNo() {
		return loginNo;
	}
	public void setLoginNo(String loginNo) {
		this.loginNo = loginNo;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	
}
