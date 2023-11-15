package com.kh.eco.challenge.controller;


import java.io.IOException;

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
	
	
	
	
	
}