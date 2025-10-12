package com.ticketproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ticketproject.service.PerformanceService;
import com.ticketproject.vo.PerformanceVO;
import com.ticketproject.vo.PrfImgVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
    private PerformanceService performanceService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home( Model model) throws Exception {
		List<PerformanceVO> savedPerformances = performanceService.getAllPerformances();
	    List<PrfImgVO> savedPrfimgs = performanceService.getAllPrfimgs();
	    
	    

	    //공연 데이터에 이미지 데이터를 매핑
	    for (PerformanceVO performance : savedPerformances) {
	         for (PrfImgVO prfimg : savedPrfimgs) {
	              if (performance.getPrfid() == prfimg.getPrfid()) { //prfId로 매핑
	                  performance.setPoster(prfimg.getPoster()); //PerformanceVO에 포스터 설정
	                }
	            }
	        }
	        model.addAttribute("performances", savedPerformances);
		
		return "home";
	}
}
