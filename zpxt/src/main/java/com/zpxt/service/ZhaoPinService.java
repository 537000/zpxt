package com.zpxt.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zpxt.pojo.Dept;
import com.zpxt.pojo.Interview;
import com.zpxt.pojo.Job;
import com.zpxt.pojo.Login;
import com.zpxt.pojo.User;
import com.zpxt.pojo.ZhaoPin;
import com.zpxt.repository.DeptRepository;
import com.zpxt.repository.InterviewRepository;
import com.zpxt.repository.JobRepository;
import com.zpxt.repository.LoginRepository;
import com.zpxt.repository.UserRepository;
import com.zpxt.repository.ZhaoPinRepository;
import com.zpxt.util.Contant;
import com.zpxt.util.JavaMailUtil;
import com.zpxt.vo.ApplyJobInfo;
import com.zpxt.vo.InterviewInfo;
import com.zpxt.vo.UserInfo;
import com.zpxt.vo.ZhaoPinInfo;

@Service
@Transactional(readOnly = false)
public class ZhaoPinService {

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

	public List<ZhaoPinInfo> findByZpState() {
		List<ZhaoPinInfo> list = new ArrayList<>();
		List<ZhaoPin> u = this.zhaoPinRepository.findByZpState(Contant.ZP_STATE);
		Job job = new Job();
		Dept dept = new Dept();
		if (!u.isEmpty()) {
			for (ZhaoPin zhaoPin : u) {
				ZhaoPinInfo fo = new ZhaoPinInfo();
				job = this.jobRepository.findByJobNo(Integer.parseInt(zhaoPin.getZpJob()));
				dept = this.deptRepository.findByDeptNo(Integer.parseInt(zhaoPin.getZpDept()));
				fo.setZpDept(dept.getDeptName());
				fo.setZpJob(job.getJobName());
				fo.setDescription(zhaoPin.getDescription());
				fo.setZpNum(zhaoPin.getZpNum());
				fo.setSalary(zhaoPin.getSalary());
				fo.setWorkAddr(zhaoPin.getWorkAddr());
				fo.setLastDate(zhaoPin.getLastDate());
				fo.setZpNo(zhaoPin.getZpNo());
				fo.setZpOwn(zhaoPin.getZpOwn());
				list.add(fo);
			}
		}
		return list;
	}

	public List<InterviewInfo> findYpxx() {
		List<InterviewInfo> ll = new ArrayList<>();
		List<Interview> list = this.interviewRepository.findAll();
		Job job = new Job();
		Dept dept = new Dept();
		if (!list.isEmpty()) {
			for (Interview interview : list) {
				InterviewInfo fo = new InterviewInfo();
				job = this.jobRepository.findByJobNo(Integer.parseInt(interview.getYpzw()));
				dept = this.deptRepository.findByDeptNo(Integer.parseInt(interview.getYpbm()));
				fo.setYpbm(job.getJobName());
				fo.setYpbm(dept.getDeptName());
				fo.setApplyTime(interview.getApplyTime());
				fo.setEmail(interview.getEmail());
				fo.setHope(interview.getHope());
				fo.setInterviewAddr(interview.getInterviewAddr());
				fo.setInterviewNo(interview.getInterviewNo());
				fo.setInterviewOwn(interview.getInterviewOwn());
				fo.setInterviewState(interview.getInterviewState());
				fo.setInterviewUser(interview.getInterviewUser());
				fo.setSex(interview.getSex());
				fo.setTelphone(interview.getTelphone());
				fo.setWork(interview.getWork());
				fo.setYpbm(dept.getDeptName());
				fo.setYpzw(job.getJobName());
				fo.setZpgz(interview.getZpgz());
				ll.add(fo);
			}
		}
		return ll;
	}

	public void applyJob(ApplyJobInfo applyJobInfo) {
		ZhaoPin zpInfo = this.zhaoPinRepository.findByZpNo(Integer.parseInt(applyJobInfo.getJobNo()));
		Date d = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		Interview interview = new Interview();
		Random r = new Random();
		interview.setInterviewNo(Integer.parseInt(format.format(d)) + r.nextInt(100));
		interview.setEmail(applyJobInfo.getEmail());
		interview.setInterviewAddr(zpInfo.getWorkAddr());
		interview.setApplyTime(new Date());
		interview.setInterviewOwn(zpInfo.getZpOwn());
		interview.setInterviewState(0);
		interview.setInterviewUser(applyJobInfo.getUsername());
		interview.setSex(applyJobInfo.getSex().toCharArray()[0]);
		interview.setTelphone(applyJobInfo.getTel());
		interview.setWork(applyJobInfo.getWork());
		interview.setHope(applyJobInfo.getHope());
		interview.setYpbm(zpInfo.getZpDept());
		interview.setYpzw(zpInfo.getZpJob());
		interview.setZpgz(zpInfo.getSalary());
		interview.setInterviewState(0);
		this.interviewRepository.save(interview);
	}

