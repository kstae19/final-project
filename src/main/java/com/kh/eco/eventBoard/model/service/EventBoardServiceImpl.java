package com.kh.eco.eventBoard.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.eco.common.model.vo.PageInfo;
import com.kh.eco.eventBoard.model.dao.EventBoardDao;
import com.kh.eco.eventBoard.model.vo.EventBoard;
import com.kh.eco.eventBoard.model.vo.Reply;

@Service
public class EventBoardServiceImpl implements EventBoardService {
	
	@Autowired
	private EventBoardDao eventBoardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return eventBoardDao.selectListCount(sqlSession);
	}
	
	@Override
	public ArrayList<EventBoard> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return eventBoardDao.selectList(sqlSession, rowBounds);
	}

	@Override
	public int insertEventBoard(EventBoard b) {
		return eventBoardDao.insertEventBoard(sqlSession, b);
	}

	@Override
	public int increaseCount(int bNo) {
		return eventBoardDao.increaseCount(sqlSession, bNo);
	}

	@Override
	public EventBoard selectEventBoard(int bNo) {
		return eventBoardDao.selectEventBoard(sqlSession, bNo);
	}

	@Override
	public int deleteEventBoard(int bNo) {
		return eventBoardDao.deleteEventBoard(sqlSession, bNo);
	}

	@Override
	public int updateEventBoard(EventBoard b) {
		return eventBoardDao.updateEventBoard(sqlSession, b);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bNo) {
		return eventBoardDao.selectReplyList(sqlSession, bNo);
	}

	@Override
	public int insertReply(Reply r) {
		return eventBoardDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<EventBoard> selectTopBoard() {
		return eventBoardDao.selectTopBoard(sqlSession);
	}
	
	

}



