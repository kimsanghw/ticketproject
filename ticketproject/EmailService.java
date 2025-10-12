package com.ticketproject.service;

public interface EmailService {

	public void sendVerificationEmail(String to, String verificationCode);
}
