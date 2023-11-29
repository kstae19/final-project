package com.kh.eco.achievement.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kh.eco.achievement.model.service.AchievementService;
import com.kh.eco.achievement.model.vo.Achievement;
import com.kh.eco.challenge.model.vo.Challenge;
import com.kh.eco.common.model.template.Pagination;
import com.kh.eco.common.model.vo.PageInfo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class AchievementAjaxController {

	private final AchievementService achievementService;
	
	@RequestMapping(value="achievement", produces="application/json; charset=UTF-8")
	public ResponseEntity selectAchievementList(@ModelAttribute("challene")Challenge challenge,
																		int challengeNo,
																		int startNum,
																		HttpServletRequest request
															) {
		
		/*
		 * PageInfo pi = Pagination.getPageInfo(
		 * achievementService.countAchievementList(challengeNo),// listCount
		 * currentPage, 10, // boardLimit 1 // pageLimit );
		 * 
		 * ArrayList<Achievement> achieveList =
		 * achievementService.selectAchievementList(challengeNo, pi); long achieveCount
		 * = achievementService.countAchievementList(challengeNo);
		 * 
		 * System.out.println(achieveList);
		 * 
		 * return new Gson().toJson(achieveList);
		 */
		HttpHeaders headers = new HttpHeaders();
		ArrayList<HashMap> hmList = new ArrayList<HashMap>();
		
		List<Challenge> achievement = achievementService.selectAchievementList(challengeNo);

		if(achievement.size() > 0) {
			for(int i = 0; i < achievement.size(); i++) {
				HashMap hm = new HashMap();
				hm.put("achievementNo", achievement.get(i).getAchievementNo());
			}
		}
		
		JSONArray json = new JSONArray();
		return new ResponseEntity(json.toStirng(), headers, HttpStatus.CREATED);
	}
	
	
	
	
	
}
