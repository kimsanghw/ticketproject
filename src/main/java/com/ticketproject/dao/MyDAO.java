package com.ticketproject.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticketproject.vo.ReportVO;
import com.ticketproject.vo.ReservationVO;
import com.ticketproject.vo.UserVO;

@Repository
public class MyDAO {

	@Autowired // �쓽議댁꽦�쓣 �옄�룞�쑝濡� 二쇱엯 �빐二쇰뒗 �뼱�끂�뀒�씠�뀡
	private SqlSession sqlSession; // sql荑쇰━瑜� �떎�뻾�븯嫄곕굹 Mapper.xml�쓣 �뿰寃�
	 
	// �궡 �젙蹂� 遺덈윭�삤湲�
	public UserVO selectUserInfo(String userid) {
		return sqlSession.selectOne("com.ticketproject.mapper.MyMapper.selectUserInfo", userid);
	}
	 
	// 留덉씠�럹�씠吏� �쑀���젙蹂� �뾽�뜲�씠�듃
	public int updateUserInfo(UserVO userVO) {
		return sqlSession.update("com.ticketproject.mapper.MyMapper.updateUserInfo", userVO);
	}
	 
	public List<ReportVO> allReport(String userid){
		return sqlSession.selectList("com.ticketproject.mapper.MyMapper.allReport", userid);
	 }
 
	public int countReports(String userid) {
        return sqlSession.selectOne("com.ticketproject.mapper.MyMapper.countReports", userid);
    }

    // 페이징된 신고 내역 가져오기
    public List<ReportVO> getReports(String userid, int start, int perPage) {
        Map<String, Object> params = new HashMap<>();
        params.put("userid", userid);
        params.put("start", start);
        params.put("perPage", perPage);
        return sqlSession.selectList("com.ticketproject.mapper.MyMapper.getReports", params);
    }
    
    public List<ReservationVO> selectReservation(String userid) {
    	return sqlSession.selectList("com.ticketproject.mapper.MyMapper.selectReservation", userid);
    }
	
}
