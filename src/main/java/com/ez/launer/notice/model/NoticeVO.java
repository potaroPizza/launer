package com.ez.launer.notice.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeVO {
	private int no;
	private int usersNo;
	private String title;
	private String content;
	private Timestamp regdate;
	private String regdateStr;
}
