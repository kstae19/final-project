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
	
	
	
	@RequestMapping(value="checkLike.ch") // produce="json"안해야 success가 돌아감
	public String checkLikeCount(int userNo, int challengeNo) {
		System.out.println(userNo + "   " + challengeNo);
		HashMap<String, Integer> map = new HashMap();
		map.put("userNo", userNo);
		map.put("challengeNo", challengeNo);
		
		if(challengeService.checkLikeCount(map) > 0) {
			//System.out.println("좋아요 여부 : " + challengeService.checkLikeCount(map) );
			return "success";
		} 
		else {
			//System.out.println("좋아요 여부 : " + challengeService.checkLikeCount(map) );
			return "fail";
		}
		
	}
	
	
	@RequestMapping("increaseLike.ch")
	public String increaseLikeCount(int userNo, int challengeNo) {
		
		// 복합키인 userNo와 challengeNo를 map에 각각 담음
		HashMap<String, Integer> map = new HashMap();
		map.put("userNo", userNo);
		map.put("challengerNo", challengeNo);
		
		System.out.println("좋아요 수 증가 : " + challengeService.increaseLikeCount(map));
		System.out.println("좋아요 한 행 추가 : " + challengeService.insertLike(map));
		
		if(challengeService.increaseLikeCount(map) *challengeService.insertLike(map) > 0 ) {
			// 좋아요도 증가하고 좋아요테이블에도 한행추가
			return "success";
			
		} else {
			
			// 좋아요 증가 안하거나 테이블에 한행 추가X
			return "fail";
			
		}
		
	}	

	
	
	@RequestMapping("decreaseLike.ch")
	public String decreaseLikeCount(int userNo, int challengeNo) {
		
		HashMap<String, Integer> map = new HashMap();
		map.put("userNo", Integer.valueOf(userNo));
		map.put("challengerNo", Integer.valueOf(challengeNo));
		
		System.out.println("좋아요 수 감소 : " + challengeService.decreaseLikeCount(map));
		System.out.println("좋아요 한 행 삭제 : " + challengeService.deleteLike(map));
		
		if(challengeService.decreaseLikeCount(map) *challengeService.deleteLike(map) > 0 ) {
			
			return "success";
			
		} else {
			
			return "fail";
			
		}
		
		
	}
	
	
}//class
