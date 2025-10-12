package com.ticketproject.service;

import java.util.List;
import java.util.Map;

import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.PerformanceVO;
import com.ticketproject.vo.PrfImgVO;
import com.ticketproject.vo.RprfVO;

public interface PerformanceService {
	void savePerformanceAndImages(List<PerformanceVO> performances, List<PrfImgVO> prfimgs);
    List<PerformanceVO> getAllPerformances();
    List<PrfImgVO> getAllPrfimgs();
	List<PerformanceVO> searchPerformances(String keyword);
	public int performance_write(RprfVO rprfVO);
	public HallVO viewPerformance(String hallid);
	RprfVO performanceView(int rprfid);
	public int performanceModify(RprfVO rprfVO);
	public int performance_delete(int rprfid);
	public List<PerformanceVO> getAllmt20id();
	public void updatePrfInfo(Map<String, PerformanceVO>updatePrf);
	void updateStyurl(Map<String, PrfImgVO> updateImg);
	public PerformanceVO prfCheck(int prfid);
	public PrfImgVO prfImg(int prfid);
	List<String> getUnavailableDates(int prfid);
	
	public List<String> selectMt20id();
	
}
