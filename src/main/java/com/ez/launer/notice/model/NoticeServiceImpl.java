package com.ez.launer.notice.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	private final NoticeDAO noticeDAO; 

	@Override
	public List<NoticeVO> selectTopTen() {
		return noticeDAO.selectTopTen();
	}

}
