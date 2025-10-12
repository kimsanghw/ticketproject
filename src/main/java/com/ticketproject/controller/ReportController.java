package com.ticketproject.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ticketproject.service.ReportService;
import com.ticketproject.service.ReviewService;
import com.ticketproject.vo.ReportVO;
import com.ticketproject.vo.ReviewVO;

@Controller
public class ReportController {
	@Autowired
	public ReviewService reviewService;
	
	@Autowired
	public ReportService reportService;
	
	
	@RequestMapping(value="/declaration.do" ,method = RequestMethod.GET)
	public String declaration(int reviewid, Principal userVO, Model model) {
		
		
		ReviewVO vo = (ReviewVO) reviewService.selectReview(reviewid);
		model.addAttribute("vo", vo);
	    
	    
		return "performance/declaration";
	}
	
	@ResponseBody
	@RequestMapping(value="/reportInsert", method = RequestMethod.POST)
	public Map<String, Object> reportInsert( @ModelAttribute ReportVO reportVO, Principal principal,  RedirectAttributes redirectAttributes, Model model) {
		Map<String, Object> response = new HashMap<>();
		// 신고자 ID 설정
        reportVO.setUserid(principal.getName());  
        
        System.out.println("Received reviewid: " + reportVO.getReviewid());
        int result = reportService.insertReport(reportVO);

        if (result > 0) {
            redirectAttributes.addFlashAttribute("successMessage", "신고가 성공적으로 접수되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "신고 접수에 실패했습니다.");
        }
        
        return response;  // 메인 페이지로 리다이렉트
	}
	
	@RequestMapping(value="/reportChangeProcess" ,method=RequestMethod.POST)
	public String reportChangeProcess(RedirectAttributes redirectAttributes, int reportid) {
		int result = reportService.reportChangeProcess(reportid);
		if(result >0 ) {
			redirectAttributes.addFlashAttribute("successMessage", "신고가 성공적으로 처리되었습니다.");
		}else {
            redirectAttributes.addFlashAttribute("errorMessage", "신고 처리가 실패되었습니다.");
        }
		
		return "redirect:adminpage/adminPage.do";
	}

}
