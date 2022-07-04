package com.ez.launer.user.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class DriverVO {
	private int no;
	private int userCode;
	private int officeNo;
	private String name;
	private String dmail;
	private String dPwd;
	private String hp;
	private Timestamp lastAccessDate;
	private Timestamp startDate;
	private Timestamp outDate;
}
