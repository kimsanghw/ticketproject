package com.ticketproject.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {

	@Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        
        // SMTP 서버 정보 설정
        mailSender.setHost("smtp.gmail.com"); // Gmail SMTP 서버 예시
        mailSender.setPort(587); // Gmail의 TLS 포트
        
        // 인증 정보 설정
        mailSender.setUsername("wjswlsdhks17@gmail.com"); // 발신자 이메일 주소
        mailSender.setPassword("ildp zfkr cmkq mjru"); // 발신자 이메일 비밀번호
        
        // 추가 속성 설정
        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true"); // 디버그 로그 활성화 (선택)

        return mailSender;
    }
}
