package com.ticketproject.service;

import com.ticketproject.vo.ReportVO;

public interface ReportService {

	public int insertReport(ReportVO reportVO);

	public int reportChangeProcess(int reportid);

}
