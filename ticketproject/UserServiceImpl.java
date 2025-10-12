package com.ticketproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticketproject.dao.UserDAO;
import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	public UserDAO userDAO;
	
	@Override
	public int insert(UserVO userVO) {
		int result = 0;
		
		result = userDAO.insert(userVO);
		return result;
	}

	@Override
	public int hallInsert(HallVO hallVO) {
		int result = 0;
		
		result = userDAO.hallInsert(hallVO);
		return result;
	}

	@Override
	public int findEmail(String email) {
		int result = 0;
		
		result = userDAO.findEmail(email);
		return result;
	}

	@Override
	public int idCheck(String userid) {
		int result = 0;
		result = userDAO.idCheck(userid);
		return result;
	}
	
}
