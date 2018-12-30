package com.spring.movieKing.ticket.controller;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.movieKing.ticket.service.TicketService;

@Controller
@RequestMapping("/ticket")
public class TicketController {

	private static final Logger logger = LoggerFactory.getLogger(TicketController.class);
	
	@Autowired
	private TicketService ticketService;
	
	@RequestMapping(value = {"/", "/main"}, method = RequestMethod.GET)
	public String main() {
		return "ticket/main";
	}
	
	@RequestMapping(value = "/list/theater", method=RequestMethod.GET)
	@ResponseBody
	public JSONArray getTheaterList() {
		return ticketService.getTheaterList();
	}
	
}
