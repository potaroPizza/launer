package com.ez.launer.payment.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentDAO {
	int insertPaymentDetail (PaymentVO paymentVo);
	
	//
	List<PaymentDetailAllVO> selectPaymentDetail(int userNo);
	

}
