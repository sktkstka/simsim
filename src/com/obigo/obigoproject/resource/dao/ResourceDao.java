package com.obigo.obigoproject.resource.dao;

import java.util.List;

import com.obigo.obigoproject.vo.ResourceVO;

public interface ResourceDao {

	public int insertResource(ResourceVO vo);

	public int updateResource(ResourceVO vo);

	public int deleteResource(int resourceNumber);

	public List<ResourceVO> getResourceListBybundleKey(String bundleKey);
	
	public List<ResourceVO> getResourceList();

	public ResourceVO getResource(int resourceNumber);

}
