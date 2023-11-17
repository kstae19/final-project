package com.kh.eco.challenge.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.eco.challenge.model.vo.Challenge;
import com.kh.eco.common.model.vo.PageInfo;

public interface ChallengeService {

	// challengeListView에서 전체조회와 검색 및 조회
	int countChallengeList();
	
	ArrayList<Challenge> selectChallengeList(PageInfo pi);
	
	int countSearchList(HashMap<String, String> map);
	
	ArrayList<Challenge> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
	// challengeDetailView와  좋아요 클릭
	
	int increaseViewCount(int challengeNo);
	
	Challenge selectChallengeDetail(int challengeNo);
	
	int increaseLikeCount(HashMap<String, Integer> map);
	
	int decreaseLikeCount(HashMap<String, Integer> map); //loginUser.userNo
	
	// challengeEnrollForm과 수정
	
	int insertChallenge(Challenge c);
	
	int updateChallenge(Challenge c);
	
	int deleteChallenge(int challengeNo);

	
}
