package com.ticketproject.controller;


import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ticketproject.service.EmailService;
import com.ticketproject.service.MyService;
import com.ticketproject.util.PagingUtil;
import com.ticketproject.vo.ReportVO;
import com.ticketproject.vo.ReservationVO;
import com.ticketproject.vo.UserVO;


@Controller
public class MyController {
	@Autowired
	public MyService myservice; // myservice 媛앹껜瑜� �옄�룞�쑝濡� 二쇱엯
	@Autowired
	public EmailService emailservice;

	
	@RequestMapping(value = "mypage/mypage.do", method = RequestMethod.GET)
	public String mypage(String userid, Model model, Model model2, Principal principal,
	                     @RequestParam(defaultValue = "1") int nowPage,
	                     @RequestParam(defaultValue = "5") int perPage) {
	    // 사용자 인증 정보 확인
	    if (principal != null) {
	        userid = principal.getName();
	        UserVO vo = myservice.selectOne(userid);
	        model.addAttribute("vo", vo); // 사용자 정보 모델에 추가
	    }
	    //예매내역 조회
	    userid = principal.getName();
	    List<ReservationVO> reservation = myservice.selectReservation(userid);
	    System.out.println(reservation);
	    model.addAttribute("reservationList", reservation);
	    // 총 신고 내역 수
	    int total = myservice.countReports(userid);

	    // 페이징 계산
	    PagingUtil paging = new PagingUtil(nowPage, total, perPage);

	    // SQL LIMIT 시작값 계산
	    int start = (nowPage - 1) * perPage;

	    // 페이징된 신고 내역 가져오기
	    List<ReportVO> paginatedReports = myservice.getReports(userid, start, perPage);

	    // 전체 신고 내역 가져오기
	    List<ReportVO> allReports = myservice.allReport(userid);

	    // 페이징된 데이터를 reportList로 전달 (JSP와 호환되도록 설정)
	    model2.addAttribute("reportList", paginatedReports);

	    // 전체 데이터를 별도로 전달 (필요 시 다른 속성으로 전달)
	    model.addAttribute("allReports", allReports);

	    // 페이징 정보 전달
	    model.addAttribute("paging", paging);

	    return "mypage/mypage";
	}

	
	
	@RequestMapping(value="mypage/updateUserInfo.do", method=RequestMethod.POST)
	public String pwCheck(UserVO userVO, Principal principal, HttpServletRequest request) {
		userVO.setUserid(principal.getName());
		
		int result = myservice.updateUserInfo(userVO);
		
		if(result > 0) {
			request.setAttribute("message", "사용자 정보 변경이 완료되었습니다.");
		} else {
			request.setAttribute("message", "사용자 정보 변경이 실패되었습니다.");
		}
		
	    return "mypage/mypage";
	}
	
}
