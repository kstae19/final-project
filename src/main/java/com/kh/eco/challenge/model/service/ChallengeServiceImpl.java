package com.kh.eco.challenge.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
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
	
	
	// 게시글 전체조회
	@Override
	public int countChallengeList() {
		
		return challengeDao.countChallengeList(sqlSession);
	}

	@Override
	public ArrayList<Challenge> selectChallengeList(PageInfo pi) {
		
		// offset(상쇄)이용해 rowBounds 만들기
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		// 만들어진 rowBounds가지고 challengeList 조회
		return challengeDao.selectChallengeList(sqlSession, rowBounds);
	}


	// 게시글 검색결과 조회
	@Override
	public int countSearchList(HashMap<String, String> map) {
		
		return challengeDao.countSearchList(sqlSession, map);
	}
	
	/**
	 * map : 조건 및 검색어를 키값으로 전달하는 매개변수
	 * pi : 페이징처리를 위한 매개변수
	 */
	@Override
	public ArrayList<Challenge> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		// 조건 및 검색어를 mapper에서 적용해야하기에,
		// rowBounds는 페이징처리를 위해 인자로 넘김
		return challengeDao.selectSearchList(sqlSession, map, rowBounds);
	}

	
	
	
	// 게시글 정렬 조회
	@Override
	public int countChallengeStatus(String status) {
		
		return challengeDao.countChallengeList(sqlSession, status);
	}
	
	
	@Override
	public ArrayList<Challenge> selectChallengeStatus(String status,  PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		
		return challengeDao.selectChallengeStatus(sqlSession, status, rowBounds);
	}
	
	
	
	
	// 상세조회 
	@Override
	public int increaseViewCount(int challengeNo) {
		
		return challengeDao.increaseViewCount(sqlSession, challengeNo);
	}

	@Override
	public Challenge selectChallengeDetail(int challengeNo) {
		
		return challengeDao.selectChallengeDetail(sqlSession, challengeNo);
	}

	
	
	
	// 좋아요
	@Override
	public int checkLikeCount(HashMap<String, Integer> map) {
		
		return challengeDao.checkLikeCount(sqlSession, map);
	}
	
	
	@Override
	public int increaseLikeCount(HashMap<String, Integer> map) {
	
		return challengeDao.increaseLikeCount(sqlSession, map);
	}

	@Override
	public int decreaseLikeCount(HashMap<String, Integer> map) {
	
		return  challengeDao.decreaseLikeCount(sqlSession, map);
	}

	
	
	
	// 게시글 등록 수정 삭제
	@Override
	public int insertChallenge(Challenge c) {
		
		return challengeDao.insertChallenge(sqlSession, c);
	}

	@Override
	public int updateChallenge(Challenge c) {
		
		return challengeDao.updateChallenge(sqlSession, c);
	}

	@Override
	public int deleteChallenge(int challengeNo) {
		
		return challengeDao.deleteChallenge(sqlSession, challengeNo);
	}








	
}
