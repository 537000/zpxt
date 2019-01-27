package com.zpxt.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.zpxt.pojo.Login;
import com.zpxt.pojo.User;
import com.zpxt.pojo.ZhaoPin;


@Repository
public interface LoginRepository extends JpaRepository<Login, String> {

	public Login findByLoginNo(String loginNo);
	public Login findByLoginNoAndPassword(String loginNo,String password);
	public Login findByLoginNoAndUserType(String loginNo,String userType);
}
