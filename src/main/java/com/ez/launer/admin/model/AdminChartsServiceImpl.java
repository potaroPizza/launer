package com.ez.launer.admin.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminChartsServiceImpl implements AdminChartsService {
	
	private final AdminChartsDAO adminChartsDAO;

	@Override
	public List<Map<String, Object>> selectVisitByDay() {
		return adminChartsDAO.selectVisitByDay();
	}

	@Override
	public List<Map<String, Object>> selectVisitByMonth() {
		return adminChartsDAO.selectVisitByMonth();
	}

	@Override
	public List<Map<String, Object>> selectJoinByDay() {
		return adminChartsDAO.selectJoinByDay();
	}

	@Override
	public List<Map<String, Object>> selectjoinByMonth() {
		return adminChartsDAO.selectjoinByMonth();
	}

	@Override
	public List<Map<String, Object>> selectUsersByDay() {
		return adminChartsDAO.selectUsersByDay();
	}

	@Override
	public List<Map<String, Object>> selectUsersByMonth() {
		return adminChartsDAO.selectUsersByMonth();
	}

	@Override
	public List<Map<String, Object>> selectRevenueByMonth(int officeNo) {
		return adminChartsDAO.selectRevenueByMonth(officeNo);
	}

	@Override
	public List<Map<String, Object>> selectAdminCategory() {
		return adminChartsDAO.selectAdminCategory();
	}
	
	
}
