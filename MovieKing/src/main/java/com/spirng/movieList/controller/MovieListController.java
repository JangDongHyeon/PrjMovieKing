package com.spirng.movieList.controller;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/movies/*")
public class MovieListController {
	

	@RequestMapping(value = "listJson", produces ="application/json;charset=UTF-8")
	@ResponseBody
	public JSONArray listJson() throws Exception {
		BufferedInputStream reader = null;
		Map<String,Object> map=new HashMap<String, Object>();
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
	@RequestMapping(value="detailJson/{movieCd}",produces ="application/json;charset=UTF-8")
	@ResponseBody
	public String getMovieJson(@PathVariable("movieCd")String movieCd) throws Exception{
		BufferedInputStream reader=null;
		try {
			URL url=new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json"
					+"?key=09ef5a1d8dc892084547547c61c96867"+"&movieCd="+movieCd);
			System.out.println("11111111111111111111111111");
		reader=new BufferedInputStream(url.openStream());
		StringBuffer buffer=new StringBuffer();
		int i;
		byte[] b = new byte[4096];
		while((i=reader.read(b))!=-1) {
			buffer.append(new String(b,0,i));
		}
		

		return buffer.toString();	
		} 
		finally {
			if (reader != null)
				reader.close();
		}
		
	}
	@RequestMapping(value = "/list")
	public String list() {

		return "movies/movie";
	}
	@RequestMapping(value="/detail")
	public String detail(Model model,@RequestParam("movieCd")String movieCd,@RequestParam("im")String im) {
		model.addAttribute("movieCd",movieCd);
		model.addAttribute("im",im);
		return "movies/getMovie";
	}
	
	

}
