package com.ez.launer.office.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OfficeDAO {
    OfficeVO selectByNo(int no);
    List<OfficeVO> selectAll();
    int insertOfficeAdmin(Map<String, Object> map);
    List<Map<String, Object>> selectAllManager();
    Map<String, Object> selectManagerByNo(int no);
    int deleteOfficeAdmin(int usersNo);
    int deleteOffice(int no);
    List<Map<String, Object>> selectOfficeInfo();
}
