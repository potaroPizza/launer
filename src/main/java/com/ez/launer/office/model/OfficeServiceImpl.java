package com.ez.launer.office.model;

import lombok.RequiredArgsConstructor;
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
}
