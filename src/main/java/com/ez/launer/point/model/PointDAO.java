package com.ez.launer.point.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PointDAO {
//	PointViewVO selectPointHistory(int usersNo);
	
	List<PointDetailAllVO> selectPointHistory(int userNo);
	
}
