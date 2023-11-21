package com.kh.eco.challenge.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.eco.challenge.model.service.ChallengeService;

@RestController 
public class AjaxController {

	@Autowired
	private ChallengeService challengeService;
	
	
	
	@RequestMapping(value="checkLike.ch") // produce="json"안해야 success가 돌아감
	public String checkLikeCount(int userNo, int challengeNo, Model model) {
		System.out.println(userNo + "   " + challengeNo);
		
		HashMap<String, Integer> map = new HashMap();
		map.put("userNo", userNo);
		map.put("challengeNo", challengeNo);
		
		System.out.println("좋아요여부 : " + challengeService.checkLikeCount(map));
		if(challengeService.checkLikeCount(map) > 0) { // 좋아요 이미 체크한 회원
			
			
			//model.addAttribute("likedUser", challengeService.selectLikedUser(map)); => 가는 페이지가 detailView가 아닌가봐..
			model.addAttribute("likeCount", challengeService.selectLikeCount(challengeNo));
			return "success";
		} 
		else {
			//System.out.println("좋아요 여부 : " + challengeService.checkLikeCount(map) );
			return "fail";
		}
		
	}
	
	
	@RequestMapping("insertLike.ch")
	public String insertLike(int userNo, int challengeNo) {
		
		// 복합키인 userNo와 challengeNo를 map에 각각 담음
		HashMap<String, Integer> map = new HashMap();
		map.put("userNo", userNo);
		map.put("challengeNo", challengeNo);
		
		
		
		if(challengeService.insertLike(map)  > 0 ) {
			// 좋아요도 증가하고 좋아요테이블에도 한행추가
			
			return "success";
			
		} else {
			
			// 좋아요 증가 안하거나 테이블에 한행 추가X
			return "fail";
			
		}
		
	}	

	
	
	@RequestMapping("deleteLike.ch")
	public String deleteLike(int userNo, int challengeNo) {
		
		HashMap<String, Integer> map = new HashMap();
		map.put("userNo", Integer.valueOf(userNo));
		map.put("challengeNo", Integer.valueOf(challengeNo));
		
		if(challengeService.deleteLike(map)  > 0 ) {
		
			return "success";
			
		} else {
			
			return "fail";
			
		}
		
		
	}
	
	
}//class
