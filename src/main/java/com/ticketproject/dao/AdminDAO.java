package com.ticketproject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.ReportVO;
import com.ticketproject.vo.ReservationVO;
import com.ticketproject.vo.SearchVO;
import com.ticketproject.vo.UserVO;

@Repository
public class AdminDAO {
	
	@Autowired
    private SqlSession sqlSession;

	public List<HallVO> hallList() {
		
		return sqlSession.selectList("com.ticketproject.mapper.HallMapper.selectHall");
	}

	public Map<String, String> getHallImg(int hallId) {
		
		return sqlSession.selectOne("com.ticketproject.mapper.HallMapper.getHallImg", hallId);
	}
	
	
	public int updateEnabled(int hallid, int enabled) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("hallid", hallid);
	    params.put("enabled", enabled);
	    return sqlSession.update("com.ticketproject.mapper.HallMapper.updateEnabled", params);
	}

	public List<ReportVO> reportList(SearchVO searchVO) {
		
		return sqlSession.selectList("com.ticketproject.mapper.ReportMapper.reportList",searchVO);
	}

	public int selectTotal(SearchVO searchVO) {
		
		return sqlSession.selectOne("com.ticketproject.mapper.ReportMapper.selectTotal", searchVO);
	}

	public List<UserVO> userList(SearchVO searchVO) {
		
		return sqlSession.selectList("com.ticketproject.mapper.userMapper.userList",searchVO);
	}

	public List<ReservationVO> ReservationList(SearchVO searchVO) {
		
		return sqlSession.selectList("com.ticketproject.mapper.ReservationMapper.ReservationList",searchVO);
	}

	public int selectUserTotal(SearchVO searchVO) {
		
		return sqlSession.selectOne("com.ticketproject.mapper.userMapper.selectUserTotal",searchVO);
	}

	public int selectHallTotal(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.ticketproject.mapper.userMapper.selectHallTotal",searchVO);
	}

	public int selectReservationTotal(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.ticketproject.mapper.userMapper.selectReservationTotal", searchVO);
	}

	public List<HallVO> hallAllList(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.ticketproject.mapper.HallMapper.hallAllList",searchVO);
	}


}
