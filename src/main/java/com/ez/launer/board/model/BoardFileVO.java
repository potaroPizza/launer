package com.ez.launer.board.model;

import lombok.Data;

@Data
public class BoardFileVO {
    private int no;
    private int boardNo;
    private String fileName;
    private String originalFileName;
    private long fileSize;
    private int downCount;
}
