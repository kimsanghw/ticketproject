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
import org.springframework.web.bind.annotation.RequestParam;

import com.ticketproject.service.NoticeService;
import com.ticketproject.util.PagingUtil;
import com.ticketproject.vo.NoticeVO;
import com.ticketproject.vo.SearchVO;

@Controller
public class NoticeController {
	
	@Autowired
	public NoticeService noticeService;
	
	
	@RequestMapping(value="/noticeBoard/noticeList.do", method=RequestMethod.GET)
	public String noticeList (Model model,@RequestParam(value="nowpage",required = false , defaultValue="1" )int nowpage, SearchVO searchVO) {
		
		System.out.println("SearchVO: " + searchVO);
		
		int total = noticeService.selectTotal(searchVO);
		
		
		PagingUtil paging = new PagingUtil(nowpage,total,5);
		searchVO.setStart(paging.getStart());
		searchVO.setPerPage(paging.getPerPage());
		
		List<NoticeVO> noticeList= noticeService.noticeList(searchVO);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("paging",paging);
		
		return "noticeBoard/noticeList";
	}
	
	@RequestMapping(value="/noticeBoard/noticeWrite.do", method=RequestMethod.GET)
	public String noticeWrite () {
		
		return "noticeBoard/noticeWrite";
	}
	
	@RequestMapping(value="/noticeBoard/noticeWriteOk.do", method=RequestMethod.POST)
	public String noticeWrite(NoticeVO noticeVO, HttpServletRequest request, Principal userVO) {
		
		noticeVO.setUserid(userVO.getName());
		int result = noticeService.insertNoticeWrite(noticeVO);
		if(result>0) {
			
			return "redirect:noticeView.do?nno="+noticeVO.getNno();
			
		}else {
			
			return "redirect:noticeWrite.do";
		}
		
		
	}
	
	@RequestMapping(value="/noticeBoard/noticeView.do", method=RequestMethod.GET)
	public String noticeView(int nno, Model model) {
		
		NoticeVO vo = noticeService.selectOne(nno);
		
		if (vo.getRdate() != null) {
	        String originalRdate = vo.getRdate(); // "yyyy-MM-dd HH:mm:ss" 형식 가정
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	        LocalDateTime dateTime = LocalDateTime.parse(originalRdate, formatter);
	        
	        // 날짜만 문자열로 변환
	        String formattedDate = dateTime.toLocalDate().toString(); // "yyyy-MM-dd"
	        vo.setRdate(formattedDate); // vo 객체에 날짜만 다시 설정
	    }
		model.addAttribute("vo", vo);
		return "noticeBoard/noticeView";
	}
	
	
	@RequestMapping(value="/noticeBoard/noticeModify", method=RequestMethod.GET)
	public String noticeModify(Model model, Integer nno) {
		
		NoticeVO vo = noticeService.selectOne(nno);
		
		if (vo.getRdate() != null) {
	        String originalRdate = vo.getRdate(); // "yyyy-MM-dd HH:mm:ss" 형식 가정
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	        LocalDateTime dateTime = LocalDateTime.parse(originalRdate, formatter);
	        
	        // 날짜만 문자열로 변환
	        String formattedDate = dateTime.toLocalDate().toString(); // "yyyy-MM-dd"
	        vo.setRdate(formattedDate); // vo 객체에 날짜만 다시 설정
	    }
		model.addAttribute("vo", vo);
		
		
		
		return "noticeBoard/noticeModify";
	}
	
	@RequestMapping(value="noticeBoard/noticeModifyOk", method=RequestMethod.POST)
	public String noticeModifyOk(NoticeVO noticeVO) {
		
		int result = noticeService.noticeUpdate(noticeVO);
		if(result>0) {
			
			return "redirect:noticeView.do?nno="+noticeVO.getNno();
			
		}else {
			
			return "redirect:noticeWrite.do";
		}
	}
	
	@RequestMapping(value="noticeBoard/noticeRemove.do", method=RequestMethod.POST)
	public String noticeRemove(int nno) {
		
		int result = noticeService.changeState(nno);
		
		
		return "redirect:noticeList.do";
		
	}

}
