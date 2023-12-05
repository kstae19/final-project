package com.kh.eco.event.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.eco.event.model.dao.EventDao;
import com.kh.eco.event.model.vo.Event;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class EventServiceImpl implements EventService{

	
	private final EventDao eventDao;
	
	private final SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Event> selectEventList() {
		
		return eventDao.selectEventList(sqlSession);
	}

	@Override
	public Event selectEventDetail(int eventNo) {
		
		return eventDao.selectEventDetail(sqlSession, eventNo);
	}

	@Override
	public int insertEvent(Event e) {
		
		return eventDao.insertEvent(sqlSession, e);
	}

	@Override
	public int updateEvent(Event event) {
		
		return eventDao.updateEvent(sqlSession, event);
	}

	@Override
	public int deleteEvent(int eventNo) {
		
		return eventDao.deleteEvent(sqlSession, eventNo);
	}

	@Override
	public int joinEvent(HashMap<String, Integer> map) {
	
		return eventDao.joinEvent(sqlSession, map);
	}
	
	

}
