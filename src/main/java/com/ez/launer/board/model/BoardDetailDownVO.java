package com.ez.launer.board.model;

import lombok.Data;

import java.util.List;

@Data
public class BoardDetailDownVO {
    private BoardVO boardVO;
    private List<BoardFileVO> files;
}
