package com.spring.movieKing.ticket.dao;

import java.util.List;
import java.util.Map;

public interface TicketDAO {

	List<Map<Integer, String>> getTheaterList();
	
}
