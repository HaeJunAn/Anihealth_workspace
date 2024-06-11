package com.kh.aniht.inquiry.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.common.template.Pagination;
import com.kh.aniht.inquiry.model.service.InquiryService;
import com.kh.aniht.inquiry.model.vo.Inquiry;



@Controller
public class InquiryController {
	
	@Autowired
	private InquiryService inquiryService;
	
	@GetMapping("list.iq")
	public String selectList(
			@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = inquiryService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 5;
		
		// PageInfo 객체 만들어내기
		PageInfo pi 
			= Pagination.getPageInfo(listCount, 
								 	 currentPage, 
								 	 pageLimit, 
								 	 boardLimit);
		
		// 게시글 목록 조회
		ArrayList<Inquiry> list 
					= inquiryService.selectList(pi);
		
		// 응답데이터 담기
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "inquiry/inquiryListView";
	}
	
	
	
	@GetMapping("enrollForm.iq")
	public ModelAndView enrollForm(ModelAndView mv) {
		
		// 게시글 작성하기 페이지 포워딩
		// /WEB-INF/views/board/boardEnrollForm.jsp
		mv.setViewName("inquiry/inquiryEnrollForm");
		
		return mv;
	}
	
	
	
	

}
