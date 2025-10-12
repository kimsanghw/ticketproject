package com.ticketproject.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ticketproject.service.PerformanceService;
import com.ticketproject.service.ReviewService;
import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.PerformanceVO;
import com.ticketproject.vo.PrfImgVO;
import com.ticketproject.vo.ReviewVO;
import com.ticketproject.vo.RprfVO;

@Controller
public class PerformanceController {

	@Autowired
	public PerformanceService performanceService;
	@Autowired
	public ReviewService reviewService;
	
	@RequestMapping(value="/performance", method = RequestMethod.GET)
	public String performance(Model model , Principal principal) {
		
		List<PerformanceVO> pervo = performanceService.getAllPerformances();
		if( principal != null ) {
			System.out.println(principal.getName());
			
		}
		HallVO hall = null;
		try {
			hall = performanceService.viewPerformance(principal.getName());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("hall data:"+hall);
		model.addAttribute("hall",hall);
		
		
		model.addAttribute("pervo", pervo);
		
		return "performance/performance_write";
	}
	
	@RequestMapping(value="/performance_view", method = RequestMethod.GET)
	public String performnaceView(@RequestParam("rprfid") int rprfid, Model model) {

		RprfVO rprf = performanceService.performanceView(rprfid);
		//System.out.println("공연명 : "+rprf.getPrfnm());
		//System.out.println("공연장 : "+rprf.getHalladdress());
		//System.out.println("선택 날짜 : "+rprf.getDate());
		//System.out.println("첫번째 회차: "+rprf.getTime());
		//System.out.println("두번째 회차 : "+rprf.getTime2());
		
		
		if (rprf != null && rprf.getTime2() == null) {
			rprf.setTime2("");
	    }
		
		model.addAttribute("rprf",rprf);
		
		return "performance/performance_view";
	}
	
	@RequestMapping(value="/performance_modify", method = RequestMethod.GET)
	public String performanceModify(@RequestParam("rprfid") int rprfid, Model model) {
		
		List<PerformanceVO> pervo = performanceService.getAllPerformances();
		
		RprfVO rprf = performanceService.performanceView(rprfid);
		
		if (rprf != null && rprf.getTime2() == null) {
			rprf.setTime2("");
	    }
		
		model.addAttribute("rprf",rprf);
		model.addAttribute("pervo", pervo);
		
		return "performance/performance_modify";
	}
	
	@RequestMapping(value="/performance_check", method = RequestMethod.GET)
	public String performanceCheck(@RequestParam("prfid") int prfid, Model model, Principal userVO) {
		
		if (userVO != null) {
	        // 로그인한 사용자의 이름을 모델에 추가
	        model.addAttribute("loggedInUser", userVO.getName());
	    }
	    // 공연 및 이미지 정보 가져오기
	    PerformanceVO prfCheck = performanceService.prfCheck(prfid);
	    PrfImgVO prfImg = performanceService.prfImg(prfid);
	    //System.out.println("포스터 : " + prfImg.getPoster());
	    //System.out.println("prfid : " + prfid);
	    //System.out.println("소개이미지1 : " + prfImg.getStyuri1());
	    //System.out.println("소개이미지2 : " + prfImg.getStyuri2());
	    //System.out.println("소개이미지3 : " + prfImg.getStyuri3());
	    //System.out.println("소개이미지4 : " + prfImg.getStyuri4());

	    // prfid로 rprfid 조회 (Optional 사용)
	    int rprfid = Optional.ofNullable(reviewService.findRprfidByPrfid(prfid)).orElse(0);
	    model.addAttribute("rprfid", rprfid);
	    System.out.println("rprfid: " + rprfid);
	   
	    List<ReviewVO> reviewList = new ArrayList<>();
	   
	    
	   
	    // rprfid가 0이 아니면 리뷰 조회
	    if (rprfid != 0) {
	        reviewList = reviewService.reviewListByRprfid(rprfid);
	        
	    }

	    // 날짜 포맷 변환
	    for (ReviewVO review : reviewList) {
	        if (review.getRdate() != null) {
	            String originalRdate = review.getRdate(); // "yyyy-MM-dd HH:mm:ss"
	            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	            LocalDateTime dateTime = LocalDateTime.parse(originalRdate, formatter);

	            // 날짜만 문자열로 변환
	            String formattedDate = dateTime.toLocalDate().toString(); // "yyyy-MM-dd"
	            review.setRdate(formattedDate);
	            
	            
	        }
	    }
	    
	    // 모델에 데이터 추가
	    model.addAttribute("reviewList", reviewList);
	    model.addAttribute("prfCheck", prfCheck);
	    model.addAttribute("prfImg", prfImg);
	    //model.addAttribute("styuri1", prfImg.getStyuri1());
	    //model.addAttribute("styuri2", prfImg.getStyuri2());
	    //model.addAttribute("styuri3", prfImg.getStyuri3());
	    //model.addAttribute("styuri4", prfImg.getStyuri4());

	    return "performance/performance_check";
	}
	
	@RequestMapping(value="/performance_modify", method = RequestMethod.POST)
	public String performanceModifyOk(@ModelAttribute RprfVO rprfVO, RedirectAttributes redirectAttributes) {
		
		int result = performanceService.performanceModify(rprfVO);
		
		if (result > 0) {
            redirectAttributes.addFlashAttribute("successMessage", "예매가 성공적으로 완료되었습니다.");
            return "redirect:/performance_view?rprfid=" + rprfVO.getRprfid();
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "예매 처리 중 오류가 발생했습니다. 다시 시도해 주세요.");
            return "redirect:/performance";
        }
	}
	
