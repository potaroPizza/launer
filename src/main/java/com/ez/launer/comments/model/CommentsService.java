package com.ez.launer.comments.model;

import java.util.List;
import java.util.Map;

public interface CommentsService {
	List<Map<String, Object>> selectComments(int boardNo);
	int insertComments(CommentsVO commentsVo);
	int updateComments(CommentsVO commentsVo);
	int deleteComments(int boardNo);
	int selectStep(int boardNo);
}
