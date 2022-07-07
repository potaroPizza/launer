package com.ez.launer.user.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class DriverAllVO {
	private int no;
	private int userCode;
	private int officeNo;
	private String name;
	private String email;
	private String pwd;
	private String hp;
	private Timestamp lastAccessDate;
	private Timestamp startDate;
	private Timestamp outDate;
	private int accInfoNo;
	private String bank;
	private int accNum;
	private String accHolder;
	private String randomPwd;
}
