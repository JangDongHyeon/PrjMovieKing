package com.spirng.movieKing.movie.service;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


@Service
public class MovieServiceImpl implements MovieService {
	private static final Logger logger = LoggerFactory.getLogger(MovieServiceImpl.class);

	@Override
	public JSONArray getMovieList() throws Exception {
		BufferedInputStream reader = null;
		try {
			URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/"
					+ "searchDailyBoxOfficeList.json" + "?key=09ef5a1d8dc892084547547c61c96867" + "&targetDt=20181219"+"&itemPerPage=6");
			reader = new BufferedInputStream(url.openStream());
			StringBuffer buffer = new StringBuffer();
			int i;
			byte[] b = new byte[4096];
			while ((i = reader.read(b)) != -1) {
				buffer.append(new String(b, 0, i));
			}
			
			JSONParser jsonparser = new JSONParser();
			JSONObject jsonobject = (JSONObject) jsonparser.parse(buffer.toString());
			JSONObject json = (JSONObject) jsonobject.get("boxOfficeResult");
			JSONArray array = (JSONArray) json.get("dailyBoxOfficeList");
	
			
			return array;

		} finally {
			if (reader != null)
				reader.close();
		}
	}

	@Override
	public Map<String, Object> getMovie(String movieCd) throws Exception {
		BufferedInputStream reader=null;
		Map<String,Object> map=new HashMap<String, Object>();
		
	

		try
		
		{
			URL url=new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json"
					+"?key=09ef5a1d8dc892084547547c61c96867"+"&movieCd="+movieCd);
		reader=new BufferedInputStream(url.openStream());
		StringBuffer buffer=new StringBuffer();
		int i;
		byte[] b = new byte[4096];
		while((i=reader.read(b))!=-1) {
			buffer.append(new String(b,0,i));
		}
		JSONParser jsonparser = new JSONParser();
		JSONObject jsonobject = (JSONObject) jsonparser.parse(buffer.toString());
		JSONObject movieInfoResult = (JSONObject) jsonobject.get("movieInfoResult");
		JSONObject movieInfo=(JSONObject)movieInfoResult.get("movieInfo");
		
		//영화제목
		logger.info((String) movieInfo.get("movieNm"));
		map.put("movieNm",movieInfo.get("movieNm"));
		//감독
		JSONArray directors=(JSONArray)movieInfo.get("directors");
		
		map.put("directors", directors);

		//영화 국가
		JSONArray nations=(JSONArray)movieInfo.get("nations");
		
		map.put("nations",nations);
		
		
		//영화배우
		JSONArray actors = (JSONArray) movieInfo.get("actors");
		
		map.put("actors", actors);
		
		//영화개봉일
		logger.info((String) movieInfo.get("openDt"));
		map.put("openDt",movieInfo.get("openDt"));
		
		//상영시간
		logger.info((String) movieInfo.get("showTm"));
		map.put("showTm",movieInfo.get("showTm"));
		
		//누적 관객수
		logger.info((String) movieInfo.get("audiAcc"));
		map.put("audiAcc",movieInfo.get("audiAcc"));
		
		//영어 제목
		logger.info((String) movieInfo.get("movieNmEn"));
		map.put("movieNmEn",movieInfo.get("movieNmEn"));
		
		
		
		//등급
	JSONArray audits = (JSONArray) movieInfo.get("audits");
		
	    map.put("audits",audits);
	    
		//장르
	    JSONArray genres = (JSONArray) movieInfo.get("genres");
	    map.put("genres",genres);
		
	
		
		return map;	
		}
		
		
		
		finally {
			if (reader != null)
				reader.close();
		}
	}

}
