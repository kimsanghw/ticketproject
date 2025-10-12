package com.ticketproject.service;

import java.util.List;

import com.ticketproject.vo.HallVO;
import com.ticketproject.vo.ReservationVO;
import com.ticketproject.vo.RprfVO;

public interface ReservationService {
	List<RprfVO> findSchedulesByDate(String prfid,String date);
	public int insertReservation(ReservationVO reservation);
	int getRemainingSeats(int rprfid);

}
