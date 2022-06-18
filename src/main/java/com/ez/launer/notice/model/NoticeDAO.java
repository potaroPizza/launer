package com.ez.launer.notice.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDAO {
	List<NoticeVO> selectTopTen();
}
