package com.ticketproject.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticketproject.dao.PerformanceDAO;
import com.ticketproject.dao.ReviewDAO;
import com.ticketproject.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private PerformanceDAO performanceDAO;

	@Override
	public int insertReview(ReviewVO reviewVO) {
		
		return reviewDAO.insertReview(reviewVO);
	}
	
	@Override
	public int findRprfidByPrfid(int prfid) {
	    return Optional.ofNullable(performanceDAO.findRprfidByPrfid(prfid)).orElse(0);
	}

	 @Override
	 public List<ReviewVO> reviewListByRprfid(int rprfid) {
	        return reviewDAO.reviewListByRprfid(rprfid); 
	 }

	@Override
	public int updateReview(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		return reviewDAO.updateReview(reviewVO);
	}

	@Override
	public int updateReviewRemove(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		return reviewDAO.updateReviewRemove(reviewVO);
	}

	@Override
	public ReviewVO selectReview(int reviewid) {
		// TODO Auto-generated method stub
		return reviewDAO.selectReview(reviewid);
	}
	
	

}
