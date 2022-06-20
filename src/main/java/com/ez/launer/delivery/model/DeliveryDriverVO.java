package com.ez.launer.delivery.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class DeliveryDriverVO {
    private int no;
    private int usersClassNo;
    private int accountInfoNo;
    private int officeNo;
    private String name;
    private String email;
    private String pwd;
    private String hp;
    private Timestamp lastDate;
    private Timestamp startDate;
    private Timestamp outDate;
}
