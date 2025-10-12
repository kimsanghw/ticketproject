package com.ticketproject.service;

import java.util.Map;

import com.ticketproject.vo.ApproveResponse;
import com.ticketproject.vo.OrderCreateForm;
import com.ticketproject.vo.PaymentVO;
import com.ticketproject.vo.ReadyResponse;

public interface PaymentService {

	public ReadyResponse payReady(OrderCreateForm orderCreateForm);
	
	public ApproveResponse payApprove(OrderCreateForm orderCreateForm, String pgToken);
	
	public OrderCreateForm findPayInfo(String tid);
	
}
