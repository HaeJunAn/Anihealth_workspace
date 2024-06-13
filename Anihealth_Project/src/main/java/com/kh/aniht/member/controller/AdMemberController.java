package com.kh.aniht.member.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.common.template.Pagination;
import com.kh.aniht.member.model.service.AdMemberService;
import com.kh.aniht.member.model.vo.Delivery;
import com.kh.aniht.member.model.vo.Member;

@Controller
public class AdMemberController { // 클래스 영역 시작

	@Autowired
	private AdMemberService memberService;
	
	// 회원 목록조회 (+ 페이징 처리)
	@GetMapping(value="member.ad")
	public String selectMemberList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		// 페이징 처리
		int listCount = memberService.selectMemberListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 회원 목록조회
		ArrayList<Member> list = memberService.selectMemberList(pi); 
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/member/memberListView";
		
	}
	
	// 회원 상세 조회
	@GetMapping(value="detailMember.ad")
	public ModelAndView selectMember(int mno, ModelAndView mv) {
		
		Member m = memberService.selectMember(mno);
		
		ArrayList<Delivery> list = memberService.selectDelivery(m.getUserId());
		
		mv.addObject("m", m).addObject("list", list).setViewName("admin/member/memberDetailView");
		
		return mv;
		
	}
	
	
} // 클래스 영역 끝
