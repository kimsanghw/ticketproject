package com.ticketproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticketproject.dao.RprfDAO;
import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.RprfVO;

@Service
public class RprfServiceImpl implements RprfService{
	
	@Autowired
	public RprfDAO rprfDAO;

	@Override
    public List<RprfVO> getPerformanceListByUser(String userid) {
        return rprfDAO.selectPerformanceListByUser(userid);
    }

	@Override
	public int updateAllSeatCnt(HallVO hallVO) {
		return rprfDAO.updateAllSeatCnt(hallVO);
	}

	@Override
	public String getHallIdByUserId(String userid) {
		
		return rprfDAO.findHallIdByUserId(userid);
	}
	
	public HallVO getHallInfoByHallId(String hallid) {
	    return rprfDAO.selectHallInfoByHallId(hallid);
	}

}
