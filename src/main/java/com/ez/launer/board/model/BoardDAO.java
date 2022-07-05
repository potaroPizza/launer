package com.ez.launer.board.model;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardDAO {
    int insertBoard(BoardVO boardVO);
    int insertUploadFile(UploadFileVO uploadFileVO);

    List<BoardVO> selectByCategoryNo(String categoryNo);
}
