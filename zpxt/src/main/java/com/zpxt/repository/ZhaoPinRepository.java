package com.zpxt.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.zpxt.pojo.ZhaoPin;


@Repository
public interface ZhaoPinRepository extends JpaRepository<ZhaoPin, String> {

	public List<ZhaoPin> findByZpState(int zpState);
}
