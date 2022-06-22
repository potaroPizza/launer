package com.ez.launer.office.model;

import java.util.List;

public interface OfficeService {
    OfficeVO selectByNo(int no);
    List<OfficeVO> selectAll();
}
