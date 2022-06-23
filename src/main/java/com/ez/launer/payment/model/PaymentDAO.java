package com.ez.launer.payment.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentDAO {
	int insertPaymentDetail (PaymentVO paymentVo);

}
