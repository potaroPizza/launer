package com.ez.launer.payment.model;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class PaymentHistoryAllVO {
	private PaymentHistoryViewVO paymentHistoryViewVO;
	private List<Map<String , Object>> paymentHistory;
}
