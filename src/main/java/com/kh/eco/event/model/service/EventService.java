package com.kh.eco.event.model.service;

import com.kh.eco.eventBoard.model.vo.EventBoard;

public interface EventService {
	
	// 게시글 작성
	public void create(EventBoard eBoard) throws Exception;
	// 게시글 상세보기
	public EventBoard read(int bno) throws Exception;
	
	
	
	
	

}


