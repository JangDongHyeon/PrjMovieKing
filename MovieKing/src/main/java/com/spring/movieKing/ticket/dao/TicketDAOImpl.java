package com.spring.movieKing.ticket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.movieKing.model.dto.ScreeningInfo;
import com.spring.movieKing.model.dto.Theater;

@Repository
public class TicketDAOImpl implements TicketDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String MAPPER_ID = "com.spring.movieKing.ticket.dao.TicketDAO";

	@Override
	public List<ScreeningInfo> getScreeningInfoList(int movieCd, int theaterCd, String date) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("movieCd", movieCd);
		parameter.put("theaterCd", theaterCd);
		parameter.put("date", date);
		
		return sqlSession.selectList(String.format("%s.getScreeningInfoList", MAPPER_ID), parameter);
	}

	@Override
	public List<Theater> getTheaterList() {
		return sqlSession.selectList(String.format("%s.getTheaterList", MAPPER_ID));
	}

}
