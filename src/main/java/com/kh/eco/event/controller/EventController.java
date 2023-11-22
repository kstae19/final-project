package com.kh.eco.event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.eco.event.model.service.EventService;

   
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
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping("event")
    public String selectEventList(){

        return "event/eventListView";
        
    }
	
	@RequestMapping("enrollForm.ev")
	public String eventEnrollForm() {
		
		return "event/eventErollForm";
		
	}
	
	@RequestMapping("detail.ev")
	public String selectEventDetail() {
		
	}
	
	@RequestMapping("insert.ev")
	public String insertEvent() {
		
	}
	
	@RequestMapping("update.ev")
	public String updateEvent() {
		
	}

	@RequestMapping("delete.ev")
	public String deleteEvent() {
		
	}
    

	
}
