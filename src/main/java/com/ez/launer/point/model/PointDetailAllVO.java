package com.ez.launer.point.model;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class PointDetailAllVO {
	private PointViewVO pointViewVO;
	private List<Map<String, Object>> orderDetails;
}
