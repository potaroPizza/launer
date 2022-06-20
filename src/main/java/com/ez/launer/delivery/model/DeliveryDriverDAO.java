package com.ez.launer.delivery.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeliveryDriverDAO {
    DeliveryDriverVO selectByNo(int no);
}
