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
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Challenge> selectChallengeList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}

	public int countChallengeSearch(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Challenge> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
			RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return null;
	}

	public int increaseViewCount(SqlSessionTemplate sqlSession, int challengeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Challenge selectChallengeDetail(SqlSessionTemplate sqlSession, int challengeNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int increaseLikeCount(SqlSessionTemplate sqlSession, int userNo, int challengeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int decreaseLikeCount(SqlSessionTemplate sqlSession, int userNo, int challengeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertChallenge(SqlSessionTemplate sqlSession, Challenge c) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateChallenge(SqlSessionTemplate sqlSession, Challenge c) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteChallenge(SqlSessionTemplate sqlSession, int challengeNo) {
		// TODO Auto-generated method stub
		return 0;
	}



}
