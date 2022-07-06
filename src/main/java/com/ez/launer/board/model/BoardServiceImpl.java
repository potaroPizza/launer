package com.ez.launer.board.model;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
    private final BoardDAO boardDAO;

    @Override
    @Transactional
    public int insertUploadFileBoard(BoardVO boardVO, List<UploadFileVO> fileList) {
        //1. 글 먼저 등록
        //2. 파일 업로드(반복문)
        int result = 0;

        try {
            result = boardDAO.insertBoard(boardVO);

            if(result > 0) {
                for(UploadFileVO uploadFileVO : fileList) {
                    uploadFileVO.setBoardNo(boardVO.getNo());
                    result = boardDAO.insertUploadFile(uploadFileVO);
                }
            }
        } catch(RuntimeException e) {
            e.printStackTrace();
            result = -1;
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        }

        return result;
    }

    @Override
    public List<BoardVO> selectByCategoryNo(String categoryNo) {
        return boardDAO.selectByCategoryNo(categoryNo);
    }
}
