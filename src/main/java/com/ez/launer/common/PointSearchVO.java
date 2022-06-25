package com.ez.launer.common;

import java.sql.Timestamp;

public class PointSearchVO extends SearchVO {
	private int pointNo;
	private int usersNo;
	private int orderNo;
	private Timestamp regdate;
	private int totalPrice;
	private int point;
	private int countPerPage;
	
	public PointSearchVO() {
		super();
	}

	public PointSearchVO(int pointNo, int usersNo, int orderNo, Timestamp regdate, int totalPrice, int point,
			int countPerPage) {
		super();
		this.pointNo = pointNo;
		this.usersNo = usersNo;
		this.orderNo = orderNo;
		this.regdate = regdate;
		this.totalPrice = totalPrice;
		this.point = point;
		this.countPerPage = countPerPage;
	}

	public int getPointNo() {
		return pointNo;
	}

	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
	}

	public int getUsersNo() {
		return usersNo;
	}

	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	@Override
	public String toString() {
		return "PointSearchVO [pointNo=" + pointNo + ", usersNo=" + usersNo + ", orderNo=" + orderNo + ", regdate="
				+ regdate + ", totalPrice=" + totalPrice + ", point=" + point + ", countPerPage=" + countPerPage
				+ ", getSearchCondition()=" + getSearchCondition() + ", getSearchKeyword()=" + getSearchKeyword()
				+ ", getSearchUseYn()=" + getSearchUseYn() + ", getCurrentPage()=" + getCurrentPage()
				+ ", getBlockSize()=" + getBlockSize() + ", getFirstRecordIndex()=" + getFirstRecordIndex()
				+ ", getLastRecordIndex()=" + getLastRecordIndex() + ", getRecordCountPerPage()="
				+ getRecordCountPerPage() + ", toString()=" + super.toString() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + "]";
	}

}
