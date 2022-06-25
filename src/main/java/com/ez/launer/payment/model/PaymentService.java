package com.ez.launer.payment.model;

import java.util.List;

public interface PaymentService {
	int insertPaymentDetail (PaymentVO paymentVo);
	
	//
	List<PaymentDetailAllVO> selectPaymentDetail(int userNo);
	

}
