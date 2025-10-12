package com.ticketproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticketproject.dao.ReportDAO;
import com.ticketproject.vo.ReportVO;

@Service
public class ReportServiceImpl implements ReportService {
	
	 @Autowired
	 private ReportDAO ReportDAO;
	 

	@Override
	public int insertReport(ReportVO reportVO) {
		
		return ReportDAO.insertReport(reportVO);
	}


	@Override
	public int reportChangeProcess(int reportid) {
		
		return ReportDAO.reportChangeProcess(reportid);
	}

}
