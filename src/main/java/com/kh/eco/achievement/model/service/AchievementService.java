package com.kh.eco.achievement.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.eco.achievement.model.vo.Achievement;
import com.kh.eco.challenge.model.vo.Challenge;
import com.kh.eco.common.model.vo.PageInfo;

public interface AchievementService {

	// 인증 전체개수 카운트
	int countAchievementList(int challengeNo);
	
	ArrayList<Achievement> selectAchievementList(int challengeNo, PageInfo pi);
	// 인증 전체조회
	//ArrayList<Achievement> selectAchievementList(int challengeNo, PageInfo pi);
	
	// 인증 등록
	int insertAchievement(Achievement a);
	
	// 인증 수정
	int updateAchievement(Achievement a);
	
	// 인증 삭제
	int deleteAchievement(int achievementNo);
	
}
