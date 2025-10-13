package com.ticketproject.service;

import java.util.List;

import com.ticketproject.vo.ReportVO;
import com.ticketproject.vo.ReservationVO;
import com.ticketproject.vo.UserVO;

public interface MyService {

	public UserVO selectOne(String userid); 
	

    public int updateUserInfo(UserVO userVO);
    
    public List<ReportVO> allReport(String userid);
    
    int countReports(String userid); // 총 신고 내역 수
    List<ReportVO> getReports(String userid, int start, int perPage); // 페이징된 신고 내역
    
    public List<ReservationVO> selectReservation(String userid);
}
