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

	@Override
	public List<Map<String, Object>> selectAllManager() {
		return officeDAO.selectAllManager();
	}

	@Override
	public Map<String, Object> selectManagerByNo(int no) {
		return officeDAO.selectManagerByNo(no);
	}
	
	//지점관리자 삭제
	@Override
	public int deleteOfficeAdmin(int usersNo) {
		return officeDAO.deleteOfficeAdmin(usersNo);
	}

	//지점 삭제
	@Override
	public int deleteOffice(int no) {
		return officeDAO.deleteOffice(no);
	}
	
	//지점 정보 조회
	@Override
	public List<Map<String, Object>> selectOfficeInfo() {
		return officeDAO.selectOfficeInfo();
	}
	
	//지점 등록
	@Override
	public int insertOffice(OfficeVO vo) {
		return officeDAO.insertOffice(vo);
	}
		
}
