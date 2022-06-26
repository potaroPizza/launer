package com.ez.launer.payment.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.launer.common.PaymentSearchVO;

@Mapper
public interface PaymentDAO {
	int insertPaymentDetail (PaymentVO paymentVo);
	
	//
	List<PaymentDetailAllVO> selectPaymentDetail(int userNo);
	List<Map<String, Object>> selectPaymentList(PaymentSearchVO searchVo);
	int paymentSelectTotalRecord(PaymentSearchVO searchVo);
	

}
