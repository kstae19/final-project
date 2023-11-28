package com.kh.eco.achievement.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.eco.achievement.model.dao.AchievementDao;
import com.kh.eco.achievement.model.vo.Achievement;
import com.kh.eco.common.model.vo.PageInfo;

@Service
public class AchievementServiceImpl implements AchievementService {

	@Autowired
	private AchievementDao achievementDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	@Override
	public int countAchievementList(int challengeNo) {
		
		return achievementDao.countAchievementList(sqlSession, challengeNo);
	}
	
	
	
	@Override
	public ArrayList<Achievement> selectAchievementList(int challengeNo, PageInfo pi) {
		// offset(상쇄)이용해 rowBounds 만들기
				int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
				RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
				
		// 만들어진 rowBounds가지고 selectAchievementList 조회
		return achievementDao.selectAchievementList(sqlSession, challengeNo, rowBounds);
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
