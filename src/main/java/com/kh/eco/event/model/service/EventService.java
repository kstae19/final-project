package com.kh.eco.event.model.service;


import com.kh.eco.eventBoard.model.vo.EventBoard;
import java.util.ArrayList;

import com.kh.eco.event.model.vo.Event;


public interface EventService {
	
	
	ArrayList<Event> selectEventList();
	Event selectEventDetail(int eventNo);
	int insertEvent(Event event);
	int updateEvent(Event event);
	int deleteEvent(int eventNo);
	
	
}


