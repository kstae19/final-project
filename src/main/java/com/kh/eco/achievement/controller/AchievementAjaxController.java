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
		System.out.println("난 현재페이지" + currentPage);
		 PageInfo pi = Pagination.getPageInfo(
				 												achievementService.countAchievementList(challengeNo),
																 currentPage, 
																 10, 
																 1);
		 ArrayList<Achievement> achieveList = achievementService.selectAchievementList(challengeNo, pi); 
		 System.out.println(achieveList);
		 return new Gson().toJson(achieveList);
	}
	
	@PostMapping("insert.ac")
	public String insertAchievement(Achievement achievement, 
													MultipartFile upfile,
													HttpSession session
													) {	
		System.out.println(achievement);
		//System.out.println(upfile);
		if( !upfile.getOriginalFilename().equals("") ) {
			//System.out.println("upfile은 null이 아니야");
			// challenge에 업로드한 파일 원본명/새이름 세팅
			achievement.setOriginName(upfile.getOriginalFilename());
			achievement.setChangeName(ChallengeController.saveFile(upfile, session));// 업로드한 파일과 해당 세션을 가지고 새이름을 세팅
			// changeName을 get하면 나오는 값임(이미 업로드한 파일, 세션, 저장경로 등이 들어가있음)
		} 

		if(achievementService.insertAchievement(achievement) > 0) {
			return "success";
			//System.out.println("등록된 Challenge정보 : " + challengeService.insertChallenge(c));
		} else {
			return "fail";
		}
		
	}
	
	@PutMapping("update.ac")
	public String updateAchievement(Achievement achievement,
													MultipartFile upfile) {
		
		return "";
	}
	
	
	@DeleteMapping("delete.ac")
	public String deleteAchievement(int achievementNo) {
		
		System.out.println(achievementNo);
		
		return "";
	}
	

}//class
