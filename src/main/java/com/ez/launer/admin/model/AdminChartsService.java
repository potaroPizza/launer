package com.ez.launer.admin.model;

import java.util.List;
import java.util.Map;

public interface AdminChartsService {
	List<Map<String, Object>> selectVisitByDay();
	List<Map<String, Object>> selectVisitByMonth();
	
	List<Map<String, Object>> selectJoinByDay();
	List<Map<String, Object>> selectjoinByMonth();
	
	List<Map<String, Object>> selectUsersByDay();
	List<Map<String, Object>> selectUsersByMonth();
	
	List<Map<String, Object>> selectRevenueByMonth(int officeNo);
	
	List<Map<String, Object>> selectAdminCategory();
}
