package com.kh.eco.achievement.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.eco.achievement.model.vo.Achievement;
import com.kh.eco.challenge.model.vo.Challenge;

@Repository
public class AchievementDao {

	public int countAchievementList(SqlSessionTemplate sqlSession, int activityNo) {
		
		return sqlSession.selectOne("achievmentMapper.countAchievementList", activityNo);
	}

	public int countMyAchievementList(SqlSessionTemplate sqlSession, HashMap map) {
		
		return sqlSession.selectOne("achievmentMapper.countMyAchievementList", map);
	}

	/*
	 * public ArrayList<Achievement> selectAchievementList(SqlSessionTemplate
	 * sqlSession, int challengeNo, RowBounds rowBounds) {
	 * 
	 * return
	 * (ArrayList)sqlSession.selectList("achievmentMapper.selectAchievementList",
	 * challengeNo, rowBounds); }
	 */
	
	public ArrayList<Achievement> selectAchievementList(SqlSessionTemplate sqlSession, int activityNo, RowBounds rowBounds) {
		return (ArrayList)sqlSession.selectList("achievmentMapper.selectAchievementList", activityNo, rowBounds);
	}

	public ArrayList<Achievement> selectMyAchievement(SqlSessionTemplate sqlSession, HashMap map, RowBounds rowBounds) {

		return (ArrayList)sqlSession.selectList("achievmentMapper.selectMyAchievement", map, rowBounds);
	}
	public int insertAchievement(SqlSessionTemplate sqlSession, Achievement a) {
		
		return sqlSession.insert("achievmentMapper.insertAchievement", a);
	}

	public int updateAchievement(SqlSessionTemplate sqlSession, Achievement a) {
		
		return sqlSession.update("achievmentMapper.updateAchievement", a);
	}

	public int deleteAchievement(SqlSessionTemplate sqlSession, int achievementNo) {
		
		return sqlSession.update("achievmentMapper.deleteAchievement", achievementNo);
	}

	
}
