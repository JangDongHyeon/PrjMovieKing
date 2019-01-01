package com.spring.movieKing.ticket.service;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public interface TicketService {
	
	JSONArray getTheaterList();
	
	JSONObject getScreeningInfoList(int movieCd, int theaterCd, String date);
	
}
