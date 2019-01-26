package com.zpxt.vo;

public class ApplyJobInfo {

	private String jobNo;

	public String getJobNo() {
		return jobNo;
	}

	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}

	private String username;
	private String sex;
	private String tel;
	private String school;
	private String time;
	private String xl;
	private String work;
	private String email;
	private String hope;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getXl() {
		return xl;
	}

	public void setXl(String xl) {
		this.xl = xl;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHope() {
		return hope;
	}

	public void setHope(String hope) {
		this.hope = hope;
	}

	@Override
	public String toString() {
		return "ApplyJobInfo [username=" + username + ", sex=" + sex + ", tel=" + tel + ", school=" + school + ", time="
				+ time + ", xl=" + xl + ", work=" + work + ", email=" + email + "]";
	}

}
