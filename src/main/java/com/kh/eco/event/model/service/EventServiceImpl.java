package com.kh.eco.event.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.eco.event.model.dao.EventDao;
import com.kh.eco.event.model.vo.Event;

@Service
public class EventServiceImpl implements EventService{

	@Autowired
	private EventDao eventDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Event> selectEventList() {
		
		return eventDao.selectEventList(sqlSession);
	}

	@Override
	public Event selectEventDetail(int eventNo) {
		
		return eventDao.selectEventDetail(sqlSession, eventNo);
	}

	@Override
	public int insertEvent(Event event) {
		
		return eventDao.insertEvent(sqlSession, event);
	}

	@Override
	public int updateEvent(Event event) {
		
		return eventDao.updateEvent(sqlSession, event);
	}

	@Override
	public int deleteEvent(int eventNo) {
		
		return eventDao.deleteEvent(sqlSession, eventNo);
	}
	
	

}
