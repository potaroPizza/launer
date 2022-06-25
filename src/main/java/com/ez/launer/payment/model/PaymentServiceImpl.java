package com.ez.launer.payment.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ez.launer.common.PaymentSearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentService{
	
	private final PaymentDAO paymentDao;

	@Override
	public int insertPaymentDetail(PaymentVO paymentVo) {
		
		int orderNo = paymentVo.getOrderNo();
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMddhhmmss");
		//paymentcode = p + 오늘날짜 + orderNo(주문번호)
		String paymentCode = "p"+date.format(new Date())+"_"+orderNo;

		paymentVo.setPaymentCode(paymentCode);

		return paymentDao.insertPaymentDetail(paymentVo);
	}

	
	//
	@Override
	public List<PaymentDetailAllVO> selectPaymentDetail(int userNo) {
		return paymentDao.selectPaymentDetail(userNo);
	}


	@Override
	public List<Map<String, Object>> selectPaymentList(PaymentSearchVO searchVo) {
		return paymentDao.selectPaymentList(searchVo);
	}


	@Override
	public int paymentSelectTotalRecord(PaymentSearchVO searchVo) {
		return paymentDao.paymentSelectTotalRecord(searchVo);
	}
	

}
