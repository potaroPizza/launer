package com.ez.launer.point.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PointServiceImpl implements PointService {
	private final PointDAO pointDAO;

	@Override
	public List<PointDetailAllVO> selectPointHistory(int userNo) {
		return pointDAO.selectPointHistory(userNo);
	}

	/*
	 * @Override public PointViewVO selectPointHistory(int usersNo) { return
	 * pointDAO.selectPointHistory(usersNo); }
	 */

}
