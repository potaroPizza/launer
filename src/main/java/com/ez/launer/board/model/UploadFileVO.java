package com.ez.launer.board.model;

import lombok.Data;

@Data
public class UploadFileVO {
    private int no;
    private int boardNo;
    private String fileName;
    private String originalFileName;
    private double fileSize;
    private int downCount;
}
