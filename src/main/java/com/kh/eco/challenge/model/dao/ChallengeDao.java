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

}
