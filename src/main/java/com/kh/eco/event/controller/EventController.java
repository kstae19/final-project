package com.kh.eco.event.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.eco.event.model.service.EventService;
import com.kh.eco.event.model.vo.Event;

   
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
	
	
	  @RequestMapping("enrollForm.ev") 
	  public String eventEnrollForm(String startDate, Model model) {
	 
		  System.out.println("이벤트등록날짜 : " + startDate);
		  model.addAttribute("startDate", startDate);
		  return "event/eventListView";
	  
	  }
	  
	  @RequestMapping("updateForm.ev") 
	  public String eventUpdateForm() {
	  
	  // 단순 페이지 forward return "event/eventUpdateForm";
		  return "";
	  }
	  
	  @RequestMapping("detail.ev") 
	  public String selectEventDetail(int eventNo) {
	  
	  
	 
		  return "event/eventDetailView"; 
	  }
	
	
	 @RequestMapping("insert.ev") 
	 public String insertEvent(Event e, MultipartFile upfile, Model model, HttpSession session) {
	 
		  System.out.println(e);
		 
		  if( !upfile.getOriginalFilename().contentEquals("")) {
			  
			  e.setOriginName(upfile.getOriginalFilename());
			  e.setChangeName(saveFile(upfile, session));
		  }
		  
		  
		 if(eventService.insertEvent(e) > 0) {
			 session.setAttribute("alertMsg", "이벤트 등록 성공!");
			 model.addAttribute("event", e);
			 return "redirect:/event"; 
		 } else {
			 return "common/errorPage"; 
		 }
		  
	  }
	 
	 public String saveFile(MultipartFile upfile, HttpSession session) {
			
			// 원본파일명 뽑기(필드명과 같게)
			String originName = upfile.getOriginalFilename();
			
			// 현재시각 문자열 특정형식으로 담기
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // 왜 sql이 아니지?
			
			// 랜덤값 얻기 (*범위 + 초기값)
			int ranNum = (int)Math.random() * 90000 + 10000;
			
			// 확장자 뽑기
			String ext = originName.substring(originName.lastIndexOf("."));
			
			// 새파일명 정의(필드명과 같게)
			String changeName = currentTime + ranNum + ext; // String끼리 더하면 그냥 이어붙인 결과
			
			// 업로드한 파일을 저장할 경로 설정
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
			
			// 업로드한 파일을 새 파일객체로 이동시킴 == 파일전송
			try {
				upfile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				
				e.printStackTrace();
			}
			
			// 파일전송완료시 그 파일이 있는 경로를 반환해줘야함
			return "resources/uploadFiles/" + changeName;
			
		}

	  @RequestMapping("update.ev") public String updateEvent(Event e) {
		  return "event/eventDetailView"; 
	  }
	  
	  @RequestMapping("delete.ev") public String deleteEvent(int eventNo) {
		  return "event/eventDetailView"; 
	  }
	 
    

	
}
