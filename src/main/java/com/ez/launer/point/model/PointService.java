package com.ez.launer.point.model;

import java.util.List;

public interface PointService {
//	PointViewVO selectPointHistory(int usersNo);
	List<PointDetailAllVO> selectPointHistory(int userNo);
}
