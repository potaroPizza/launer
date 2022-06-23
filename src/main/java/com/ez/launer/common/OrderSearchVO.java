package com.ez.launer.common;

public class OrderSearchVO extends SearchVO {
	private String startDay;		//시작일
	private String endDay;			//종료일
	private String adminId;			//관리자 아이디
	private int officeNo;			//지점번호
	private int statusNo;			//주문상태번호
	private String officeName;		//지점명
	private String orderStatus;		//주문상태
	private String userEmail;		//주문자
	private int countPerPage;		//페이지당 조회할 레코드 수
	
	public OrderSearchVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderSearchVO(String startDay, String endDay, String adminId, int officeNo, int statusNo, String officeName,
			String orderStatus, String userEmail, int countPerPage) {
		super();
		this.startDay = startDay;
		this.endDay = endDay;
		this.adminId = adminId;
		this.officeNo = officeNo;
		this.statusNo = statusNo;
		this.officeName = officeName;
		this.orderStatus = orderStatus;
		this.userEmail = userEmail;
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

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public int getOfficeNo() {
		return officeNo;
	}

	public void setOfficeNo(int officeNo) {
		this.officeNo = officeNo;
	}

	public int getStatusNo() {
		return statusNo;
	}

	public void setStatusNo(int statusNo) {
		this.statusNo = statusNo;
	}

	public String getOfficeName() {
		return officeName;
	}

	public void setOfficeName(String officeName) {
		this.officeName = officeName;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	@Override
	public String toString() {
		return "OrderSearchVO [startDay=" + startDay + ", endDay=" + endDay + ", adminId=" + adminId + ", officeNo="
				+ officeNo + ", statusNo=" + statusNo + ", officeName=" + officeName + ", orderStatus=" + orderStatus
				+ ", userEmail=" + userEmail + ", countPerPage=" + countPerPage + ", getSearchCondition()="
				+ getSearchCondition() + ", getSearchKeyword()=" + getSearchKeyword() + ", getSearchUseYn()="
				+ getSearchUseYn() + ", getCurrentPage()=" + getCurrentPage() + ", getBlockSize()=" + getBlockSize()
				+ ", getFirstRecordIndex()=" + getFirstRecordIndex() + ", getLastRecordIndex()=" + getLastRecordIndex()
				+ ", getRecordCountPerPage()=" + getRecordCountPerPage() + ", toString()=" + super.toString()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	
	
	
}
