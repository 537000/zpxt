package com.zpxt.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.zpxt.pojo.ZhaoPin;


@Repository
public interface ZhaoPinRepository extends JpaRepository<ZhaoPin, Integer> {

	public List<ZhaoPin> findByZpState(int zpState);
	public ZhaoPin findByZpNo(int i);
}
