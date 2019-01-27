package com.zpxt.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.zpxt.service.ZhaoPinService;



@Controller
public class MainController {

	@Resource
	private ZhaoPinService zhaoPinService;
	
	@RequestMapping("zpxt")
	public String main() {
		return "login";
	}
	
	@RequestMapping("index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("showZpgwxx")
	public String showZpgwxx(Model model) {
		List<ZhaoPinInfo> zpxx = zhaoPinService.findByZpState();
		model.addAttribute("zpxx", zpxx);
		return "zpxx/zpxx_list";
	}
	
	@RequestMapping("ypxx")
	public String ypxx(Model model) {
		List<InterviewInfo> ypxx = zhaoPinService.findYpxx();
		model.addAttribute("ypxx", ypxx);
		return "ypxx/ypxx_list";
	}
	
	@RequestMapping("ygxx")
	public String ygxx(Model model) {
		List<UserInfo> ygxx = zhaoPinService.findYgxx();
		model.addAttribute("ygxx", ygxx);
		return "ygxx/ygxx_list";
	}
	
	@RequestMapping("query")
	public String ygxx(String userName,Model model) {
		List<User> ygxx = zhaoPinService.findByUserName(userName);
		model.addAttribute("ygxx", ygxx);
		return "ygxx/ygxx_list";
	}
	
	@RequestMapping("apply")
	public String showApplyJob(String jobNo,Model model) {
		model.addAttribute("jobNo", jobNo);
		return "zpxx/applyJob";
	}
	
	@RequestMapping("applyJob")
	@ResponseBody
	public String applyJOb(ApplyJobInfo applyJobInfo) {
		System.out.println(applyJobInfo);
		String result = filterInfo(applyJobInfo);
		if(!"success".equals(result)) {
			return result;
		}
		zhaoPinService.applyJob(applyJobInfo);
		return "success";
	}

	@RequestMapping("login")
	@ResponseBody
	public String login(String username,String password,String logintype,HttpServletRequest request) {
		if(StringUtils.isEmpty(username)) {
			return "用户名不能为空";
		}
		if(StringUtils.isEmpty(username)) {
			return "密码不能为空";
		}
		String flag = zhaoPinService.login(username,password,logintype);
		if(!"success".equals(flag)) {
			return flag;
		}
		User user = this.zhaoPinService.getUserInfo(username);
		request.getSession().setAttribute("password", password);
		request.getSession().setAttribute("user", user);
		return "success";
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		//清楚session中的登录信息
		request.getSession().removeAttribute("user");
		return "login";
	}
	
	@RequestMapping("updateInfo")
	@ResponseBody
	public String updateInfo(String userName,String password,String email,String userTel,HttpServletRequest request) throws Exception {
		User user = (User)request.getSession().getAttribute("user");
		//更新其他信息
		String info = this.zhaoPinService.updateInfo(user.getUserNo(),
				userName,password,email,userTel);
		User newUser = this.zhaoPinService.getUserInfo(user.getUserNo());
		//移除session中原来的user信息，放入新的user信息
		request.getSession().removeAttribute("user");
		request.getSession().setAttribute("user",newUser);
		return info;
	}
	
	@RequestMapping("myInfo")
	public String myInfo() {
		return "myInfo/myInfo";
	}
	
	@RequestMapping("lzsqlb")
	public String lzsqlb(Model model) {
		List<UserInfo> lzsqlb = zhaoPinService.getLzsqlb();
		model.addAttribute("lzsqlb", lzsqlb);
		return "myInfo/lzsqlb";
	}
	
	@RequestMapping("lzPass")
	@ResponseBody
	public String lzPass(String userNo,HttpServletRequest request) {
		String result = this.zhaoPinService.lzPass(userNo,request);
		return result;
	}
	
	@RequestMapping("lzUnpass")
	@ResponseBody
	public String lzUnpass(String userNo,HttpServletRequest request) {
		String result = this.zhaoPinService.lzUnpass(userNo,request);
		return result;
	}
	
	@RequestMapping("applyPass")
	@ResponseBody
	public String applyPass(String zpNo,HttpServletRequest request) {
		String result = this.zhaoPinService.applyPass(zpNo,request);
		return result;
	}
	
	@RequestMapping("applyFail")
	@ResponseBody
	public String applyFail(String zpNo,HttpServletRequest request) {
		String result = this.zhaoPinService.applyFail(zpNo,request);
		return result;
	}
	
	public String filterInfo(ApplyJobInfo applyJobInfo) {
		if(StringUtils.isBlank(applyJobInfo.getUsername())) {
			return "申请人姓名不能为空";
		}
		if(StringUtils.isBlank(applyJobInfo.getTel())) {
			return "申请人联系方式不能为空";
		}
		if(StringUtils.isBlank(applyJobInfo.getEmail())) {
			return "申请人联系邮箱不能为空";
		}
		if(StringUtils.isBlank(applyJobInfo.getWork())) {
			return "申请人工作经历不能为空";
		}
		if(StringUtils.isBlank(applyJobInfo.getSex())) {
			return "申请人性别不能为空";
		}
		return "success";
	}
}
