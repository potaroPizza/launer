package com.ez.launer.board.model;

import java.util.List;
import java.util.Map;

public interface BoardService {
    int insertUploadFileBoard(BoardVO boardVO, List<UploadFileVO> fileList);
    List<Map<String, Object>> selectByCategoryNo(Map<String, Object> map);
    int countBoardList(Map<String, Object> map);
    BoardVO selectBoardByNo(int no);
}
