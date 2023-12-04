package com.kh.eco.achievement.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.eco.achievement.model.dao.AchievementDao;
import com.kh.eco.achievement.model.vo.Achievement;
import com.kh.eco.challenge.model.vo.Challenge;
import com.kh.eco.common.model.vo.PageInfo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AchievementServiceImpl implements AchievementService {

	
	private final AchievementDao achievementDao;
	
	private final SqlSessionTemplate sqlSession;



	
	@Override
	public int countAchievementList(int challengeNo) {
		
		return achievementDao.countAchievementList(sqlSession, challengeNo);
	}
	@Override
	public int countMyAchievementList(HashMap map) {
		
		return achievementDao.countMyAchievementList(sqlSession, map);
	}

	@Override
	public ArrayList<Achievement> selectAchievementList(int challengeNo, PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return achievementDao.selectAchievementList(sqlSession, challengeNo, rowBounds);
	}
	@Override
	public ArrayList<Achievement> selectMyAchievement(HashMap map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return achievementDao.selectMyAchievement(sqlSession, map, rowBounds);
	}

	@Override
	public int insertAchievement(Achievement a) {
		
		return achievementDao.insertAchievement(sqlSession, a);
	}

	@Override
	public int updateAchievement(Achievement a) {
		
		return achievementDao.updateAchievement(sqlSession, a);
	}

	@Override
	public int deleteAchievement(int achievementNo) {
		
		return achievementDao.deleteAchievement(sqlSession, achievementNo);
	}



}
