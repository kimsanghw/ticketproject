package com.ticketproject.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ticketproject.service.ReviewService;
import com.ticketproject.vo.ReviewVO;

@Controller
public class ReviewController {
	
	@Autowired
	public ReviewService reviewService;
	
	@RequestMapping(value="/reviewinsert", method = RequestMethod.POST)
	public String reviceinsert(ReviewVO reviewVO, HttpServletRequest request, Principal userVO, RedirectAttributes redirectAttributes) {
		System.out.println("리뷰컨트롤러");
		
		reviewVO.setUserid(userVO.getName());
		
		// prfid 값 검증
	    String prfidStr = request.getParameter("prfid");
	    System.out.println("prfid"+prfidStr);
	    if (prfidStr == null || prfidStr.isEmpty()) {
	        throw new IllegalArgumentException("prfid is required and must not be empty.");
	    }

	    int prfid = Integer.parseInt(prfidStr);
	    int rprfid = reviewService.findRprfidByPrfid(prfid); // rprfid 조회
	    reviewVO.setRprfid(rprfid);

	    System.out.println("rprfid"+rprfid);
		int result = reviewService.insertReview(reviewVO);
		System.out.println("reviewid"+reviewVO.getReviewid());
		if(result>0) {
			
			redirectAttributes.addFlashAttribute("message", "리뷰가 정상적으로 작성되었습니다.");
			
		}else {
			redirectAttributes.addFlashAttribute("message", "리뷰 작성이 실패되었습니다.");
			
		}
		
		return "redirect:/performance_check.do?prfid="+request.getParameter("prfid");
	
	}
	
	@RequestMapping(value="/reviewModify", method=RequestMethod.POST)
	public String reviewModify(RedirectAttributes redirectAttributes,ReviewVO reviewVO, HttpServletRequest request, Principal userVO) {
		reviewVO.setUserid(userVO.getName());
		
		// prfid 값 검증
	    String prfidStr = request.getParameter("prfid");
	    System.out.println("prfid"+prfidStr);
	    if (prfidStr == null || prfidStr.isEmpty()) {
	        throw new IllegalArgumentException("prfid is required and must not be empty.");
	    }

	    int prfid = Integer.parseInt(prfidStr);
	    int rprfid = reviewService.findRprfidByPrfid(prfid); // rprfid 조회
	    reviewVO.setRprfid(rprfid);

	    System.out.println("rprfid"+rprfid);
		if(reviewVO.getReviewid() == 0) {
	        redirectAttributes.addFlashAttribute("message", "리뷰 ID가 누락되었습니다.");
	        return "redirect:/performance_check.do";
	    }
		System.out.println("reviewModify");
		
		int result = reviewService.updateReview(reviewVO);
		System.out.println("reviewid"+reviewVO.getReviewid());
		if(result>0) {
			
			redirectAttributes.addFlashAttribute("message", "리뷰가 정상적으로 수정되었습니다.");
			
		}else {
			redirectAttributes.addFlashAttribute("message", "리뷰 수정이 실패되었습니다.");
			
		}
		
		
		 return "redirect:/performance_check.do?prfid="+request.getParameter("prfid");
	}
	
	@RequestMapping(value="/reviewRemove", method=RequestMethod.POST)
	public String reviewRemove(RedirectAttributes redirectAttributes,ReviewVO reviewVO, HttpServletRequest request, Principal userVO) {
		reviewVO.setUserid(userVO.getName());
		
		// prfid 값 검증
	    String prfidStr = request.getParameter("prfid");
	    System.out.println("prfid"+prfidStr);
	    if (prfidStr == null || prfidStr.isEmpty()) {
	        throw new IllegalArgumentException("prfid is required and must not be empty.");
	    }

	    int prfid = Integer.parseInt(prfidStr);
	    int rprfid = reviewService.findRprfidByPrfid(prfid); // rprfid 조회
	    reviewVO.setRprfid(rprfid);

	    System.out.println("rprfid"+rprfid);
		if(reviewVO.getReviewid() == 0) {
	        redirectAttributes.addFlashAttribute("message", "리뷰 ID가 누락되었습니다.");
	        return "redirect:/performance_check.do";
	    }
		System.out.println("reviewRemove");
		
		int result = reviewService.updateReviewRemove(reviewVO);
		System.out.println("reviewid"+reviewVO.getReviewid());
		if(result>0) {
			
			redirectAttributes.addFlashAttribute("message", "리뷰가 정상적으로 삭제되었습니다.");
			
		}else {
			redirectAttributes.addFlashAttribute("message", "리뷰 삭제가 실패되었습니다.");
			
		}
		
		
		 return "redirect:/performance_check.do?prfid="+request.getParameter("prfid");
	}
	
	
	
	
}
