package com.ticketproject.service;



import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.Instant;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.ticketproject.dao.PaymentDAO;
import com.ticketproject.vo.ApproveResponse;
import com.ticketproject.vo.OrderCreateForm;
import com.ticketproject.vo.PaymentVO;
import com.ticketproject.vo.ReadyResponse;

@Service
public class PaymentServiceImpl implements PaymentService{
	
	private static final String CID = "TC0ONETIME";
	private static final String ALPHABET = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	private static final int ID_LENGTH = 16;
	@Autowired
	PaymentDAO paymentDAO;

	

	@Override //카카오결제 api
	public ReadyResponse payReady(OrderCreateForm orderCreateForm) {
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "SECRET_KEY " + "DEV923E83C632627A7006572A5A30C8E23F7446A");
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		
		//1. 겹치치 않는 랜덤 주문번호 만들기
		String partnerOrderId = generateUniqueId();
		orderCreateForm.setPartnerorderid(partnerOrderId);
		//2. 영어로 랜덤한 회원아이디 만들기
		String partnerUserId = generateRandomString(10);
		orderCreateForm.setPartneruserid(partnerUserId);
		
        Map<String, String> parameters = new HashMap<>();
        parameters.put("cid", CID);// 가맹점 코드(테스트용)
        parameters.put("partner_order_id", partnerOrderId);// 주문번호
        parameters.put("partner_user_id", partnerUserId);// 회원 아이디
        parameters.put("item_name", orderCreateForm.getName());// 상품명
        parameters.put("quantity", String.valueOf(orderCreateForm.getQuantity()));// 상품 수량
        parameters.put("total_amount", String.valueOf(orderCreateForm.getTotalPrice()));// 상품 총액
        parameters.put("tax_free_amount", "0");// 상품 비과세 금액
        parameters.put("approval_url", "http://localhost:8080/controller/payment/completed.do");// 결제 성공 시 URL
        parameters.put("cancel_url", "http://localhost");// 결제 취소 시 URL
        parameters.put("fail_url", "http://localhost/order/pay/fail");// 결제 실패 시 URL

        // HttpEntity : HTTP 요청 또는 응답에 해당하는 Http Header와 Http Body를 포함하는 클래스
        HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(parameters, headers);

        // RestTemplate: Rest 방식 API를 호출할 수 있는 Spring 내장 클래스
        // REST API 호출 이후 응답을 받을 때까지 기다리는 동기 방식 (json, xml 응답)
        RestTemplate template = new RestTemplate();
        String url = "https://open-api.kakaopay.com/online/v1/payment/ready";
        // RestTemplate의 postForEntity : POST 요청을 보내고 ResponseEntity로 결과를 반환받는 메소드
        ResponseEntity<ReadyResponse> responseEntity = template.postForEntity(url, requestEntity, ReadyResponse.class);
        
        ReadyResponse response = responseEntity.getBody();
        
        orderCreateForm.setTid(response.getTid());
        //paymentDAO.insertPaymentInfo(orderCreateForm);

        return response;
	}
	
	/*
		 16자리의 고유한 ID를 생성 이 ID는 현재 시간의 타임스탬프와 랜덤 문자열을 조합하여 만들어집니다.
		 @return 16자리의 고유한 ID 문자열
	 */
	private String generateUniqueId() {
		 // 현재 시간을 밀리초 단위로 가져옴
	    String timestamp = String.valueOf(Instant.now().toEpochMilli());
	    // 8자리 랜덤 문자열을 생성
	    String randomStr = generateRandomString(8);
	    // 타임스탬프와 랜덤 문자열을 결합
	    String combined = timestamp + randomStr;

        try {
        	 // SHA-256 해시 알고리즘 인스턴스를 가져옴
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            // 결합된 문자열을 해시함
            byte[] hashBytes = md.digest(combined.getBytes());
            // 해시된 바이트 배열을 16진수 문자열로 변환함
            String hashHex = bytesToHex(hashBytes);
            
            // 16진수 문자열을 36진수로 변환하고, 앞에서부터 16자리만 잘라서 반환합니다.
            
            return convertToBase36(hashHex).substring(0, ID_LENGTH);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("SHA-256 알고리즘을 찾을 수 없습니다.", e);
        }
    }
	/*
		 지정된 길이의 랜덤 문자열을 생성함
		 문자열은 ALPHABET에 정의된 문자들로만 구성됨
		 @param length 생성할 문자열의 길이
		 @return 지정된 길이의 랜덤 문자열
	 */
	private String generateRandomString(int length) {
        StringBuilder sb = new StringBuilder(length);
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            sb.append(ALPHABET.charAt(random.nextInt(ALPHABET.length())));
        }
        return sb.toString();
    }

	/*
		 바이트 배열을 16진수 문자열로 변환합니다.
		 @param bytes 변환할 바이트 배열
		 @return 16진수 문자열
	 */
	private String bytesToHex(byte[] bytes) {
        StringBuilder result = new StringBuilder();
        for (byte b : bytes) {
            result.append(String.format("%02x", b));
        }
        return result.toString();
    }
	
	private String convertToBase36(String hexString) {
        StringBuilder result = new StringBuilder();
        java.math.BigInteger bigInt = new java.math.BigInteger(hexString, 16);
        while (bigInt.compareTo(java.math.BigInteger.ZERO) > 0 && result.length() < ID_LENGTH) {
            int remainder = bigInt.mod(java.math.BigInteger.valueOf(36)).intValue();
            result.insert(0, ALPHABET.charAt(remainder));
            bigInt = bigInt.divide(java.math.BigInteger.valueOf(36));
        }
        return result.toString();
    }

	@Override
	public ApproveResponse payApprove(OrderCreateForm orderCreateForm, String pgToken) {
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "SECRET_KEY " + "DEV923E83C632627A7006572A5A30C8E23F7446A");
		headers.setContentType(MediaType.APPLICATION_JSON);
		
		 Map<String, String> parameters = new HashMap<>();
	        parameters.put("cid", CID);// 가맹점 코드(테스트용)
	        parameters.put("tid", orderCreateForm.getTid());// 결제 고유번호
	        parameters.put("partner_order_id", orderCreateForm.getPartnerorderid());// 주문번호
	        parameters.put("partner_user_id", orderCreateForm.getPartneruserid());// 회원 아이디
	        parameters.put("pg_token", pgToken);// 결제승인 요청을 인증하는 토큰

	        HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(parameters, headers);

	        RestTemplate template = new RestTemplate();
	        String url = "https://open-api.kakaopay.com/online/v1/payment/approve";
	        ApproveResponse approveResponse = template.postForObject(url, requestEntity, ApproveResponse.class);
	        

	        return approveResponse;
	}

	@Override
	public OrderCreateForm findPayInfo(String tid) {
		return paymentDAO.findPayInfo(tid);
	}
	

}
