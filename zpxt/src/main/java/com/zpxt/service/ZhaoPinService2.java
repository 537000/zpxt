package com.zpxt.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zpxt.pojo.Dept;
import com.zpxt.pojo.Interview;
import com.zpxt.pojo.Job;
import com.zpxt.pojo.User;
import com.zpxt.pojo.ZhaoPin;
import com.zpxt.repository.DeptRepository;
import com.zpxt.repository.InterviewRepository;
import com.zpxt.repository.JobRepository;
import com.zpxt.repository.LoginRepository;
import com.zpxt.repository.UserRepository;
import com.zpxt.repository.ZhaoPinRepository;
import com.zpxt.util.Contant;
import com.zpxt.vo.ApplyJobInfo;
import com.zpxt.vo.UserInfo;
import com.zpxt.vo.ZhaoPinInfo;

@Service
@Transactional(readOnly = false)
public class ZhaoPinService2 {
	@Resource
	private ZhaoPinRepository zhaoPinRepository;
	@Resource
	private InterviewRepository interviewRepository;
	@Resource
	private LoginRepository loginRepository;
	@Resource
	private UserRepository userRepository;
	@Resource
	private DeptRepository deptRepository;
	@Resource
	private JobRepository jobRepository;
	
	
	//试用期列表
	public List<UserInfo> findYgsx() {
		List<UserInfo> list = new ArrayList<>();
		List<User> u = this.userRepository.findByState(Contant.YG_SX);
		Job job = new Job();
		Dept dept = new Dept();
		if (!u.isEmpty()) {
			for (User user : u) {
				UserInfo fo = new UserInfo();
				job = this.jobRepository.findByJobNo(user.getJobNo());
				dept = this.deptRepository.findByDeptNo(user.getDeptNo());
				fo.setDeptNo(dept.getDeptName());
				fo.setJobNo(job.getJobName());
				fo.setLzsqTime(user.getLzsqTime());
				fo.setUserName(user.getUserName());
				fo.setUserNo(user.getUserNo());
				fo.setUserSex(user.getUserSex());
				fo.setUserTel(user.getUserTel());
				fo.setXueli(user.getXueli());
				fo.setState(user.getState());
				list.add(fo);
			}
		}
		return list;
	}


	//是否转正
	public void updStatus(String userNo,Date date,int status) {
		userRepository.zzPass(userNo,date,status);
	}

	//发布招聘信息
	public void sqfb(ZhaoPinInfo zhaoPinInfo) {
		//ZhaoPin zpInfo = this.zhaoPinRepository.findByZpNo(Integer.parseInt(applyJobInfo.getJobNo()));
		Date d = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		ZhaoPin zhaoPin = new ZhaoPin();
		//Random r = new Random();
		//zhaoPin.setZpNo(r.nextInt(11));
		zhaoPin.setDescription(zhaoPinInfo.getDescription());
		zhaoPin.setLastDate(zhaoPinInfo.getLastDate());
		zhaoPin.setSalary(zhaoPinInfo.getSalary());
		zhaoPin.setZpOwn(zhaoPinInfo.getZpOwn());
		zhaoPin.setZpDept(zhaoPinInfo.getZpDept());
		zhaoPin.setZpJob(zhaoPinInfo.getZpJob());
		zhaoPin.setZpNum(zhaoPinInfo.getZpNum());
		zhaoPin.setWorkAddr(zhaoPinInfo.getWorkAddr());
		zhaoPin.setZpState(1);
		this.zhaoPinRepository.save(zhaoPin);
	}
	
}
