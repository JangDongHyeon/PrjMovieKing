package com.spring.movieKing.ticket.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.movieKing.ticket.dao.TicketDAOImpl;

@Service
public class TicketServiceImpl implements TicketService {
	
	@Autowired
	private TicketDAOImpl ticketDAO;

	@Override
	public JSONArray getTheaterList() {
		JSONArray jsonArr = new JSONArray();
		List<Map<Integer, String>> theaterList = ticketDAO.getTheaterList();
		
		for (Map<Integer, String> theater : theaterList) {
			jsonArr.add(theater);
		}
		
		return jsonArr;
	}

}
