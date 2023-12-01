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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.eco.achievement.model.service.AchievementService;
import com.kh.eco.achievement.model.vo.Achievement;
import com.kh.eco.challenge.controller.ChallengeController;
import com.kh.eco.challenge.model.vo.Challenge;
import com.kh.eco.common.model.template.Pagination;
import com.kh.eco.common.model.vo.PageInfo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class AchievementAjaxController {

	private final AchievementService achievementService;

	@GetMapping(value = "achievement", produces = "application/json; charset=UTF-8")
	public String selectAchievementList(int challengeNo, @RequestParam(value="currentPage", defaultValue="1")int currentPage) {
		
		 PageInfo pi = Pagination.getPageInfo(
				 												achievementService.countAchievementList(challengeNo),
																 currentPage, 
																 10, 
																 1);
		 ArrayList<Achievement> achieveList = achievementService.selectAchievementList(challengeNo, pi); 
		 
		 return new Gson().toJson(achieveList);
	}
	
	@PostMapping("insert.ac")
	public String insertAchievement(Achievement achievement, 
													MultipartFile upfile,
													HttpSession session
													) {	
		
		
		if( !upfile.getOriginalFilename().equals("") ) {
			
			achievement.setOriginName(upfile.getOriginalFilename());
			achievement.setChangeName(ChallengeController.saveFile(upfile, session));
			
		} 

		if(achievementService.insertAchievement(achievement) > 0) {
			return "success";
			
		} else {
			return "fail";
		}
		
	}
	
	/*
	@PutMapping("update/{achievement}/")
	public String updateAchievement(Achievement achievement,
													MultipartFile upfile,
													HttpSession session) {
		
		System.out.println(achievement);
		
		if( !upfile.getOriginalFilename().equals("") ) {
			
			achievement.setOriginName(upfile.getOriginalFilename());
			achievement.setChangeName(ChallengeController.saveFile(upfile, session));
		
		} 

		if(achievementService.updateAchievement(achievement) > 0) {
			return "success";
			
		} else {
			return "fail";
		}

	}
	*/
	
	@DeleteMapping("delete/{achievementNo}")
	public String deleteAchievement(@PathVariable(name="achievementNo")int achievementNo) {
		
		System.out.println(achievementNo);
		
		if(achievementService.deleteAchievement(achievementNo) > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	

}//class
