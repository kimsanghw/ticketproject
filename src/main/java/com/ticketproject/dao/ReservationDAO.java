package com.ticketproject.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.ReservationVO;
import com.ticketproject.vo.RprfVO;

@Repository
public class ReservationDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<RprfVO> findSchedulesByDate(String prfid, String date) {
        return sqlSession.selectList("com.ticketproject.mapper.ReservationMapper.findSchedulesByDate",
                                     Map.of("prfid", prfid, "date", date));
    }
	
	
	public int insertReservation(ReservationVO reservation) {
	    return sqlSession.insert("com.ticketproject.mapper.ReservationMapper.insertReservation", reservation);
	}
	
	
	public int getRemainingSeats(int rprfid) {
	    return sqlSession.selectOne("com.ticketproject.mapper.ReservationMapper.getRemainingSeats", rprfid);
	}

	
}
