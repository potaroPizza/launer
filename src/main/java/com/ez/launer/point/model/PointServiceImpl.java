package com.ez.launer.point.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PointServiceImpl implements PointService {
	private final PointDAO pointDAO;

	@Override
	public PointViewVO selectPointHistory(int usersNo) {
		return pointDAO.selectPointHistory(usersNo);
	}

}
