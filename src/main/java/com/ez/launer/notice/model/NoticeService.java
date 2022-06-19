package com.ez.launer.notice.model;

import java.util.List;

public interface NoticeService {
	List<NoticeVO> selectTopTen();
	List<NoticeVO> selectAll();
	int insertNotice(NoticeVO vo);
	int deleteNotice(int no);
}
