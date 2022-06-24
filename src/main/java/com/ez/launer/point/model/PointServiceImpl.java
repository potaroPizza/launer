package com.ez.launer.point.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ez.launer.common.OrderSearchVO;
import com.ez.launer.common.PointSearchVO;
import com.ez.launer.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PointServiceImpl implements PointService {
	private final PointDAO pointDAO;

	@Override
	public List<PointDetailAllVO> selectPointHistory(int userNo) {
		return pointDAO.selectPointHistory(userNo);
	}

	@Override
	public int PointSelectTotalRecord(PointSearchVO searchVo) {
		return pointDAO.PointSelectTotalRecord(searchVo);
	}

	@Override
	public List<Map<String, Object>> PointSelectList(SearchVO searchVo) {
		return pointDAO.PointSelectList(searchVo);
	}


	/*
	 * @Override public PointViewVO selectPointHistory(int usersNo) { return
	 * pointDAO.selectPointHistory(usersNo); }
	 */

}
