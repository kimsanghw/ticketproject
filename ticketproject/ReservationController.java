package com.ticketproject.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ticketproject.service.PerformanceService;
import com.ticketproject.service.ReservationService;
import com.ticketproject.vo.PerformanceVO;
import com.ticketproject.vo.PrfImgVO;
import com.ticketproject.vo.ReservationVO;
import com.ticketproject.vo.RprfVO;

@Controller
public class ReservationController {

	@Autowired
	public PerformanceService performanceService;
	
	@Autowired
	public ReservationService reservationService; 
	
	@RequestMapping(value="/reservation", method = RequestMethod.GET)
	public String reservation(@RequestParam("prfid") int prfid,Model model) {
		
		PerformanceVO prfCheck = performanceService.prfCheck(prfid);
		PrfImgVO prfImg = performanceService.prfImg(prfid);
		//예매테이블의 그 공연에대한 전체 갯수 서비스로 호출하고
		//allcnt에서 가져온걸 빼면된다.
		
		
		
		model.addAttribute("prfCheck",prfCheck);
		model.addAttribute("prfImg",prfImg);
		
		return "reservation/reservation";
	}
	
	@ResponseBody
	@GetMapping("/getScheduleByDate")
    public List<RprfVO> getScheduleByDate(
            @RequestParam("prfid") int prfid,
            @RequestParam("date") String date) {
		List<RprfVO> schedules = reservationService.findSchedulesByDate(String.valueOf(prfid), date);
	    System.out.println("Schedules for date: " + date + " -> " + schedules);
	    return schedules;
    }
	
	
	
	@PostMapping("/makeReservation")
	public String makeReservation(
	        @RequestParam String performanceName, // 공연명
	        @RequestParam String rprfid,
	        @RequestParam String hallid,          // 공연장 ID
	        @RequestParam String date,            // 공연 날짜
	        @RequestParam String time,            // 공연 시간
	        @RequestParam String totalAmount,
	        @RequestParam("prfid") int prfid,
	        Principal principal,// 사용자 ID
	        Model model) {
		
		
	    // ReservationVO 객체 생성 및 데이터 설정
	    ReservationVO reservation = new ReservationVO();
	    reservation.setRprfid(rprfid); // 필요에 따라 등록된 공연 ID 추가
	    reservation.setHallid(hallid); // 공연장 ID
	    reservation.setApprovedAt(date + " " + time); // 승인 날짜와 시간
	    reservation.setAmountTotal(totalAmount); // 총 금액
	    reservation.setUserid(principal.getName()); // 사용자 ID
	    reservation.setState("P"); // 초기 상태를 "Pending"으로 설정
	    
	    
	    PrfImgVO prfImg = performanceService.prfImg(prfid);
	    List<RprfVO> schedules = reservationService.findSchedulesByDate(String.valueOf(prfid), date);
	    
	    model.addAttribute("prfImg",prfImg);
	    model.addAttribute("schedules",schedules);
	    System.out.println(principal.getName());

	    // 데이터베이스에 삽입
	    int reservationid = reservationService.insertReservation(reservation);
	    //System.out.println("결제 넘어가는 예약번호" + reservationid);
	    // 확인 페이지로 이동
	    model.addAttribute("performanceName", performanceName);
	    model.addAttribute("location", hallid); // 공연장 정보
	    model.addAttribute("date", date);
	    model.addAttribute("time", time);
	    model.addAttribute("totalAmount", totalAmount);
	    model.addAttribute("userid", principal.getName());
	    model.addAttribute("reservationid", reservationid);
	    return "reservation/ticket_check"; // 예매 확인 페이지로 이동
	}
	
	@ResponseBody
	@GetMapping("/getRemainingSeatsBySchedule")
	public Map<String, Object> getRemainingSeatsBySchedule(
	        @RequestParam("rprfid") int rprfid) {
	    Map<String, Object> response = new HashMap<>();

	        // 남은 좌석 수 조회
	        int remainingSeats = reservationService.getRemainingSeats(rprfid);

	        // 결과를 반환
	        response.put("rprfid", rprfid);
	        response.put("remainingSeats", remainingSeats);
	        response.put("status", "success");


	    return response;
	}
}
