package com.ez.launer.point.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PointDAO {
	PointViewVO selectPointHistory(int usersNo);
	
}
