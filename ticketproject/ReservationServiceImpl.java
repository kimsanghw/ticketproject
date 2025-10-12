package com.ticketproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ticketproject.dao.ReservationDAO;
import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.ReservationVO;
import com.ticketproject.vo.RprfVO;

@Service
public class ReservationServiceImpl implements ReservationService {
	@Autowired
    private ReservationDAO reservationDAO;
	
	@Override
    public List<RprfVO> findSchedulesByDate(String prfid, String date) {
        return reservationDAO.findSchedulesByDate(prfid, date);
    }
	
	@Override
    public int insertReservation(ReservationVO reservation) {
        reservationDAO.insertReservation(reservation);
     
        return reservation.getReservationid(); // �깮�꽦�맂 PK 媛� 諛섑솚
    }
	
	@Override
	public int getRemainingSeats(int rprfid) {
	    return reservationDAO.getRemainingSeats(rprfid);
	}
    
	
}
