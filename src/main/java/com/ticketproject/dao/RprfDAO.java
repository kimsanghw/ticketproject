package com.ticketproject.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.RprfVO;

@Repository
public class RprfDAO {
	
	@Autowired
	 private SqlSession sqlSession;

	public List<RprfVO> selectPerformanceListByUser(String userid) {
        return sqlSession.selectList("com.ticketproject.mapper.RprfMapper.selectPerformanceListByUser", userid);
    }

	public int updateAllSeatCnt(HallVO hallVO) {
		return sqlSession.update("com.ticketproject.mapper.HallMapper.updateAllSeatCnt", hallVO);
	}

	public String findHallIdByUserId(String userid) {
		
		return sqlSession.selectOne("com.ticketproject.mapper.HallMapper.findHallIdByUserId", userid);
	}

	public HallVO selectHallInfoByHallId(String hallid) {
		
		return sqlSession.selectOne("com.ticketproject.mapper.RprfMapper.selectHallInfoByHallId", hallid);
	}
}
