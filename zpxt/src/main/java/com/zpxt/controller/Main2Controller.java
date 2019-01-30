package com.zpxt.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zpxt.pojo.User;
import com.zpxt.service.ZhaoPinService;
import com.zpxt.service.ZhaoPinService2;
import com.zpxt.util.Contant;
import com.zpxt.vo.ApplyJobInfo;
import com.zpxt.vo.InterviewInfo;
import com.zpxt.vo.UserInfo;
import com.zpxt.vo.ZhaoPinInfo;

@Controller
public class Main2Controller {

	@Resource
	private ZhaoPinService zhaoPinService;
	@Resource
	private ZhaoPinService2 zhaoPinService2;
	private static SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	@RequestMapping("zzxx")
	public String query(Model model) {
		List<UserInfo> zzxx = zhaoPinService2.findYgsx();
		model.addAttribute("zzxx", zzxx);
		return "zzxx/zzxx_list";
	}
    //是否转正 1在职 2离职
	@RequestMapping("upstate")
	public String update(Model model,String userNo,String status) {
		Date date =new Date();
		if (status.equals("2")) {
			zhaoPinService2.updStatus(userNo, date,Contant.YG_LZ);
		}
		if(status.equals("1")) {
			zhaoPinService2.updStatus(userNo, date,Contant.YG_ZZ);
		}	
		List<UserInfo> zzxx = zhaoPinService2.findYgsx();
		model.addAttribute("zzxx", zzxx);
		return "zzxx/zzxx_list";
	}
	
	//面试信息
	@RequestMapping("msxx")
	public String ypxx(Model model) {
		List<InterviewInfo> ypxx = zhaoPinService.findYpxx();
		model.addAttribute("ypxx", ypxx);
		return "msxx/add_zpxx";
	}
	
	 //经理发布岗位跳转 
	@RequestMapping("addzp")
	public String addzp(Model model) {
		return "zpxx/add_zpxx";
	}

	@RequestMapping("sqfb")
	@ResponseBody
	public String sqfb(ZhaoPinInfo zhaoPinInfo,String lastDates,String jobNo) throws ParseException {		
		if(jobNo.equalsIgnoreCase("8")) {			
			return "该操作只有经理拥有权限";
		}
		System.out.println(zhaoPinInfo);
		Date lastDate=simpleDateFormat.parse(lastDates);
		zhaoPinInfo.setLastDate(lastDate);
		zhaoPinService2.sqfb(zhaoPinInfo);
		return "success";
	}
}
