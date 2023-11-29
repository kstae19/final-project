package com.kh.eco.eventBoard.model.service;

import java.util.ArrayList;

import com.kh.eco.common.model.vo.PageInfo;
import com.kh.eco.eventBoard.model.vo.EventBoard;
import com.kh.eco.eventBoard.model.vo.Reply;

public interface EventBoardService {
	
	// 게시글 목록 조회 + 페이징처리
	int selectListCount();
	// 게시글 리스트 조회
	ArrayList<EventBoard> selectList(PageInfo pi);
	// 게시글 작성하기(INSERT)
	int insertEventBoard(EventBoard b);
	// 게시글 조회수 증가(UPDATE)
	int increaseCount(int bno);
	// 게시글상세조회(SELECT)
	EventBoard selectEventBoard(int bno);
	// 게시글 삭제하기(DELETE)
	int deleteEventBoard(int bno);
	// 게시글 수정하기(UPDATE)
	int updateEventBoard(EventBoard b);
	
	// ---------------------------------
	
	// 댓글목록조회
	ArrayList<Reply> selectReplyList(int bno);
	// 댓글작성
	int insertReply(Reply r);
	// 메인페이지 구성
	ArrayList<EventBoard> selectTopBoard();
	
	

}
