package com.kh.eco.eventBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.eco.eventBoard.model.vo.EventBoard;
import com.kh.eco.eventBoard.model.vo.Reply;

@Repository
public class EventBoardDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("eventBoardMapper.selectListCount");
	}
	
	public ArrayList<EventBoard> selectList(SqlSessionTemplate sqlSession, RowBounds rowbounds) {
		return (ArrayList)sqlSession.selectList("eventBoardMapper.selectList", null, rowbounds);
	}
	
	public int insertEventBoard(SqlSessionTemplate sqlSession, EventBoard b) {
		return sqlSession.update("eventBoardMapper.insertEventBoard", b);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("eventBoardMapper.increateCount", bNo);
	}
	
	public EventBoard selectEventBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("eventBoardMapper.selectEventBoard", bNo);
	}

	public int deleteEventBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("eventBoardMapper.deleteEventBoard", bNo);
	}
	
	public int updateEventBoard(SqlSessionTemplate sqlSession, EventBoard b) {
		return sqlSession.update("eventBoardMapper.updateEventBoard", b);
	}
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int bNo) {
		return (ArrayList)sqlSession.selectList("eventBoardMapper.selectReplyList", bNo);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("eventBoardMapper.insertReply", r);
	}
	
	public ArrayList<EventBoard> selectTopBoard(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("eventBoardMapper.selectTopBoard");
	}

}

