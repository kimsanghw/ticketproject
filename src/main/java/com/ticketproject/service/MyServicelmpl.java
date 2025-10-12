package com.ticketproject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticketproject.dao.MyDAO;
import com.ticketproject.vo.ReportVO;
import com.ticketproject.vo.ReservationVO;
import com.ticketproject.vo.UserVO;


@Service //�뾽臾대줈吏곸쓣 �떞�떦�븯�뒗 援ы쁽 媛앹껜瑜� �뒪�봽留곸씠 �깮�꽦�븯�뿬 愿�由�
public class MyServicelmpl implements MyService{
	
//  @Autowired瑜� �넻�빐 �옄�룞�쑝濡� 媛앹껜瑜� �깮�꽦 諛� 二쇱엯�븯�뿬 媛쒕컻�쓣 �렪由ы븯寃� �빐以�.
	
	@Autowired // �쓽議댁꽦�쓣 �옄�룞�쑝濡� 二쇱엯 �빐二쇰뒗 �뼱�끂�뀒�씠�뀡
	public MyDAO myDAO; // UserDAO 媛앹껜瑜� �옄�룞�쑝濡� 二쇱엯
	
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
