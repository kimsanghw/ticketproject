package com.ticketproject.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticketproject.vo.ReviewVO;

@Repository
public class ReviewDAO {
	
	@Autowired
    private SqlSession sqlSession;

	public int insertReview(ReviewVO reviewVO) {
		
		return sqlSession.insert("com.ticketproject.mapper.ReviewMapper.insertReview", reviewVO);
	}

	public List<ReviewVO> reviewListByRprfid(int rprfid) {
        return sqlSession.selectList("com.ticketproject.mapper.ReviewMapper.reviewListByRprfid", rprfid);
    }

	public int updateReview(ReviewVO reviewVO) {
		
		return sqlSession.update("com.ticketproject.mapper.ReviewMapper.updateReview", reviewVO);
	}

	public int updateReviewRemove(ReviewVO reviewVO) {
		
		return sqlSession.update("com.ticketproject.mapper.ReviewMapper.updateReviewRemove",reviewVO);
	}

	public ReviewVO selectReview(int reviewid) {
		
		return sqlSession.selectOne("com.ticketproject.mapper.ReviewMapper.selectReview", reviewid);
	}
	

}
