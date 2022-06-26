package com.ez.launer.payment.model;

import java.util.List;
import java.util.Map;

import com.ez.launer.common.PaymentSearchVO;

public interface PaymentService {
	int insertPaymentDetail (PaymentVO paymentVo);
	
	//
	List<PaymentDetailAllVO> selectPaymentDetail(int userNo);
	List<Map<String, Object>> selectPaymentList(PaymentSearchVO searchVo);
	int paymentSelectTotalRecord(PaymentSearchVO searchVo);

}
