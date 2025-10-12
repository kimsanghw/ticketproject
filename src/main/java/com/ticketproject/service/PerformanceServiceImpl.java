package com.ticketproject.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ticketproject.dao.PerformanceDAO;
import com.ticketproject.dao.PrfImgDAO;
import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.PerformanceVO;
import com.ticketproject.vo.PrfImgVO;
import com.ticketproject.vo.RprfVO;

@Service
public class PerformanceServiceImpl  implements PerformanceService {
	    @Autowired
	    private PerformanceDAO performanceDAO;

	    @Autowired
	    private PrfImgDAO prfimgDAO;
	    

	    //공연 및 이미지 데이터의 존재 여부를 확인하고, 존재하면 업데이트하고, 없으면 삽입합니다.
	    @Transactional
	    public void savePerformanceAndImages(List<PerformanceVO> performanceList, List<PrfImgVO> prfimgList) {
	    	for (PerformanceVO performance : performanceList) {
	    	    PerformanceVO existingPerformance = performanceDAO.selectPerformanceByMt20id(performance.getMt20id());
	    	   
				int prfid;
				
				if (existingPerformance == null) {
				    performanceDAO.insertPerformance(performance); // 공연 정보 삽입
				    prfid = performance.getPrfid(); // 삽입된 공연의 prfid 가져오기 (자동 생성된 키)
				} else {
				    prfid = existingPerformance.getPrfid();
				}
				for (PrfImgVO prfimg : prfimgList) {
					if (performance.getPrfid() == prfimg.getPrfid()) { // prfid로 매핑
						prfimg.setPrfid(prfid); // 정확한 prfid 설정
				    	prfimgDAO.insertPrfimg(prfimg); // 포스터 삽입
				    	break;
					}
				}

				/*
				 * for (PrfImgVO prfimg : prfimgList) { //System.out.println("공연 이미지 삽입 준비중");
				 * for(PrfImgVO checkPrfid : existingPrfImg) {
				 * System.out.println("prfid 체크 대기"); System.out.println(prfid);
				 * System.out.println(checkPrfid.getPrfid()); if (prfid !=
				 * checkPrfid.getPrfid()) { // prfid로 매핑 prfimg.setPrfid(prfid); // 정확한 prfid 설정
				 * prfimgDAO.insertPrfimg(prfimg); // 포스터 삽입 //break; } else if (prfid ==
				 * checkPrfid.getPrfid()) { prfimg.setPrfid(prfid);
				 * prfimgDAO.updatePrfimg(prfimg); } }
				 * 
				 * }
				 */
	    	  }
	    	}

	    @Override
	    public List<PerformanceVO> getAllPerformances() {
	        return performanceDAO.getAllPerformances();
	    }

	    @Override
	    public List<PrfImgVO> getAllPrfimgs() {
	        return prfimgDAO.getAllPrfimgs();
	    }
	    
	    @Override
	    public List<PerformanceVO> searchPerformances(String keyword){
	    	return performanceDAO.searchPerformances(keyword);
	    }
	    
	    @Override
	    public int performance_write(RprfVO rprfVO) {
	    	return performanceDAO.performance_write(rprfVO);
	    }
	    
	    @Override
	    public HallVO viewPerformance(String hallid){
	    	return performanceDAO.viewPerformance(hallid);
	    }
	    
	    @Override
	    public RprfVO performanceView(int rprfid) {
	    	return performanceDAO.performanceView(rprfid);
	    }
	    
	    @Override
	    public int performanceModify(RprfVO rprfVO) {
	        return performanceDAO.performanceModify(rprfVO);
	    }

		
		@Override 
		public List<PerformanceVO> getAllmt20id() { 
			return performanceDAO.getAllmt20id();
		}
		
	    
	    @Override
	    public int performance_delete(int rprfid) {
	    	return performanceDAO.performance_delete(rprfid);
	    }

	    @Transactional
	    public void updatePerformanceAndImage(Map<String, PerformanceVO> updatePrf, Map<String, PrfImgVO> updateImg) {
	        updatePrfInfo(updatePrf);
	        updateStyurl(updateImg);
	    }

	    @Override
	    public void updatePrfInfo(Map<String, PerformanceVO> updatePrf) {
	        List<Map<String, Object>> updateList = new ArrayList<>();
	        for (Map.Entry<String, PerformanceVO> entry : updatePrf.entrySet()) {
	            String mt20id = entry.getKey();
	            PerformanceVO performance = entry.getValue();
	            Map<String, Object> updateMap = new HashMap<>();
	            updateMap.put("mt20id", mt20id);
	            updateMap.put("prfcast", performance.getPrfcast());
	            updateMap.put("prfcrew", performance.getPrfcrew());
	            updateMap.put("prfruntime", performance.getPrfruntime());
	            updateMap.put("pcseguidance", performance.getPcseguidance());
	            updateMap.put("prfpdfrom", performance.getPrfpdfrom());
	            updateMap.put("prfpdto", performance.getPrfpdto());
	            updateList.add(updateMap);
	        }
	        performanceDAO.updatePrfInfo(updateList);
	    }

	    @Override
	    public void updateStyurl(Map<String, PrfImgVO> updateImg) {
	        List<Map<String, Object>> updateList = new ArrayList<>();
	        for (Map.Entry<String, PrfImgVO> entry : updateImg.entrySet()) {
	            String mt20id = entry.getKey();
	            PrfImgVO prfImg = entry.getValue();
	            Map<String, Object> updateMap = new HashMap<>();
	            updateMap.put("mt20id", mt20id);
	            updateMap.put("styuri1", prfImg.getStyuri1());
	            updateMap.put("styuri2", prfImg.getStyuri2());
	            updateMap.put("styuri3", prfImg.getStyuri3());
	            updateMap.put("styuri4", prfImg.getStyuri4());
	            updateList.add(updateMap);
	        }
	        prfimgDAO.updateStyurl(updateList);
	    }
	    
	    @Override
	    public PerformanceVO prfCheck(int prfid) {
	        return performanceDAO.prfCheck(prfid);
	    }
	    
	    @Override
	    public PrfImgVO prfImg(int prfid) {
	        return performanceDAO.prfImg(prfid);
	    }
	    
	    @Override
	    public List<String> getUnavailableDates(int prfid) {
	        return performanceDAO.getUnavailableDates(prfid);
	    }

		@Override
		public List<String> selectMt20id() {
			return performanceDAO.selectMt20id();
		}
	}

