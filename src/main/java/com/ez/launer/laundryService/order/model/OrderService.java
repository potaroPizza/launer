package com.ez.launer.laundryService.order.model;

import com.ez.launer.delivery.model.OrderListSearchVO;

import java.util.List;
import java.util.Map;

public interface OrderService {
    List<Map<String, Object>> orderOfficeView(OrderListSearchVO orderListSearchVO);
    int orderCount(OrderListSearchVO orderListSearchVO);
}