	@ResponseBody
	@RequestMapping(value="/performance", method = RequestMethod.POST , produces = "application/json;charset=utf8")
	public List<PerformanceVO> performanceSearch(@RequestParam("keyword") String keyword) {
		List<PerformanceVO> performances = performanceService.searchPerformances(keyword);
		
		return performances;
	}
	
	
	@RequestMapping(value="/performance_writeOk", method = RequestMethod.POST)
	public String performance_write(@ModelAttribute RprfVO rprfVO , RedirectAttributes redirectAttributes) {
		
		int result = performanceService.performance_write(rprfVO);
		
		if (result > 0) {
            redirectAttributes.addFlashAttribute("successMessage", "占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙溝퓸占쏙옙占쏙옙求占�.");
            return "redirect:/performance_view?rprfid=" + rprfVO.getRprfid();
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "占쏙옙占쏙옙 占쏙옙臼占� 占쏙옙占쏙옙占쌩쏙옙占싹댐옙. 占쌕쏙옙 占시듸옙占쏙옙 占쌍쇽옙占쏙옙.");
            return "redirect:/performance";
        }
	}
	
	@RequestMapping(value="/performance_delete", method = RequestMethod.POST)
	public String performace_delete(@RequestParam("rprfid") int rprfid, RedirectAttributes redirectAttributes) {
		
		int result = performanceService.performance_delete(rprfid);
		
		if (result > 0) {
	        redirectAttributes.addFlashAttribute("successMessage", "占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占실억옙占쏙옙占싹댐옙.");
	    } else {
	        redirectAttributes.addFlashAttribute("errorMessage", "占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쌩쏙옙占싹댐옙. 占쌕쏙옙 占시듸옙占쏙옙 占쌍쇽옙占쏙옙.");
	    }
		
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getUnavailableDates", method = RequestMethod.GET, produces = "application/json;charset=utf8")
	public List<String> getUnavailableDates(@RequestParam("prfid") int prfid) {
	    // 공연 ID를 기반으로 등록된 날짜를 가져옵니다.
	    return performanceService.getUnavailableDates(prfid);
	}
	
}
