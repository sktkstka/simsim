package com.obigo.obigoproject.androiduservehicle.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/spring/applicationContext.xml" })
public class androiduservehicleServiceTest {

	@Autowired
	AndroidUserVehicleService androiduservehicleService;
	
	@Test
	public void getAndroidUserVehicleListByUseridTest(){
		System.out.println(androiduservehicleService.getAndroidUserVehicleListByUserid("ssung"));
	}
}
