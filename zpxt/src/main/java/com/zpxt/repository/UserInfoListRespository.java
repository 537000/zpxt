package com.zpxt.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.zpxt.pojo.User;
import com.zpxt.pojo.ZhaoPin;


public interface  UserInfoListRespository extends JpaRepository<User, String> {
       //  public int updateUserStatus(String user_no,String status);

}
