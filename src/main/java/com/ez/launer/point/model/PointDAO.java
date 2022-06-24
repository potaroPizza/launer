package com.ez.launer.point.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.launer.common.PointSearchVO;
import com.ez.launer.common.SearchVO;

@Mapper
public interface PointDAO {
//	PointViewVO selectPointHistory(int usersNo);
	
	List<PointDetailAllVO> selectPointHistory(int userNo);
	int PointSelectTotalRecord(PointSearchVO searchVo);
	List<Map<String, Object>>PointSelectList(SearchVO searchVo);
}
