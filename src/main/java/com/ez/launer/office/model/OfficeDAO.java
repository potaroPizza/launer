package com.ez.launer.office.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OfficeDAO {
    OfficeVO selectByNo(int no);
}
