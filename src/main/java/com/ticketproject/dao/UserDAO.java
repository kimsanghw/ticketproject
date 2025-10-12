package com.ticketproject.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	SqlSession sqlSession;
	public int insert(UserVO userVO) {
		int result = 0;
		
		result = sqlSession.insert("com.ticketproject.mapper.userMapper.userInsert", userVO);
		return result;
	}
	
	public int hallInsert(HallVO hallVO) {
		int result = 0;
		
		result = sqlSession.insert("com.ticketproject.mapper.userMapper.hallInsert", hallVO);
		return result;
	}
	
	public int findEmail(String email) {
		int result = 0;
		
		result = sqlSession.selectOne("com.ticketproject.mapper.userMapper.findEmail",email);
		return result;
		
	}
	
	public int idCheck(String userid) {
		int result = 0;
		result = sqlSession.selectOne("com.ticketproject.mapper.userMapper.idCheck",userid);
		return result;
	}
	
}
