package com.kh.eco.eventBoard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.eco.common.model.template.Pagination;
import com.kh.eco.common.model.vo.PageInfo;
import com.kh.eco.eventBoard.model.service.EventBoardService;
import com.kh.eco.eventBoard.model.vo.EventBoard;
import com.kh.eco.eventBoard.model.vo.Reply;

@Controller
public class EventBoardController {
	
	@Autowired
	private EventBoardService EventBoardService;
	
	@RequestMapping("list.bo")
	public String selectList(@RequestParam(value="cPage", defaultValue="1") int currentPage,
																			Model model) {
		PageInfo pi = Pagination.getPageInfo(EventBoardService.selectListCount(),
										      currentPage,
										      5,
										      5);
		
		model.addAttribute("list", EventBoardService.selectList(pi));
		model.addAttribute("pi", pi);
		
		return "EventBoard/EventBoardListView";
	}
	
	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
		return "EventBoard/EventBoardEnrollForm";
	}
	
	@RequestMapping("insert.bo")
	public String insertBoard(EventBoard b,
						      MultipartFile upfile,
						      HttpSession session,
						      Model model) {
		
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			saveFile(upfile, session);
			
			b.setOriginName(upfile.getOriginalFilename());
			b.setChangeName(saveFile(upfile, session));
		}
		
		if(EventBoardService.insertEventBoard(b) > 0) {
			session.setAttribute("alertMsg",  "게시글 작성 성공~");
			return "redirect:list.bo";
		} else {
			model.addAttribute("errorMsg", "게시글 작성 실패..");
			return "common/errorPage";
		}
		
	}

	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random() * 90000) + 10000;
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return "/resources/uploadFiles/" + changeName;
	}
	
	
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		
		if(EventBoardService.increaseCount(bno) > 0) {
			
			
			mv.addObject("b", EventBoardService.selectEventBoard(bno))
			  .setViewName("EventBoard/EventBoardDetailView");
			
		} else {
			mv.addObject("errorMsg", "게시글 상세조회 실패...").setViewName("common/errorPage");
		}
		return mv;
		
	}
	
	
	@RequestMapping("delete.bo")
	public String deleteBoard(int bno,
							  HttpSession session,
							  String filePath) {
		
		if(EventBoardService.deleteEventBoard(bno) > 0) {
			
			if(!filePath.equals("")) {
				
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			
			session.setAttribute("alertMsg", "삭제성공~!");
			return "redirect:list.bo";
		} else {
			session.setAttribute("errorMsg",  "못지웠어요");
			return "common/errorPage";
		}
	}
	
	@PostMapping("updateForm.bo")
	public ModelAndView updateForm(int bno, ModelAndView mv) {
		mv.addObject("b", EventBoardService.selectEventBoard(bno)).setViewName("eventBoard/eventBoardUpdateForm");
		return mv;
	}
	
	@PostMapping("update.bo")
	public String updateBoard(@ModelAttribute EventBoard b,
											  MultipartFile reUpfile,
											  HttpSession session) {
		
		
		if(!reUpfile.getOriginalFilename().equals("")) {
			
			if(b.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(b.getChangeName())).delete();
			}
			
			
			b.setOriginName(reUpfile.getOriginalFilename());
			b.setChangeName(saveFile(reUpfile, session));
			
		}
		
		if(EventBoardService.updateEventBoard(b) > 0) {
			session.setAttribute("alertMsg", "변했어");
			return "redirect:detail.bo?bno=" + b.getBNo();
		} else {
			session.setAttribute("errorMsg", "망함");
			return "common/errorPage";
		}
	
	}
	
	@ResponseBody
	@GetMapping(value ="rlist.do", produces="application/json; charset=UTF-8")
	public String ajaxSelectReply(int bno) {
		return new Gson().toJson(EventBoardService.selectReplyList(bno));
	}
	
	@ResponseBody
	@GetMapping("rinsert.do")
	public String ajaxInsertReply(Reply r) {
		return EventBoardService.insertReply(r) > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@GetMapping(value = "topList.do", produces="application/json; charset=UTF-8")
	public String ajaxTopBoard() {
		return new Gson().toJson(EventBoardService.selectTopBoard());
	}

}











