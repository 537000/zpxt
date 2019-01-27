package com.zpxt.repository;



import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.zpxt.pojo.Interview;


@Repository
public interface InterviewRepository extends JpaRepository<Interview, Integer> {

	Interview findByInterviewNo(int i);

	@Modifying
	@Query("update Interview u set u.passTime=?3,u.interviewState=?2 where u.interviewNo = ?1") 
	void applyPass(int i, int ypTg, Date spTime);

}
