package com.spirng.movieKing.movie.controller;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spirng.movieKing.movie.service.MovieService;


@Controller
@RequestMapping("/movies/*")
public class MovieController {
	
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	@Autowired
	private MovieService moService;
	
	
	@RequestMapping(value = "listJson", produces ="application/json;charset=UTF-8")
	@ResponseBody
	public JSONArray listJson() throws Exception {
		return moService.getMovieList();
	}
	@RequestMapping(value="detailJson/{movieCd}",produces ="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String,Object> getMovieJson(@PathVariable("movieCd")String movieCd) throws Exception{
		return moService.getMovie(movieCd);
	}
	@RequestMapping(value = "/list")
	public String list() {

		return "movies/movie";
	}
	@RequestMapping(value="/detail")
	public String detail(Model model,@RequestParam("movieCd")String movieCd,@RequestParam("im")String im,@RequestParam("audiCnt")String audiCnt) {
		model.addAttribute("movieCd",movieCd);
		model.addAttribute("im",im);
		model.addAttribute("audiCnt",audiCnt);
		return "movies/getMovie";
	}
	
	

}
