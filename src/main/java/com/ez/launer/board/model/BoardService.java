package com.ez.launer.board.model;

import java.util.List;

public interface BoardService {
    int insertUploadFileBoard(BoardVO boardVO, List<UploadFileVO> fileList);
    List<BoardVO> selectByCategoryNo(String categoryNo);
}
