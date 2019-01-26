package com.zpxt.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.zpxt.pojo.Job;


@Repository
public interface JobRepository extends JpaRepository<Job, Integer> {

	Job findByJobNo(int i);

}
