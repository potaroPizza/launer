package com.ez.launer.laundryService.order.model;

import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class OrderDeliveryAllVO {
    private Map<String, Object> orderOfficeView;
    private List<Map<String, Object>> orderDetails;
}
