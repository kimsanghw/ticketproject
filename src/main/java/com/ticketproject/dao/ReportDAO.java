package com.ticketproject.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticketproject.vo.ReportVO;

@Repository
public class ReportDAO {
	@Autowired
	 private SqlSession sqlSession;

	public int insertReport(ReportVO reportVO) {
		
		return sqlSession.insert("com.ticketproject.mapper.ReportMapper.insertReport", reportVO);
	}

	public int reportChangeProcess(int reportid) {
		
		return sqlSession.update("com.ticketproject.mapper.ReportMapper.reportChangeProcess", reportid);
	}

}
