package com.kh.eco.event.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.eco.event.model.vo.Event;

@Repository
public class EventDao {

	public ArrayList<Event> selectEventList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("activityMapper.selectEventList");
	}

	public Event selectEventDetail(SqlSessionTemplate sqlSession, int activityNo) {
		
		return sqlSession.selectOne("activityMapper.selectEventDetail", activityNo);
	}

	public int insertEvent(SqlSessionTemplate sqlSession, Event e) {
		
		return sqlSession.insert("activityMapper.insertEvent", e);
	}

	public int updateEvent(SqlSessionTemplate sqlSession, Event event) {
		
		return sqlSession.update("activityMapper.updateEvent", event);
	}

	public int deleteEvent(SqlSessionTemplate sqlSession, int activityNo) {
		
		return sqlSession.update("activityMapper.deleteEvent", activityNo);
	}

	public int joinEvent(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
	
		return sqlSession.update("activityMapper.joinEvent", map);
	}

}
