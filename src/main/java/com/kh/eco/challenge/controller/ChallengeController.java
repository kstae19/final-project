package com.kh.eco.challenge.controller;


import java.io.IOException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.eco.challenge.model.service.ChallengeService;

@Controller
public class ChallengeController {

	@Autowired
	private ChallengeService challengeService;
	
	@RequestMapping("challenge")
	public String challenge() throws IOException {

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