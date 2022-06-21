package com.ez.launer.office.model;

import lombok.Data;

@Data
public class OfficeVO {
    private int no;
    private String officeName;
    private String address;
    private double latY;
    private double lonX;
}
