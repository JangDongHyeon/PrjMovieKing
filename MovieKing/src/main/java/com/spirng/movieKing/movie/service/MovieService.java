package com.spirng.movieKing.movie.service;

import java.util.Map;

import org.json.simple.JSONArray;


public interface MovieService {
	JSONArray getMovieList() throws Exception;
	 Map<String,Object> getMovie(String movieCd) throws Exception;
	 
		

}
