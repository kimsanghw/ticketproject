package com.ticketproject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticketproject.dao.MyDAO;
import com.ticketproject.vo.ReportVO;
import com.ticketproject.vo.ReservationVO;
import com.ticketproject.vo.UserVO;


@Service
public class MyServicelmpl implements MyService{
	
	@Autowired
	public MyDAO myDAO; 
	
	@Override
	public UserVO selectOne(String userid) {
		return myDAO.selectUserInfo(userid);
	}
	
	@Override
	public int updateUserInfo(UserVO userVO) {
		return myDAO.updateUserInfo(userVO);
	}

	@Override
	public List<ReportVO> allReport(String userid) {
		return myDAO.allReport(userid);
	}
	
	@Override
	public int countReports(String userid) {
	    return myDAO.countReports(userid);
	}

	@Override
	public List<ReportVO> getReports(String userid, int start, int perPage) {
	    return myDAO.getReports(userid, start, perPage);
	}

	@Override
	public List<ReservationVO> selectReservation(String userid) {
		return myDAO.selectReservation(userid);
	}
	
}
