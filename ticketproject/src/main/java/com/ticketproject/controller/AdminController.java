
package com.ticketproject.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ticketproject.service.AdminService;
import com.ticketproject.util.PagingUtil;
import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.ReportVO;
import com.ticketproject.vo.ReservationVO;
import com.ticketproject.vo.SearchVO;
import com.ticketproject.vo.UserVO;

@Controller
public class AdminController {
	
	@Autowired
	public AdminService adminService;
	
	 @RequestMapping(value="adminpage/adminPage.do", method = RequestMethod.GET)
	    public String adminPage(@RequestParam(value="userNowPage", required=false, defaultValue="1") int userNowPage,
	                            @RequestParam(value="hallNowPage", required=false, defaultValue="1") int hallNowPage,
	                            @RequestParam(value="reservationNowPage", required=false, defaultValue="1") int reservationNowPage,
	                            @RequestParam(value="nowpage", required=false, defaultValue="1") int nowpage,
	                            SearchVO searchVO, Model model) {
	        
		 System.out.println("Received nowpage: " + nowpage);
	        // 일반 유저 페이징
	        int userTotal = adminService.selectUserTotal(searchVO);
	        PagingUtil userPaging = new PagingUtil(userNowPage, userTotal, 3);
	        searchVO.setStart(userPaging.getStart());
	        searchVO.setPerPage(userPaging.getPerPage());
	        List<UserVO> userList = adminService.userList(searchVO);

	        // 공연장 유저 페이징
	        int hallTotal = adminService.selectHallTotal(searchVO);
	        PagingUtil hallPaging = new PagingUtil(hallNowPage, hallTotal, 3);
	        searchVO.setStart(hallPaging.getStart());
	        searchVO.setPerPage(hallPaging.getPerPage());
	        List<HallVO> hallAllList = adminService.hallAllList(searchVO);

	        // 예매 내역 페이징
	        int reservationTotal = adminService.selectReservationTotal(searchVO);
	        PagingUtil reservationPaging = new PagingUtil(reservationNowPage, reservationTotal, 3);
	        searchVO.setStart(reservationPaging.getStart());
	        searchVO.setPerPage(reservationPaging.getPerPage());
	        List<ReservationVO> ReservationList = adminService.ReservationList(searchVO);
	        List<HallVO> hallList = adminService.hallList();
	        // 신고페이지 페이징
	        int total = adminService.selectTotal(searchVO);
	        PagingUtil paging = new PagingUtil(nowpage, total, 3);
	        searchVO.setStart(paging.getStart());
	        searchVO.setPerPage(paging.getPerPage());
	        List<ReportVO> reportList = adminService.reportList(searchVO);
	        System.out.println("총 갯수 :" + total);
	        System.out.println("리스트 :" + reportList);
	        // 날짜 포맷 변경
	        for (ReportVO report : reportList) {
	            if (report.getRdate() != null) {
	                String originalRdate = report.getRdate();
	                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	                LocalDateTime dateTime = LocalDateTime.parse(originalRdate, formatter);
	                String formattedDate = dateTime.toLocalDate().toString();
	                report.setRdate(formattedDate);
	            }
	        }
	        
	        model.addAttribute("userList", userList);
	        model.addAttribute("hallAllList", hallAllList);
	        model.addAttribute("ReservationList", ReservationList);
	        model.addAttribute("reportList", reportList);
	        model.addAttribute("userPaging", userPaging);
	        model.addAttribute("hallPaging", hallPaging);
	        model.addAttribute("reservationPaging", reservationPaging);
	        model.addAttribute("paging", paging);
	        model.addAttribute("hallList", hallList);

	        return "/adminpage/adminPage";
	    }

	
	@RequestMapping(value="/download", method = RequestMethod.GET)
	public void download(HttpServletResponse response ,int hallid, HttpServletRequest request) throws Exception{
		
		 // 데이터베이스에서 파일 이름 조회
		  // 데이터베이스에서 파일 이름 조회
		Map<String, String> fileName = adminService.getImgPath(hallid);
	    
	    System.out.println(fileName);
	    if (fileName == null || fileName.isEmpty()) {
	        throw new RuntimeException("데이터베이스에서 파일 이름을 찾을 수 없습니다: hallid=" + hallid);
	    }
	    
	    String savedFileName = fileName.get("chgimg");
	    String originalFileName = fileName.get("img");


	    // 파일 경로 조합
	    String imgPath = request.getSession().getServletContext().getRealPath("/resources/upload/") + savedFileName;
	    System.out.println("imgPath: " + imgPath);

	    // 파일 객체 생성
	    File file = new File(imgPath);
	    if (!file.exists()) {
	        
	        throw new RuntimeException("파일을 찾을 수 없습니다: " + imgPath);
	    }

	    // HTTP 응답 설정
	   
	    response.setContentType("application/octet-stream");
	    response.setContentLength((int) file.length());
	    response.setHeader("Content-Disposition",
	            "attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");

	    // 파일 데이터 스트림 전송
	    try (FileInputStream fis = new FileInputStream(file);
	         OutputStream os = response.getOutputStream()) {
	        byte[] buffer = new byte[1024];
	        int bytesRead;

	        while ((bytesRead = fis.read(buffer)) != -1) {
	            os.write(buffer, 0, bytesRead);
	        }
	    }
	    
	}
	
	
	@RequestMapping(value = "/updateEnabled", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateEnabled(@RequestBody Map<String, Object> request) {
	    Map<String, Object> result = new HashMap<>();
	    try {
	        int hallid = (int) request.get("hallid");
	        int enabled = (int) request.get("enabled");

	        int updateResult = adminService.updateEnabled(hallid, enabled);
	        if (updateResult > 0) {
	            List<HallVO> updatedHallList = adminService.hallList(); // 갱신된 리스트
	            result.put("success", true);
	            result.put("message", "승인이 성공적으로 처리되었습니다.");
	            result.put("hallList", updatedHallList); // 반환할 리스트 추가
	        } else {
	            result.put("success", false);
	            result.put("message", "승인 처리에 실패했습니다.");
	        }
	    } catch (Exception e) {
	        result.put("success", false);
	        result.put("message", "오류가 발생했습니다: " + e.getMessage());
	    }
	    return result;
	}
		
}


