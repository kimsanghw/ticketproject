package com.ticketproject.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ticketproject.vo.PrfImgVO;

@Repository
public class PrfImgDAO {
	
	 @Autowired
	    private SqlSession sqlSession;
	 
	 public PrfImgVO selectPrfimgByPrfId(int prfId) {
	        return sqlSession.selectOne("com.ticketproject.mapper.PrfimgMapper.selectPrfimgByPrfId", prfId);
	    }

	 public void insertPrfimg(PrfImgVO prfimg) {
	        sqlSession.insert("com.ticketproject.mapper.PrfimgMapper.insertPrfimg", prfimg);
	    }
	 
	 public void updatePrfimg(PrfImgVO prfimg) {
	        sqlSession.update("com.ticketproject.mapper.PrfimgMapper.updatePrfimg", prfimg);
	    }
	 
	 public List<PrfImgVO> getAllPrfimgs() {
	      return sqlSession.selectList("com.ticketproject.mapper.PrfimgMapper.getAllPrfimgs");
	    }
	 
	public void updateStyurl(List<Map<String, Object>> updateList) {
		    sqlSession.update("com.ticketproject.mapper.PrfimgMapper.updateStyurl", updateList);
	}
	
	public List<PrfImgVO> getPrfImg(){
		return sqlSession.selectList("com.ticketproject.mapper.PrfimgMapper.getPrfImg");
	}
}
