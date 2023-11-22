package com.kh.eco.event.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.eco.event.model.vo.Event;

@Repository
public class EventDao {

	public ArrayList<Event> selectEventList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("eventMapper.selectEventList");
	}

	public Event selectEventDetail(SqlSessionTemplate sqlSession, int eventNo) {
		
		return sqlSession.selectOne("eventMapper.selectEventDetail", eventNo);
	}

	public int insertEvent(SqlSessionTemplate sqlSession, Event event) {
		
		return sqlSession.insert("eventMapper.insertEvent", event);
	}

	public int updateEvent(SqlSessionTemplate sqlSession, Event event) {
		
		return sqlSession.update("eventMapper.updateEvent", event);
	}

	public int deleteEvent(SqlSessionTemplate sqlSession, int eventNo) {
		
		return sqlSession.update("eventMapper.deleteEvent", eventNo);
	}

}
