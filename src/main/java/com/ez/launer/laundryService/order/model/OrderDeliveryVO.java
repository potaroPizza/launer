package com.ez.launer.laundryService.order.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class OrderDeliveryVO {
    private int no;
    private int usersNo;
    private int usersAddressNo;
    private int orderStatusNo;
    private int pickupDriver;
    private int deliveryDriver;
    private Timestamp regdate;
    private Timestamp paymentDate;
    private int totalPrice;
    private String orderRequest;

    private String typeStatus;  //PICKUP_DRIVER 또는 DELIVERY_DRIVER
    private int deliveryNo; //배송기사 no
}
