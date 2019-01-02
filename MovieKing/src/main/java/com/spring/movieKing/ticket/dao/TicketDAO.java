package com.spring.movieKing.ticket.dao;

import java.util.List;

import com.spring.movieKing.model.dto.ScreeningInfo;
import com.spring.movieKing.model.dto.Theater;

public interface TicketDAO {
	
	List<Theater> getTheaterList();
	
	List<ScreeningInfo> getScreeningInfoList(int movieCd, int theaterCd, String date);
	
}
