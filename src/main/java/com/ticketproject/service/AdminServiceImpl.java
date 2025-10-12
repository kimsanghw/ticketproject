package com.ticketproject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticketproject.dao.AdminDAO;
import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.ReportVO;
import com.ticketproject.vo.ReservationVO;
import com.ticketproject.vo.SearchVO;
import com.ticketproject.vo.UserVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	public AdminDAO adminDAO;

	@Override
	public List<HallVO> hallList() {
		
		return adminDAO.hallList();
	}

	
	@Override
	public Map<String, String> getImgPath(int hallid) {
		
		return adminDAO.getHallImg(hallid);
	}


	@Override
	public int updateEnabled(int hallid, int enabled) {
		
		return  adminDAO.updateEnabled(hallid, enabled);
	}


	@Override
	public List<ReportVO> reportList(SearchVO searchVO) {
		
		return adminDAO.reportList(searchVO);
	}


	@Override
	public int selectTotal(SearchVO searchVO) {
		
		return adminDAO.selectTotal(searchVO);
	}




	@Override
	public int selectUserTotal(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return adminDAO.selectUserTotal(searchVO);
	}


	@Override
	public int selectHallTotal(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return adminDAO.selectHallTotal(searchVO);
	}


	@Override
	public int selectReservationTotal(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return adminDAO.selectReservationTotal(searchVO);
	}


	@Override
	public List<HallVO> hallAllList(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return adminDAO.hallAllList(searchVO);
	}


	@Override
	public List<UserVO> userList(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return adminDAO.userList(searchVO);
	}


	@Override
	public List<ReservationVO> ReservationList(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return adminDAO.ReservationList(searchVO);
	}



}
