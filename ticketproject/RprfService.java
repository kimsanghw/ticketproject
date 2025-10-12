package com.ticketproject.service;

import java.util.List;

import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.RprfVO;

public interface RprfService {

	/*List<RprfVO> rprfList(Principal hallVO);*/
	public List<RprfVO> getPerformanceListByUser(String userid);
	public int updateAllSeatCnt(HallVO hallVO);
	public String getHallIdByUserId(String userid);
	public HallVO getHallInfoByHallId(String hallid);

	
}
