package com.ez.launer.delivery.model;

import java.util.Map;

public interface DeliveryDriverService {
    DeliveryDriverVO selectByNo(int no);
    int insertDeliveryAmount(Map<String, Object> map);
}
