package com.kh.eco.move.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MoveForwardController {
	@RequestMapping("move")
	public String movePage() {
		return "move/move";	
	}
	
	@RequestMapping("airInfo")
	public String airInfoPage(String temp, String mintemp, String maxtemp, String pm10, 
							  String morsky, String nigsky, String morpty, String nigpty, 
							  String khai, String co, String no2, String o3, String so2, 
							  String name, Model model) {
		model.addAttribute("temp", temp);
		model.addAttribute("mintemp", mintemp);
		model.addAttribute("maxtemp", maxtemp);
		model.addAttribute("pm10", pm10);
		model.addAttribute("morsky", morsky);
		model.addAttribute("nigsky", nigsky);
		model.addAttribute("morpty", morpty);
		model.addAttribute("nigpty", nigpty);
		model.addAttribute("khai", khai);
		model.addAttribute("co", co);
		model.addAttribute("no2", no2);
		model.addAttribute("o3", o3);
		model.addAttribute("so2", so2);
		model.addAttribute("name", name);
		return "move/airInfo";	
	}
	
	@RequestMapping("bikeinfo")
	public String bikeinfoPage(String bikeName, String bikeCnt, String bikeLat, String bikeLng, Model model) {
		model.addAttribute("bikeLat", bikeLat);
		model.addAttribute("bikeLng", bikeLng);
		model.addAttribute("bikeName", bikeName);
		model.addAttribute("bikeCnt", bikeCnt);
		return "move/bikeInfo";	
	}
}
