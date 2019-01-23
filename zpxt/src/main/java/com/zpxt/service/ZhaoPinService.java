package com.zpxt.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zpxt.pojo.ZhaoPin;
import com.zpxt.repository.ZhaoPinRepository;
import com.zpxt.util.Contant;

@Service
public class ZhaoPinService{

	@Resource
	private ZhaoPinRepository zhaoPinRepository;
	
	public List<ZhaoPin> findByZpState(){
		return this.zhaoPinRepository.findByZpState(Contant.ZP_STATE);
	}
}
