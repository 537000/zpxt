package com.zpxt.repository;


import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.zpxt.pojo.User;


@Repository
public interface UserRepository extends JpaRepository<User, String> {

	public User findByUserNo(String userNo);

	public List<User> findByStateOrState(int ygState, int ygLzsq);

	public List<User> findByUserNameLike(String userName);

	@Modifying
	@Query("update User u set u.lzsqTime=?2,u.state=?3 where u.userNo = ?1") 
	public void lzsq(String userNo, Date sqTime, int ygLzsq);

	@Modifying
	@Query("update User u set u.lzTime=?2,u.state=?3 where u.userNo = ?1") 
	public void lzUnpass(String userNo, Date spTime, int ygLz);

	@Modifying
	@Query("update User u set u.lzTime=?2,u.state=?3 where u.userNo = ?1") 
	public void lzPass(String userNo, Date spTime, int ygLz);
	
	@Modifying
	@Query("update User u set u.lzTime=?2,u.state=?3 where u.userNo = ?1") 
	public void zzPass(String userNo, Date spTime, int ygLz);

	public List<User> findByState(int ygLzsq);

}
