package com.ticketproject.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticketproject.dao.PrfImgDAO;
import com.ticketproject.vo.PrfImgVO;

@Service
public class PrfImgServiceImpl implements PrfImgService{
	
	@Autowired
	PrfImgDAO prfImgDAO;

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
	    prfImgDAO.updateStyurl(updateList);
	}


}
