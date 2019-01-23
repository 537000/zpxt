package com.zpxt.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zpxt.pojo.ZhaoPin;
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
	public String showZpgwxx(ModelAndView mav,Model model) {
		List<ZhaoPin> zpxx = zhaoPinService.findByZpState();
		System.out.println(zpxx);
		//mav.addObject("zpxx", zpxx);
		model.addAttribute("zpxx", zpxx);
		return "zpxx/zpxx_list";
	}
}
