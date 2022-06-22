package com.ez.launer.office.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OfficeDAO {
    OfficeVO selectByNo(int no);
    List<OfficeVO> selectAll();
}
