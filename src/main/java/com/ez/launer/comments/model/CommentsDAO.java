package com.ez.launer.comments.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentsDAO {
	List<Map<String, Object>> selectComments(int boardNo);
	int insertComments(CommentsVO commentsVo);
	int updateComments(CommentsVO commentsVo);
	int deleteComments(int boardNo);
	CommentsVO selectComment(int boardNo);
}
