package com.kh.eco.challenge.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.eco.challenge.model.vo.Challenge;
import com.kh.eco.common.model.vo.PageInfo;

@Repository
public class ChallengeDao {

	// 전체리스트 조회
	public int countChallengeList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("challengeMapper.countChallengeList");
	}

	public ArrayList<Challenge> selectChallengeList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
		
		return (ArrayList)sqlSession.selectList("challengeMapper.selectChallengeList", null, rowBounds);
	}
	
	// 검색결과 조회
	public int countSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("challengeMapper.countSearchList", map);
	}

	public ArrayList<Challenge> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
			RowBounds rowBounds) {
		
		return (ArrayList)sqlSession.selectList("challengeMapper.selectSearchList", map, rowBounds);
	}
	
	
	// 정렬 조회

	public int countChallengeStatus(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("challengeMapper.countChallengeStatus", map);
	}
	
	public ArrayList<Challenge> selectChallengeStatus(SqlSessionTemplate sqlSession, HashMap<String, String> map, RowBounds rowBounds){
		
		return (ArrayList)sqlSession.selectList("challengeMapper.selectChallengeStatus", map, rowBounds);
		
	}
	

	// 상세페이지 조회
	public int increaseViewCount(SqlSessionTemplate sqlSession, int challengeNo) {
		
		return sqlSession.update("challengeMapper.increaseViewCount", challengeNo);
	}

	public Challenge selectChallengeDetail(SqlSessionTemplate sqlSession, int challengeNo) {
		
		return sqlSession.selectOne("challengeMapper.selectChallengeDetail", challengeNo);
	}
	
	public String selectUserId(SqlSessionTemplate sqlSession, int challengeNo) {
	
		return sqlSession.selectOne("challengeMapper.selectUserId", challengeNo);
	}

	public String selectCategoryName(SqlSessionTemplate sqlSession, int challengeNo) {
		
		return sqlSession.selectOne("challengeMapper.selectCategoryName", challengeNo);
	}


	

	
	// 좋아요
	public int checkLikeCount(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
	
		return sqlSession.selectOne("challengeMapper.checkLikeCount", map);
	}

	/*
	 * public int selectLikedUser(SqlSessionTemplate sqlSession, HashMap<String,
	 * Integer> map) {
	 * 
	 * return sqlSession.selectOne("challengeMapper.selectLikedUser", map); }
	 */
	
	public int selectLikeCount(SqlSessionTemplate sqlSession, int challengeNo) {
		
		return  sqlSession.selectOne("challengeMapper.selectLikeCount", challengeNo);
	}


	public int insertLike(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		
		return sqlSession.insert("challengeMapper.insertLike", map);
	}


	public int deleteLike(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		
		return sqlSession.delete("challengeMapper.deleteLike", map);
	}

	// 게시글 작성 수정 삭제
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
