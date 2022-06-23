package com.ez.launer.point.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PointViewVO {
	private int pointNo;
	private int usersNo;
	private int orderNo;
	private Timestamp regdate;
	private int totalPrice;
	private int point;
}
