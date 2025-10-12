package com.ticketproject.service;

import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.UserVO;

public interface UserService {
	public int insert(UserVO userVO);
	
	public int hallInsert(HallVO hallVO);
	
	public int findEmail(String email);
	
	public int idCheck(String userid);
}
