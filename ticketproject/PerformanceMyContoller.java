package com.ticketproject.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ticketproject.service.RprfService;
import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.RprfVO;

@Controller
public class PerformanceMyContoller {
	
	@Autowired
	public RprfService rprfService;
	
	@RequestMapping(value = "performanceMypage/performanceMypage.do")
	 public String performanceMypage(Principal principal, Model model) {
	        String userid = principal.getName(); // 로그인한 유저의 ID를 가져옴
	        List<RprfVO> rprfList = rprfService.getPerformanceListByUser(userid);
	        String hallid = rprfService.getHallIdByUserId(userid);
	        HallVO hallInfo = rprfService.getHallInfoByHallId(hallid);
	        model.addAttribute("rprfList", rprfList);
	        model.addAttribute("hallInfo", hallInfo);
	       
	        return "/performanceMypage/performanceMypage";
	    }
	 
	 @RequestMapping(value="/performanceMypage/updateAllSeatCnt", method = RequestMethod.POST)
	 public String updateAllSeatCnt( Principal principal,
		        @RequestParam(value = "allSeatCnt", required = true) int allSeatCnt, RedirectAttributes redirectAttributes) {
		 
		 
		 	String userid = principal.getName(); // Spring Security의 기본 사용자 ID

		    // 사용자와 연결된 hallid를 가져옴
		    String hallid = rprfService.getHallIdByUserId(userid);

		    if (hallid == null) {
		        throw new IllegalArgumentException("해당 유저의 공연장 정보가 없습니다.");
		    }
		    System.out.println("Hallid: " + hallid);
		    System.out.println("AllSeatCnt: " + allSeatCnt);

		    // HallVO에 수동으로 매핑
		    HallVO hallVO = new HallVO();
		    hallVO.setHallid(hallid);
		    hallVO.setAllSeatCnt(allSeatCnt);

		 System.out.println("AllSeatCnt"+hallVO.getAllSeatCnt());
		 System.out.println("Hallid"+hallVO.getHallid());
		 int result = rprfService.updateAllSeatCnt(hallVO);
		 if (result > 0) {
		        redirectAttributes.addFlashAttribute("message", "좌석 수가 성공적으로 업데이트되었습니다.");
		    } else {
		        redirectAttributes.addFlashAttribute("message", "좌석 업데이트에 실패했습니다.");
		    }
		    
		    return "redirect:/performanceMypage/performanceMypage.do";
		    
	 }

}
