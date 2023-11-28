package com.kh.eco.achievement.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.eco.achievement.model.service.AchievementService;
import com.kh.eco.achievement.model.vo.Achievement;
import com.kh.eco.challenge.controller.ChallengeController;
import com.kh.eco.common.model.template.Pagination;
import com.kh.eco.common.model.vo.PageInfo;

@Controller
public class AchievementController {

	@Autowired
	private AchievementService achievementService;
	
	
	// 인증 전체 조회
	@RequestMapping("achievement")
	public String selectAchievementList(int challengeNo, @RequestParam(value="currentPage", defaultValue="1")int currentPage, Model model) {
		
		PageInfo pi = Pagination.getPageInfo( 
				achievementService.countAchievementList(challengeNo),//  listCount
				currentPage,
				5, // boardLimit
				1 // pageLimit
				);
		
		model.addAttribute("list", achievementService.selectAchievementList(challengeNo, pi));
		model.addAttribute("pi", pi);
		
		return "challenge/challengeDetailView";
		
	}
	
	// 인증 등록
	@RequestMapping("insert.ac")
	public String insertAchievement(Achievement a,
													 MultipartFile upfile,
													 HttpSession session,
													 Model model) {
		
		  System.out.println(a); 
		  System.out.println(upfile);
		  
		  if( !upfile.getOriginalFilename().equals("") ) {
			  a.setOriginName(upfile.getOriginalFilename());
				a.setChangeName(ChallengeController.saveFile(upfile, session));
		  }
		  
		  if(achievementService.insertAchievement(a) > 0) {
			  session.setAttribute("alertMsg", "인증 성공!!");
			  model.addAttribute("a", a);
			  return "redirect:/detail.ch";
		  } else {
			  return "common/errorPage"; 
		  }
		  
	}
	 
	// 인증 수정
	@RequestMapping("update.ac")
	public String updateAchievement(Achievement a, 
													MultipartFile upfile, 
													HttpSession session, 
													Model model) {
		
		//	1. upfile이 새로 첨부된 경우 
		if( !upfile.getOriginalFilename().equals("") ) {
			
			 
			a.setOriginName(upfile.getOriginalFilename());
			a.setChangeName(ChallengeController.saveFile(upfile, session));
		 
		// 2. upfile 첨부 안 한 경우 == 원래 있는 거 보여줘야
		} else {
			
			a.setOriginName(a.getOriginName());
			a.setChangeName(a.getChangeName());
		}
		
		if(achievementService.updateAchievement(a) > 0) {
			session.setAttribute("alertMsg", "인증글 수정 성공!");
			model.addAttribute("a", a);
			 return "redirect:/detail.ch"; 
		} else {
			return "common/errorPage"; 
		}
	}
	
	// 인증 삭제
	@RequestMapping("delete.ac")
	public String deleteAchievement(int challengeNo, HttpSession session) {
		
		if(achievementService.deleteAchievement(challengeNo) >0) {
			session.setAttribute("alertMsg", "인증글 삭제 성공!");
			return "redirect:/detail.ch";
		 } else {
			 return "common/errorPage";
		 }
		
	}
	
}
