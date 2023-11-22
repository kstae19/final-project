package com.kh.eco.event.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.eco.event.model.service.EventService;

import lombok.RequiredArgsConstructor;

   
//@RequiredArgsConstructor     
//@RequestMapping("/full-calendar")           
@Controller 
public class EventController {

//    private static final Logger log = LoggerFactory.getLogger(EventController.class);
//
//    private final EventService eventService;

	/*
	 * @ResponseBody => "event/eventListView" 자체가 화면에 나옴
	 * 
	 */
	
	@GetMapping("event")
    public String selectEventList(){

        return "event/eventListView";
        
    }

    // @GetMapping("/calendar-admin")

}
