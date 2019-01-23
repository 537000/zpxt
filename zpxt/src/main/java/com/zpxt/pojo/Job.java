package com.zpxt.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_job")
public class Job {

//	职位编号	varchar	20	主键
//	职位名称	varchar	20	

	@Id@Column(length=20,name="job_no")
	private String jobNo;
	@Column(length=20,name="job_name")
	private String jobName;
	public String getJobNo() {
		return jobNo;
	}
	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	
	
}
