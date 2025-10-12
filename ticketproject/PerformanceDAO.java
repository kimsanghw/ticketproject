package com.ticketproject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.PerformanceVO;
import com.ticketproject.vo.PrfImgVO;
import com.ticketproject.vo.RprfVO;

@Repository
public class PerformanceDAO {

	@Autowired
	private SqlSession sqlSession;

	public PerformanceVO selectPerformanceByMt20id(String mt20id) {
		return sqlSession.selectOne("com.ticketproject.mapper.PerformanceMapper.selectPerformanceByMt20id", mt20id);
	}

	public void insertPerformance(PerformanceVO performance) {
		sqlSession.insert("com.ticketproject.mapper.PerformanceMapper.insertPerformance", performance);
	}

	public void updatePerformance(PerformanceVO performance) {
		sqlSession.update("com.ticketproject.mapper.PerformanceMapper.updatePerformance", performance);
	}

	public List<PerformanceVO> getAllPerformances() {
		return sqlSession.selectList("com.ticketproject.mapper.PerformanceMapper.getAllPerformances");
	}

	public List<PerformanceVO> searchPerformances(String keyword) {
		return sqlSession.selectList("com.ticketproject.mapper.PerformanceMapper.searchPerformances", keyword);
	}

	public int performance_write(RprfVO rprfVO) {
		return sqlSession.insert("com.ticketproject.mapper.PerformanceMapper.performance_write", rprfVO);
	}

	public HallVO viewPerformance(String hallid) {
		return sqlSession.selectOne("com.ticketproject.mapper.PerformanceMapper.viewPerformance", hallid);
	}

	public RprfVO performanceView(int rprfid) {
		return sqlSession.selectOne("com.ticketproject.mapper.PerformanceMapper.performanceView", rprfid);
	}

	public int performanceModify(RprfVO rprfVO) {
		return sqlSession.update("com.ticketproject.mapper.PerformanceMapper.performanceModify", rprfVO);
	}
	public int performance_delete(int rprfid) {
		return sqlSession.update("com.ticketproject.mapper.PerformanceMapper.performance_delete", rprfid);
	}

	public List<PerformanceVO> getAllmt20id() { 
		return sqlSession.selectList("com.ticketproject.mapper.PerformanceMapper.selectAllmt20id");
	}
	
	public void updatePrfInfo(List<Map<String, Object>> updateList) {
	    sqlSession.update("com.ticketproject.mapper.PerformanceMapper.updatePrfInfo", updateList);
	}
	
	public PerformanceVO prfCheck(int prfid) {
	    return sqlSession.selectOne("com.ticketproject.mapper.PerformanceMapper.prfCheck", prfid);
	}
	
	public PrfImgVO prfImg(int prfid) {
	    return sqlSession.selectOne("com.ticketproject.mapper.PerformanceMapper.prfImg", prfid);
	}
	
	public List<String> getUnavailableDates(int prfid) {
	    return sqlSession.selectList("com.ticketproject.mapper.PerformanceMapper.getUnavailableDates", prfid);
	}
	
	public Integer findRprfidByPrfid(int prfid) {
	    return sqlSession.selectOne("com.ticketproject.mapper.PerformanceMapper.findRprfidByPrfid", prfid);
	}
	
	public List<String> selectMt20id() {
		return sqlSession.selectList("com.ticketproject.mapper.PerformanceMapper.selectMt20id");
	}
	
}
