package com.kh.eco.move.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MoveForwardController {
	@RequestMapping("move")
	public String movePage() {
		return "move/move";	
	}
}
