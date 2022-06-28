package com.ez.launer.common;

import java.sql.Timestamp;

public class PaymentSearchVO extends SearchVO {
	private String startDay;
	private String endDay;
	private int orderNo;
	private int usersNo;
	private int statusNo;
	private Timestamp regdate;
	private int totalPrice;
	private String categoryName;
	private String status;
	private int countPerPage;
	
	public PaymentSearchVO() {
		super();
	}

	public PaymentSearchVO(String startDay, String endDay, int orderNo, int usersNo, int statusNo, Timestamp regdate,
			int totalPrice, String categoryName, String status, int countPerPage) {
		super();
		this.startDay = startDay;
		this.endDay = endDay;
		this.orderNo = orderNo;
		this.usersNo = usersNo;
		this.statusNo = statusNo;
		this.regdate = regdate;
		this.totalPrice = totalPrice;
		this.categoryName = categoryName;
		this.status = status;
		this.countPerPage = countPerPage;
	}

	public String getStartDay() {
		return startDay;
	}

	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	public String getEndDay() {
		return endDay;
	}

	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getUsersNo() {
		return usersNo;
	}

	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	public int getStatusNo() {
		return statusNo;
	}

	public void setStatusNo(int statusNo) {
		this.statusNo = statusNo;
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

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	@Override
	public String toString() {
		return "PaymentSearchVO [startDay=" + startDay + ", endDay=" + endDay + ", orderNo=" + orderNo + ", usersNo="
				+ usersNo + ", statusNo=" + statusNo + ", regdate=" + regdate + ", totalPrice=" + totalPrice
				+ ", categoryName=" + categoryName + ", status=" + status + ", countPerPage=" + countPerPage
				+ ", getSearchCondition()=" + getSearchCondition() + ", getSearchKeyword()=" + getSearchKeyword()
				+ ", getSearchUseYn()=" + getSearchUseYn() + ", getCurrentPage()=" + getCurrentPage()
				+ ", getBlockSize()=" + getBlockSize() + ", getFirstRecordIndex()=" + getFirstRecordIndex()
				+ ", getLastRecordIndex()=" + getLastRecordIndex() + ", getRecordCountPerPage()="
				+ getRecordCountPerPage() + ", toString()=" + super.toString() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + "]";
	}

}
