package com.ez.launer.delivery.model;

import java.util.List;
import java.util.Map;

public interface DeliveryDriverService {
    DeliveryDriverVO selectByNo(int no);
    int insertDeliveryAmount(Map<String, Object> map);
    List<Map<String, Object>> amountByDeliveryNo(Map<String, Object> map);
    Map<String, Object> amountAllRecode(Map<String, Object> map);
}
