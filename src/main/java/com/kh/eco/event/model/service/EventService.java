package com.kh.eco.event.model.service;


import com.kh.eco.event.model.vo.Event;
import java.util.ArrayList;

import com.kh.eco.event.model.vo.Event;


public interface EventService {
	
	
	// 전체 이벤트 조회
	ArrayList<Event> selectEventList();
	
	// 세부 이벤트 조회
	Event selectEventDetail(int eventNo);
	
	
	// 이벤트 등록, 수정, 삭제
	int insertEvent(Event event);
	int updateEvent(Event event);
	int deleteEvent(int eventNo);
	
	
}


