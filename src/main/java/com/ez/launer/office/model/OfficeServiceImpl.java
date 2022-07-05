package com.ez.launer.office.model;

import lombok.RequiredArgsConstructor;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OfficeServiceImpl implements OfficeService{
    private final OfficeDAO officeDAO;

    //지점번호로 지점정보 조회
    //지점번호로 지점정보 조회
    //지점번호로 지점정보 조회
    @Override
    public OfficeVO selectByNo(int no) {
        return officeDAO.selectByNo(no);
    }

	@Override
	public List<OfficeVO> selectAll() {
		return officeDAO.selectAll();
	}

	@Override
	public int insertOfficeAdmin(Map<String, Object> map) {
		return officeDAO.insertOfficeAdmin(map);
	}
}
