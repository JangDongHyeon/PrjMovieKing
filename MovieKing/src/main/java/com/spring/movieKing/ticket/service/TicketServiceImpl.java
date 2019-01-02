package com.spring.movieKing.ticket.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.movieKing.model.dto.ScreeningInfo;
import com.spring.movieKing.model.dto.Theater;
import com.spring.movieKing.movie.service.MovieService;
import com.spring.movieKing.movie.service.MovieServiceImpl;
import com.spring.movieKing.ticket.dao.TicketDAO;
import com.spring.movieKing.ticket.dao.TicketDAOImpl;

@Service
public class TicketServiceImpl implements TicketService {

	private static final Logger logger = LoggerFactory.getLogger(TicketServiceImpl.class);

	@Autowired
	private TicketDAO ticketDAO;

	@Autowired
	private MovieService movieService;

	@Override
	public JSONObject getScreeningInfoList(int movieCd, int theaterCd, String date) {
		JSONObject resultJSON = new JSONObject();
		List<ScreeningInfo> screeningInfoList = ticketDAO.getScreeningInfoList(movieCd, theaterCd, date);

		List<Map<String, Object>> movieList = new ArrayList<Map<String, Object>>();
		List<Theater> theaterList = new ArrayList<Theater>();
		List<String> movieStdtList = new ArrayList<String>();

		for (ScreeningInfo si : screeningInfoList) {			
			try {
				String movieCdStr = Integer.toString(si.getMovieCd());
				Map<String, Object> movie = movieService.getMovie(movieCdStr);
				movie.put("movieCd", si.getMovieCd());
				if (!movieList.contains(movie)) {
					movieList.add(movie);
				}
				
				Theater theater = si.getTheater();
				if (!theaterList.contains(theater)) {
					theaterList.add(theater);
				}				
				
				String movieStdt = si.getMovieStdt();
				if (!movieStdtList.contains(movieStdt)) {
					movieStdtList.add(movieStdt);
				}				
			} catch (Exception e) {
				logger.error("영화(코드: {})를 가져오는데 실패했습니다.", si.getMovieCd(), e);
				movieList = null;
				theaterList = null;
				movieStdtList = null;
				break;
			}
		}
		
		resultJSON.put("movieList", movieList);
		resultJSON.put("theaterList", theaterList);
		resultJSON.put("movieStdtList", movieStdtList);

		return resultJSON;
	}

	@Override
	public JSONArray getTheaterList() {
		JSONArray resultArr = new JSONArray();
		List<Theater> theaterList = ticketDAO.getTheaterList();
		
		for (Theater t : theaterList) {
			resultArr.add(t);
		}
		
		return resultArr;
	}

}
