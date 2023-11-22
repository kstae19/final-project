package com.kh.eco.event.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String selectEventList(Model model){

		// eventListView로 갈 때 list 들고 가기
		model.addAttribute("list", eventService.selectEventList());
		
        return "event/eventListView";
        
    }
	
	/*
	 * @RequestMapping("enrollForm.ev") public String eventEnrollForm() {
	 * 
	 * // 단순 페이지 forward return "event/eventErollForm";
	 * 
	 * }
	 * 
	 * @RequestMapping("updateForm.ev") public String eventUpdateForm() {
	 * 
	 * // 단순 페이지 forward return "event/eventUpdateForm";
	 * 
	 * }
	 * 
	 * @RequestMapping("detail.ev") public String selectEventDetail(int eventNo) {
	 * 
	 * 
	 * 
	 * return "event/eventDetailView"; // }
	 * 
	 * @RequestMapping("insert.ev") public String insertEvent(Event e) {
	 * 
	 * }
	 * 
	 * @RequestMapping("update.ev") public String updateEvent(Event e) {
	 * 
	 * }
	 * 
	 * @RequestMapping("delete.ev") public String deleteEvent(int eventNo) {
	 * 
	 * }
	 */
    

	
}
