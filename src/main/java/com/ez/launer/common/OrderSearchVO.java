package com.ez.launer.common;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class OrderSearchVO extends SearchVO {
	private String startDay;		//시작일
	private String endDay;			//종료일
	private String adminId;			//관리자 아이디
	private int officeNo;			//지점번호
	private String officeName;		//지점명
	private String orderStatus;		//주문상태
	private String userEmail;		//주문자
	private int countPerPage;
}
