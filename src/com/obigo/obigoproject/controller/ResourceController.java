package com.obigo.obigoproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.obigo.obigoproject.bundle.service.BundleService;
import com.obigo.obigoproject.resource.service.ResourceService;
import com.obigo.obigoproject.vo.BundleVO;
import com.obigo.obigoproject.vo.ResourceVO;

import net.sf.json.JSONObject;

@Controller
public class ResourceController {
	@Autowired
	ResourceService resourceService;
	@Autowired
	BundleService bundleService;

	/**
	 * 리소스 등록 폼에서 등록 요청이 들어오면 등록해주는 기능
	 * 
	 * @return 리소스 관리 페이지
	 */
	@RequestMapping("/insertresource")
	public String insertResource(ResourceVO vo) {
		resourceService.insertResource(vo);
		return "redirect:/resource";
	}

	/**
	 * 리소스 수정 폼에서 수정 요청이 들어오면 수정해주는 기능
	 * 
	 * @return 리소스 관리 페이지
	 */
	@RequestMapping("/updateresource")
	public String updateResource(ResourceVO vo) {
		resourceService.updateResource(vo);
		return "redirect:/resource";
	}

	/**
	 * 리소스 조회 페이지에서 해당 리소스 삭제 버튼 클릭시 리소스 삭제해주는 기능
	 * 
	 * @return 리소스 관리 페이지
	 */
	@RequestMapping("/deleteresource")
	@ResponseBody
	public String deleteResource(@RequestParam int resourceNumber) {
		JSONObject jobj = new JSONObject();
		if (resourceService.deleteResource(resourceNumber) == true) {
			jobj.put("flag", true);
			return jobj.toString();
		} else {
			jobj.put("flag", false);
			return jobj.toString();
		}
	}

	/**
	 * 리소스 조회 페이지에서 번들 클릭시 해당 번들의 Resource리스트를 보여주는 기능
	 * 
	 * @return 리소스 관리 페이지
	 */
	@RequestMapping("/selectresource")
	public String selectResource(String bundleKey, HttpSession session) {
		List<ResourceVO> resourcelist = resourceService.getResourceListBybundleKey(bundleKey);
		session.setAttribute("resourceList", resourcelist);
		return "redirect:/resource";
	}

}
