package com.zpxt.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zpxt.pojo.User;
import com.zpxt.repository.UserInfoListRespository;


public class UserInfoListService {
    List<User> list;
	@Resource
	private UserInfoListRespository userInfoListRespository;

	public int updateUserStatus(String user_no,String status) {
		try {
			//userInfoListRespository.updateUserStatus(user_no,status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 1;
	}

	public List<User> findAll() {
		//userInfoListRespository.findAll();
		return list;
	}

}
