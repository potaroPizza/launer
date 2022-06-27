package com.ez.launer.delivery.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class DeliveryAmountVO {
    private int no;
    private int orderNo;
    private int deliveryDriverNo;
    private int amount;
    private Timestamp regdate;
}
