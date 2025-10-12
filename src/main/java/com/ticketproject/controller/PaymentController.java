package com.ticketproject.controller;

import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ticketproject.dao.PaymentDAO;
import com.ticketproject.service.PaymentService;
import com.ticketproject.vo.ApproveResponse;
import com.ticketproject.vo.OrderCreateForm;
import com.ticketproject.vo.ReadyResponse;
import com.ticketproject.vo.ReservationVO;
import com.ticketproject.util.SessionUtils;

@Controller
public class PaymentController {

	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	PaymentService paymentService;
	@Autowired
	PaymentDAO paymentDAO;
	
	
	@ResponseBody
	@RequestMapping(value="payment/payReady.do", method=RequestMethod.POST)
	public ReadyResponse KakaoPayReady(@RequestBody OrderCreateForm orderCreateForm, HttpSession session, ReservationVO vo) {
		
		String name = orderCreateForm.getName();
		int totalPrice = Integer.parseInt(orderCreateForm.getTotalPrice());
		int quantity = orderCreateForm.getQuantity();
		int reservationid = orderCreateForm.getReservationid();
		
		logger.info("주문 상품 이름: {}", name);
		logger.info("주문 금액: {}", totalPrice);
		logger.info("주문 수량: {}", quantity);
		logger.info("예약 번호: {}", reservationid);
		
		//카카오 결제 준비
		ReadyResponse response = paymentService.payReady(orderCreateForm);
		
		//세션에 tid값 저장
		session.setAttribute("tid", orderCreateForm.getTid());
		System.out.println(orderCreateForm.getTid());
		System.out.println(orderCreateForm.getTotalPrice());
		System.out.println(orderCreateForm.getPartnerorderid());
		System.out.println(orderCreateForm.getPartneruserid());
		System.out.println(orderCreateForm.getName());
		System.out.println(orderCreateForm.getQuantity());
		System.out.println(orderCreateForm.getReservationid());
		//응답 받은후 저장
		if (orderCreateForm.getReservationid() != 0) {
		    paymentDAO.insertPaymentInfo(orderCreateForm);
		} else {
		    logger.error("Reservation ID is null");
		    // 적절한 에러 처리
		}
		//System.out.println(response.getNext_redirect_pc_url());
		return response;
	}
	
	@RequestMapping(value="payment/completed.do")
	public String payCompleted(@RequestParam("pg_token") String pgToken, HttpSession session, String tid) {
			tid = SessionUtils.getStringAttributeValue("tid");
			
			OrderCreateForm orderCreateForm = paymentService.findPayInfo(tid);
	        logger.info("결제승인 요청을 인증하는 토큰: " + pgToken);
	        logger.info("결제 고유번호: " + tid);
	        System.out.println(tid);

	        // 카카오 결제 요청하기
	        ApproveResponse approveResponse = paymentService.payApprove(orderCreateForm, pgToken);

	        return "redirect:/";
	}
	
	@RequestMapping(value="reservation.do", method=RequestMethod.GET)
	public String reservation() {
		return "reservation/reservation";
	}
	
	@RequestMapping(value="ticketCheck.do", method=RequestMethod.GET)
	public String ticketCheck() {
		return "reservation/ticket_check";
	}
	
	
}
