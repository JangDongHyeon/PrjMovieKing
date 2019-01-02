package com.spring.movieKing.ticket.controller;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.movieKing.movie.service.MovieService;
import com.spring.movieKing.ticket.service.TicketService;

@Controller
@RequestMapping("/ticket")
public class TicketController {

	private static final Logger logger = LoggerFactory.getLogger(TicketController.class);

	@Autowired
	private TicketService ticketService;
	
	@Autowired
	private MovieService movieService;

	@RequestMapping(value = {"", "/", "/main" }, method = RequestMethod.GET)
	public String main(HttpServletRequest request) {
		String[] path = request.getServletPath().split("/");		
		if (path.length <= 2) {
			return "redirect:/ticket/main";
		}
		
		return "ticket/main";
	}
	
	@RequestMapping(value = "/list/movie", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray getMovieList() throws Exception {
		return movieService.getMovieList();
	}
	
	@RequestMapping(value = "/list/theater", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray getTheaterList() {
		return ticketService.getTheaterList();
	}

	@RequestMapping(value = "/list/si", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject getScreeningInfoList(
			@RequestParam(name = "movieCd", defaultValue = "0") int movieCd, 
			@RequestParam(name = "theaterCd", defaultValue = "0") int theaterCd, 
			@RequestParam(name = "date", required = false) String date
	) 
	{
		logger.info("movieCd={}, theaterCd={}, date={}", movieCd, theaterCd, date);
		
		if (date == null
			|| date.equals("")
			|| date.equals("null")
			|| date.equals("undefined")
			|| date.equals("0")
			|| date.equals("NaN")
		)
		{
			date = null;
		}
		
		return ticketService.getScreeningInfoList(movieCd, theaterCd, date);
	}

}
