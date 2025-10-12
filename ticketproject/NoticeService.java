package com.ticketproject.service;

import java.util.List;

import com.ticketproject.vo.NoticeVO;
import com.ticketproject.vo.SearchVO;

public interface NoticeService {
	public List<NoticeVO> noticeList(SearchVO searchVO);
	public int insertNoticeWrite(NoticeVO noticeVO);
	public NoticeVO selectOne(int nno);
	public int noticeUpdate(NoticeVO noticeVO);
	public int changeState(int nno);
	public int selectTotal(SearchVO searchVO);
	
}
