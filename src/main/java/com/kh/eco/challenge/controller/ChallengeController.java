package com.kh.eco.challenge.controller;


import java.io.IOException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.eco.challenge.model.service.ChallengeService;
import com.kh.eco.common.model.template.Pagination;
import com.kh.eco.common.model.vo.PageInfo;

@Controller
public class ChallengeController {

	@Autowired
	private ChallengeService challengeService;
	
	@RequestMapping("challenge")
	public String selectChallengeList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, Model model) throws IOException {
		
		/*내 답안 ==> private이라서 setter,getter로 바로 못 받음
		 * PageInfo pi = new PageInfo();
		 * pi.setListCount(challengeService.countChallengeList())
		 */
		
		PageInfo pi = Pagination.getPageInfo( // 1. listCount부터 알아오기
											challengeService.countChallengeList(),
											currentPage,
											4,
											5
											);
		// System.out.println(challengeService.countChallengeList());
		
		// 2. 페이징정보 불러오기 : model, modelAndView, session 셋 중 하나
		model.addAttribute("list", challengeService.selectChallengeList(pi));
		//model.addAttribute("pi", pi);
		System.out.println(challengeService.selectChallengeList(pi));
		
		// 3. 화면 포워딩하기   WEB-INF/views/        "요기"           .jsp
		return "challenge/challengeListView";
		
	}
	

	@RequestMapping("increase.like")
	public void increaseLikeCount(int userNo, int challengeNo) {
		
		HashMap<String, Integer> map = new HashMap();
		map.put("userNo", Integer.valueOf(userNo));
		map.put("challengerNo", Integer.valueOf(challengeNo));
		
		challengeService.increaseLikeCount(map);
		
		
	}
	
	
	@RequestMapping("decrease.like")
	public void decreaseLikeCount(int userNo, int challengeNo) {
		
		HashMap<String, Integer> map = new HashMap();
		map.put("userNo", Integer.valueOf(userNo));
		map.put("challengerNo", Integer.valueOf(challengeNo));
		
		challengeService.increaseLikeCount(map);
		
		
	}
	
	
	
	
}