package com.zpxt.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.zpxt.pojo.Dept;
import com.zpxt.pojo.Interview;


@Repository
public interface DeptRepository extends JpaRepository<Dept, Integer> {

	Dept findByDeptNo(int string);

}
