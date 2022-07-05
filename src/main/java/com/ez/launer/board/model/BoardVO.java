package com.ez.launer.board.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardVO {
    private int no;
    private int userNo;
    private String title;
    private String content;
    private Timestamp regdate;
    private int categoryNo;
}
