package com.ez.launer.comments.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ez.launer.board.controller.BoardAPIController;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentsServiceImpl implements CommentsService {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardAPIController.class);
	
	private final CommentsDAO commentsDao; 

	@Override
	public List<Map<String, Object>> selectComments(int boardNo) {
		return commentsDao.selectComments(boardNo);
	}

	@Override
	public int insertComments(CommentsVO commentsVo) {
		int boardNo = commentsVo.getBoardNo();
		int step = selectStep(boardNo);
		commentsVo.setStep(step+1);
		
		return commentsDao.insertComments(commentsVo);
	}

	@Override
	public int updateComments(CommentsVO commentsVo) {
		return commentsDao.updateComments(commentsVo);
	}

	@Override
	public int deleteComments(int boardNo) {
		return commentsDao.deleteComments(boardNo);
	}

	@Override
	public int selectStep(int boardNo) {
		CommentsVO vo = commentsDao.selectComment(boardNo);
		return vo.getStep();
	}
	
}
