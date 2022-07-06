package com.ez.launer.board.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardVO {
    private int no;
    private int usersNo;
    private String title;
    private String content;
    private Timestamp regdate;
    private String categoryNo;
    private String name;
    private int viewCount;
}
