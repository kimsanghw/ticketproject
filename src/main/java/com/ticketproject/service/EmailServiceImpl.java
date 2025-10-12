package com.ticketproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService{

	@Autowired
    private JavaMailSender mailSender;

    public void sendVerificationEmail(String toEmail, String verificationCode) {
        SimpleMailMessage message = new SimpleMailMessage();
        
        // 이메일 기본 정보 설정
        message.setTo(toEmail);
        message.setSubject("인증 코드 발송");
        message.setText("귀하의 인증 코드는 다음과 같습니다: " + verificationCode);
        
        // 이메일 전송
        mailSender.send(message);
    }
}
