package com.ticketproject.service;

import java.util.List;

import com.ticketproject.vo.ReviewVO;

public interface ReviewService {

	public int insertReview(ReviewVO reviewVO);
	public int findRprfidByPrfid(int prfid);
	public List<ReviewVO> reviewListByRprfid(int rprfid);
	public int updateReview(ReviewVO reviewVO);
	public int updateReviewRemove(ReviewVO reviewVO);
	public ReviewVO selectReview(int reviewid);
	

}
