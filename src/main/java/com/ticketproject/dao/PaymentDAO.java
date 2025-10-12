package com.ticketproject.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticketproject.vo.OrderCreateForm;
import com.ticketproject.vo.PaymentVO;

@Repository
public class PaymentDAO {

	@Autowired
	SqlSession sqlSession;
	

	public int insertPaymentInfo(OrderCreateForm orderCreateForm) { return
		sqlSession.insert("com.ticketproject.mapper.PaymentMapper.insertPaymentInfo", orderCreateForm);
	}
	
	
	public OrderCreateForm findPayInfo(String tid) {
		return sqlSession.selectOne("com.ticketproject.mapper.PaymentMapper.findPayInfo", tid);
	}
}
