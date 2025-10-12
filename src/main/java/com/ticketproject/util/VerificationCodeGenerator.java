package com.ticketproject.util;

import java.security.SecureRandom;

public class VerificationCodeGenerator {

	// 사용할 문자 및 숫자 정의
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final int CODE_LENGTH = 6; // 인증번호 길이

    // SecureRandom 객체 생성 (보안성이 높은 랜덤값 생성)
    private static final SecureRandom random = new SecureRandom();

    // 인증번호 생성 메소드
    public static String generateCode() {
        StringBuilder code = new StringBuilder(CODE_LENGTH);
        for (int i = 0; i < CODE_LENGTH; i++) {
            // CHARACTERS에서 랜덤한 문자를 선택하여 추가
            code.append(CHARACTERS.charAt(random.nextInt(CHARACTERS.length())));
        }
        return code.toString();
    }
}
