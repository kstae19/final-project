package com.kh.eco.event.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.eco.challenge.controller.ChallengeController;
import com.kh.eco.event.model.service.EventService;
import com.kh.eco.event.model.vo.Event;

import lombok.RequiredArgsConstructor;

   
@RequiredArgsConstructor
@Controller 
public class EventController {

	/*
	 * @ResponseBody => "event/eventListView" 자체가 화면에 나옴
	 * 
	 * 
	 */
	
	private final EventService eventService;

	// 이벤트 전체조회
	@RequestMapping(value="event")
    public String selectEventList(Model model) {

		model.addAttribute("list", eventService.selectEventList());

        return "event/eventListView";
    }
	
	// 이벤트 등록폼
	/*
	 * @RequestMapping("enrollForm.ev") public String eventEnrollForm(String
	 * eventDate, Model model) {
	 * 
	 * //System.out.println("이벤트등록날짜 : " + eventDate);
	 * //model.addAttribute("eventDate", eventDate); //return "redirect:/"; //return
	 * "event/eventListView"; //return "redirect:/event"; return "redirect:/"; }
	 */
	  

	  // 이벤트 세부모달
	  @RequestMapping("detail.ev") 
	  public String selectEventDetail(int eventNo, Model model) {
	  
		 model.addAttribute("e", eventService.selectEventDetail(eventNo));
	 
		  return "event/eventListView"; 
	  }
	
	// 이벤트 등록
	 @PostMapping(value="insert.ev") 
	 public String insertEvent(	
											MultipartFile upfile, 
											 Event e, 
											 Model model, 
											 HttpSession session) {
	 
		  System.out.println(e);
		  System.out.println("파일 : " + upfile);
		 
		  // 이벤트 등록
		  if( !upfile.getOriginalFilename().contentEquals("")) {
			  
			  e.setOriginName(upfile.getOriginalFilename());
			  e.setChangeName(ChallengeController.saveFile(upfile, session));

		  }
		  
		  
		 if(eventService.insertEvent(e) > 0) {
			 session.setAttribute("alertMsg", "이벤트 등록 성공!");
			 model.addAttribute("e", e);
			 System.out.println("OriginName : " + e.getOriginName());
			 System.out.println("changeName : " + e.getChangeName());
			 return "redirect:/event"; 
			 //return "event/eventListView";// 이렇게 포워딩하면 기존정보가 그대로??
		 } else {
			 return "common/errorPage"; 
		 }
		  
	  }
	 
	
	 
	  // 이벤트 수정폼
	  @RequestMapping("updateForm.ev") 
	  public String eventUpdateForm() {
	  
	  // 단순 페이지 forward return "event/eventUpdateForm";
		  return "redirect:/event";
	  }
	  
	  
	 // 이벤트 수정
	  @RequestMapping("update.ev") 
	  public String updateEvent(Event e) {
		  return "event/eventDetailView"; 
	  }
	  
	  // 이벤트 삭제
	  @RequestMapping("delete.ev") 
	  public String deleteEvent(int eventNo) {
		  return "event/eventDetailView"; 
	  }
	 
    

	
}
