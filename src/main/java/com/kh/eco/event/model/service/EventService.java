package com.kh.eco.event.model.service;


import com.kh.eco.eventBoard.model.vo.EventBoard;
import java.util.ArrayList;

import com.kh.eco.event.model.vo.Event;


public interface EventService {
	
	// 게시글 작성
	public void create(EventBoard eBoard) throws Exception;
	// 게시글 상세보기
	public EventBoard read(int bno) throws Exception;
	
	
	
	
	

	// 전체 이벤트 조회
	ArrayList<Event> selectEventList();
	
	// 세부 이벤트 조회
	Event selectEventDetail(int eventNo);
	
	
	// 이벤트 등록, 수정, 삭제
	int insertEvent(Event event);
	int updateEvent(Event event);
	int deleteEvent(int eventNo);
	
	
}


