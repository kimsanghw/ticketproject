package com.ticketproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticketproject.dao.NoticeDAO;
import com.ticketproject.vo.NoticeVO;
import com.ticketproject.vo.SearchVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	 @Autowired
	 private NoticeDAO NoticeDAO;

	@Override
	public List<NoticeVO> noticeList(SearchVO searchVO) {

		return NoticeDAO.noticeList(searchVO);
	}

	@Override
	public int insertNoticeWrite(NoticeVO noticeVO) {
		
		return NoticeDAO.insertNoticeWrite(noticeVO);
	}
	
	@Override
	public NoticeVO selectOne(int nno) {
		return NoticeDAO.selectOne(nno);
	}
	
	@Override
	public int noticeUpdate(NoticeVO noticeVO) {
		return NoticeDAO.noticeUpdate(noticeVO);
	}

	@Override
	public int changeState(int nno) {
		
		return NoticeDAO.changeState(nno);
	}

	@Override
	public int selectTotal(SearchVO searchVO) {
		
		return NoticeDAO.selectTotal(searchVO);
	}
}
