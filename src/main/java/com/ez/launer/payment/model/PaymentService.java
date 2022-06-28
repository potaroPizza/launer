package com.ez.launer.payment.model;

import java.util.List;
import java.util.Map;

import com.ez.launer.common.PaymentSearchVO;

public interface PaymentService {
	int insertPaymentDetail (PaymentVO paymentVo);
	
	//
	List<PaymentDetailAllVO> selectPaymentDetail(PaymentSearchVO searchVo);
	List<PaymentDetailAllVO> selectPaymentList(PaymentSearchVO searchVo);
	int paymentSelectTotalRecord(PaymentSearchVO searchVo);

	List<PaymentHistoryAllVO> selectPaymentHistoryList(PaymentHistoryViewVO paymentHistoryViewVO);
}