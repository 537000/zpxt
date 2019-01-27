package com.zpxt.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zpxt.pojo.User;
import com.zpxt.pojo.ZhaoPin;
import com.zpxt.service.UserInfoListService;


public class UserInfoListController {
	//@Resource
	//private UserInfoListService userInfoListService;
	
	@RequestMapping("findAll")
	public String findAll(ModelAndView mav,Model model) {
	 //   List<User> list=userInfoListService.findAll();
		//model.addAttribute("userList", list);
		return "userInfoList/user_list";

	}
	
	@RequestMapping("upStatus")
	public String upStatus(ModelAndView mav,Model model,String user_no,String status) {
	//	userInfoListService.updateUserStatus(user_no,user_no);
		return "userInfoList/user_list";
	}
}
