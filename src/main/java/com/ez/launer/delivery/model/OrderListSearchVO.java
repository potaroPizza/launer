package com.ez.launer.delivery.model;

import com.ez.launer.common.SearchVO;
import lombok.Data;

@Data
public class OrderListSearchVO extends SearchVO {
    private int officeNo;       // 지점번호
    private int orderStatusNo;  // 주문상태 (1: 수거전, 4: 배송대기)
    private String listType;    // 기사 할당 전 상태인지 확인하기 위한 PICKUP_DRIVER

    @Override
    public String toString() {
        return "SearchVO{" + super.toString() + "}, OrderListSearchVO{" +
                "officeNo=" + officeNo +
                ", orderStatusNo=" + orderStatusNo +
                ", listType='" + listType + '\'' +
                '}';
    }
}
