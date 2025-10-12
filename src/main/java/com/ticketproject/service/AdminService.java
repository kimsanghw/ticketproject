package com.ticketproject.service;

import java.util.List;
import java.util.Map;

import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.ReportVO;
import com.ticketproject.vo.ReservationVO;
import com.ticketproject.vo.SearchVO;
import com.ticketproject.vo.UserVO;

public interface AdminService {
	public List<HallVO> hallList();
	public Map<String, String> getImgPath(int hallid);
	public int updateEnabled(int hallid, int enabled);
	public List<ReportVO> reportList(SearchVO searchVO);
	public int selectTotal(SearchVO searchVO);
	public List<UserVO> userList(SearchVO searchVO);
	public List<ReservationVO> ReservationList(SearchVO searchVO);
	public int selectUserTotal(SearchVO searchVO);
	public int selectHallTotal(SearchVO searchVO);
	public int selectReservationTotal(SearchVO searchVO);
	public List<HallVO> hallAllList(SearchVO searchVO);
}
