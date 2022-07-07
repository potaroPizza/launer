package com.ez.launer.board.model;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardDAO {
    int insertBoard(BoardVO boardVO);
    int insertUploadFile(UploadFileVO uploadFileVO);

//    List<BoardVO> selectByCategoryNo(String categoryNo);
    List<Map<String, Object>> selectByCategoryNo(Map<String, Object> map);
    int countBoardList(Map<String, Object> map);

//    BoardVO selectBoardByNo(int no);
    BoardDetailDownVO selectBoardByNo(int no);

    int deleteBoard(Map<String, Object> map);

    int downloadCount(int no);
}
