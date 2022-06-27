package com.ez.launer.delivery.model;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface DeliveryDriverDAO {
    DeliveryDriverVO selectByNo(int no);
    int insertDeliveryAmount(Map<String, Object> map);
}
