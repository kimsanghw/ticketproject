package com.ticketproject.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticketproject.vo.NoticeVO;
import com.ticketproject.vo.SearchVO;

@Repository
public class NoticeDAO {
	
	@Autowired
    private SqlSession sqlSession;
	
	

	public List<NoticeVO> noticeList(SearchVO searchVO) {
		
		return sqlSession.selectList("com.ticketproject.mapper.NoticeMapper.selectAll", searchVO);
	}
	
	public int insertNoticeWrite(NoticeVO noticeVO) {
		return sqlSession.insert("com.ticketproject.mapper.NoticeMapper.insertNoticeWrite", noticeVO);
	}
	
	public NoticeVO selectOne(int nno) {
		return sqlSession.selectOne("com.ticketproject.mapper.NoticeMapper.selectOne", nno);
	}
	
	public int noticeUpdate(NoticeVO noticeVO) {
		return sqlSession.update("com.ticketproject.mapper.NoticeMapper.noticeUpdate", noticeVO);
	}
	
	public int changeState(int nno) {
		return sqlSession.update("com.ticketproject.mapper.NoticeMapper.changeState", nno);
	}
	
	public int selectTotal(SearchVO searchVO) {
		return sqlSession.selectOne("com.ticketproject.mapper.NoticeMapper.selectTotal", searchVO);
	}
	

}
