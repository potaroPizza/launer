package com.ez.launer.payment.model;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class PaymentDetailAllVO {
	private PaymentViewVO paymentViewVO;
	private List<Map<String , Object>> paymentDetails;
}
