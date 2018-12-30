package com.spring.movieKing.ticket.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TicketDAOImpl implements TicketDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<Integer, String>> getTheaterList() {
		return sqlSession.selectList("com.spring.movieKing.ticket.dao.TicketDAO.getTheaterList");
	}

}
