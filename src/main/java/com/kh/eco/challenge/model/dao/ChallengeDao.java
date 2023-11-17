package com.kh.eco.challenge.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.eco.challenge.model.vo.Challenge;

@Repository
public class ChallengeDao {

	public int countChallengeList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("challengeMapper.countChallengeList");
	}

	public ArrayList<Challenge> selectChallengeList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		
		return (ArrayList)sqlSession.selectList("challengeMapper.selectChallengeList", null, rowBounds);
	}

	public int countSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("challengeMapper.countSearchList", map);
	}

	public ArrayList<Challenge> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
			RowBounds rowBounds) {
		
		return (ArrayList)sqlSession.selectList("challengeMapper.selectSearchList", map, rowBounds);
	}

	public int increaseViewCount(SqlSessionTemplate sqlSession, int challengeNo) {
		
		return sqlSession.update("challengeMapper.increaseViewCount", challengeNo);
	}

	public Challenge selectChallengeDetail(SqlSessionTemplate sqlSession, int challengeNo) {
		
		return sqlSession.selectOne("challengeMapper.selectChallengeDetail", challengeNo);
	}
	
	public int increaseLikeCount(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		
		return sqlSession.update("challengeMapper.increaseLikeCount", map);
	}

	public int decreaseLikeCount(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		
		return sqlSession.update("challengeMapper.decreaseLikeCount", map);
	}

	public int insertChallenge(SqlSessionTemplate sqlSession, Challenge c) {
		
		return sqlSession.insert("challengeMapper.insertChallenge", c);
	}

	public int updateChallenge(SqlSessionTemplate sqlSession, Challenge c) {
		
		return sqlSession.update("challengeMapper.updateChallenge", c);
	}

	public int deleteChallenge(SqlSessionTemplate sqlSession, int challengeNo) {
		
		return sqlSession.update("challengeMapper.deleteChallenge", challengeNo);
	}



}