	public String login(String username, String password, String logintype) {
		Login user1 = this.loginRepository.findByLoginNoAndPassword(username, password);
		Login user2 = this.loginRepository.findByLoginNo(username);
		if (user2 == null) {
			return "用户名不存在";
		}
		if (user1 == null) {
			return "用户名与密码不匹配";
		}
		if (!logintype.equals(user2.getUserType())) {
			return "用户名与登录类型不匹配";
		}
		return "success";
	}

	public User getUserInfo(String username) {
		return this.userRepository.findByUserNo(username);
	}

	public String updateInfo(String userNo, String username, String password, String email, String userTel) {
		String res = "更新资料成功";
		User user = this.userRepository.findByUserNo(userNo);
		Login login = this.loginRepository.findByLoginNo(userNo);
		if (!password.equals(login.getPassword())) {
			res = "更新资料且密码重置成功，请重新登录";
		}
		user.setUserName(username);
		user.setEmail(email);
		user.setUserTel(userTel);
		login.setPassword(password);
		this.userRepository.save(user);
		this.loginRepository.save(login);
		return res;
	}

	public List<UserInfo> findYgxx() {
		List<UserInfo> list = new ArrayList<>();
		List<User> u = this.userRepository.findByStateOrState(Contant.YG_ZZ, Contant.YG_LZSQ);
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

	public List<User> findByUserName(String userName) {
		return this.userRepository.findByUserNameLike("%" + userName + "%");
	}

	public String lzsq(String userNo) {
		Date sqTime = new Date();
		try {
			this.userRepository.lzsq(userNo, sqTime, Contant.YG_LZSQ);
		} catch (Exception e) {
			e.printStackTrace();
			return "申请失败";
		}
		return "申请成功";
	}

	public List<UserInfo> getLzsqlb() {
		List<UserInfo> list = new ArrayList<>();
		List<User> u = this.userRepository.findByState(Contant.YG_LZSQ);
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
				list.add(fo);
			}
		}
		return list;
	}

	public String lzPass(String userNo, HttpServletRequest request) {
		Date spTime = new Date();
		try {
			User user = this.userRepository.findByUserNo(userNo);
			this.userRepository.lzPass(userNo, spTime, Contant.YG_LZ);

			// 设置邮件标题
			String subject = "离职申请通知-----请勿回复！";
			// 设置邮件内容
			StringBuffer content = new StringBuffer();
			content.append("<span style='color:red;font-size:20px'>" + user.getUserName() + "</span>");
			content.append(":你的离职申请已审批通过，感谢你在公司的辛劳付出，祝你早日找到下家！<br/>");

			JavaMailUtil.sendMail(user.getEmail(), subject, content.toString());
		} catch (Exception e) {
			e.printStackTrace();
			return "操作失败";
		}
		return "操作成功";
	}

	public String lzUnpass(String userNo, HttpServletRequest request) {
		Date spTime = new Date();
		try {
			User user = this.userRepository.findByUserNo(userNo);
			this.userRepository.lzUnpass(userNo, spTime, Contant.YG_ZZ);
			// 设置邮件标题
			String subject = "离职申请通知-----请勿回复！";
			// 设置邮件内容
			StringBuffer content = new StringBuffer();
			content.append("<span style='color:red;font-size:20px'>" + user.getUserName() + "</span>");
			content.append(":你的离职申请暂时审批不通过，希望你再慎重考虑在做决定！<br/>");

			JavaMailUtil.sendMail(user.getEmail(), subject, content.toString());
		} catch (Exception e) {
			e.printStackTrace();
			return "操作失败";
		}
		return "操作成功";
	}

	public String applyPass(String interviewNo, HttpServletRequest request) {
		Date spTime = new Date();
		try {
			Interview interview = this.interviewRepository.findByInterviewNo(Integer.parseInt(interviewNo));
			this.interviewRepository.applyPass(Integer.parseInt(interviewNo),Contant.YP_TG,spTime);

			// 设置邮件标题
			String subject = "面试邀请通知-----收到请回复！";
			// 设置邮件内容
			StringBuffer content = new StringBuffer();
			content.append("<span style='color:red;font-size:20px'>" + interview.getInterviewUser() + "</span>");
			content.append(":你的应聘申请已审批通过，希望你明天上午10点能来公司参与面试，不见不散！<br/>");
			content.append("面试地址："+interview.getInterviewAddr()+"<br/>");
			content.append("联系人："+interview.getInterviewOwn()+"<br/>");

			JavaMailUtil.sendMail(interview.getEmail(), subject, content.toString());
		} catch (Exception e) {
			e.printStackTrace();
			return "操作失败";
		}
		return "操作成功";
	}

	public String applyFail(String interviewNo, HttpServletRequest request) {
		Date spTime = new Date();
		try {
			this.interviewRepository.applyPass(Integer.parseInt(interviewNo),Contant.YP_BTG,spTime);

		} catch (Exception e) {
			e.printStackTrace();
			return "操作失败";
		}
		return "操作成功";
	}
}
