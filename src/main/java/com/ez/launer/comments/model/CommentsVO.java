package com.ez.launer.comments.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentsVO {
	private int no;
	private int boardNo;
	private String content;
	private int step;
	private int groupNo;
	private int sortNo;
	private Timestamp regdate;
	private String delFlage;
	private int usersNo;
	
	private String name;
}
