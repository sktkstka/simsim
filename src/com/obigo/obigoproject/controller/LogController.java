package com.obigo.obigoproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.obigo.obigoproject.log.service.LogService;
import com.obigo.obigoproject.vo.LogVO;

@Controller
public class LogController {
	@Autowired
	LogService logService;

	/**
	 * DB가 가지고 있는 전체 로그 데이터 삭제 기능
	 * 
	 * @return 로그 조회 페이지
	 */
	@RequestMapping("/deletelog")
	public String deleteLog() {

		logService.deleteAllLog();

		return null;
	}

	/**
	 * 현재 가지고있는 로그 데이터를 pdf파일로 변경하여 관리자에게 E-Mail로 전송
	 * 
	 * @return 로그 조회 페이지
	 */
	@RequestMapping("/sendemail")
	public String sendEmail() {
		List<LogVO> list = logService.getLogList();
		/////// 알아서 하시오//

		return null;
	}
}
