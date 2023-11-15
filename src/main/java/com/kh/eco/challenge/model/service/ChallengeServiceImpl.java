package com.kh.eco.challenge.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.eco.challenge.model.dao.ChallengeDao;
import com.kh.eco.challenge.model.vo.Challenge;
import com.kh.eco.common.model.vo.PageInfo;

@Service
public class ChallengeServiceImpl implements ChallengeService{ // 잊지말자 implements

	@Autowired
	private ChallengeDao challengeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int countChallengeList() {
		
		return 0;
	}

	@Override
	public ArrayList<Challenge> selectChallengeList(PageInfo pi) {
		
		return null;
	}

	@Override
	public int countChallengeSearch(HashMap<String, String> map) {
		
		return 0;
	}

	@Override
	public ArrayList<Challenge> selectSearchList(HashMap<String, String> map) {
		
		return null;
	}

	@Override
	public int increaseViewCount(int challengeNo) {
		
		return 0;
	}

	@Override
	public Challenge selectChallengeDetail(int challengeNo) {
		
		return null;
	}

	@Override
	public int increaseLikeCount(int userNo, int challengeNo) {
	
		return 0;
	}

	@Override
	public int decreaseLikeCount(int userNo, int challengeNo) {
	
		return 0;
	}

	@Override
	public int insertChallenge(Challenge c) {
		
		return 0;
	}

	@Override
	public int updateChallenge(Challenge c) {
		
		return 0;
	}

	@Override
	public int deleteChallenge(int challengeNo) {
		
		return 0;
	}




	
}
