package com.kh.eco.challenge.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.eco.challenge.model.service.ChallengeService;

@RestController 
public class AjaxController {

	@Autowired
	private ChallengeService challengeService;
	
	
	
	@RequestMapping(value="checkLike.ch", produces = "application/json")
	public String checkLikeCount(int userNo, int challengeNo) {
		
		HashMap<String, Integer> map = new HashMap();
		map.put("userNo", userNo);
		map.put("challengerNo", challengeNo);
		
		if(challengeService.checkLikeCount(map) > 0) {
			System.out.println("좋아요 여부 : " + challengeService.checkLikeCount(map) );
			return "success";
		} 
		else {
			System.out.println("좋아요 여부 : " + challengeService.checkLikeCount(map) );
			return "fail";
		}
		
	}
	
	
	@RequestMapping("increaseLike.ch")
	public String increaseLikeCount(int userNo, int challengeNo) {
		
		// 복합키인 userNo와 challengeNo를 map에 각각 담음
		HashMap<String, Integer> map = new HashMap();
		map.put("userNo", userNo);
		map.put("challengerNo", challengeNo);
		
		if(challengeService.increaseLikeCount(map) > 0 ) {
			
			return "success";
			
		} else {
			
			return "fail";
			
		}
		
	}	

	
	
	@RequestMapping("decreaseLike.ch")
	public String decreaseLikeCount(int userNo, int challengeNo) {
		
		HashMap<String, Integer> map = new HashMap();
		map.put("userNo", Integer.valueOf(userNo));
		map.put("challengerNo", Integer.valueOf(challengeNo));
		
		if(challengeService.decreaseLikeCount(map) > 0 ) {
			
			return "success";
			
		} else {
			
			return "fail";
			
		}
		
		
	}
	
	
}//class
