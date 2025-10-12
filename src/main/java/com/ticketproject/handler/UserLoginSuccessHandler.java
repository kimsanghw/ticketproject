package com.ticketproject.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class UserLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
	        Authentication authentication) throws IOException, ServletException {
	    System.out.println("로그인성공");
	    
	    String script = "<script type='text/javascript'>"
	                  + "alert('로그인에 성공하였습니다.');"  // 한글 메시지
	                  + "if (window.opener && !window.opener.closed) {"
	                  + "    window.opener.location.reload();"  // 부모 창 새로고침
	                  + "} else {"
	                  + "    window.location.href = '/controller/';"  // 메인 페이지로 이동
	                  + "}"
	                  + "window.close();"  // 팝업 닫기
	                  + "</script>";

	    // UTF-8 인코딩 설정
	    response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    
	    response.getWriter().write(script);
	    response.getWriter().flush();
	}

}
