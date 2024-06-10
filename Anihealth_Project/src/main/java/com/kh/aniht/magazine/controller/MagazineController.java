package com.kh.aniht.magazine.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.common.template.Pagination;
import com.kh.aniht.magazine.model.service.MagazineService;
import com.kh.aniht.magazine.model.vo.Magazine;

@Controller
public class MagazineController {
	
	@Autowired
	private MagazineService magazineService;
	
	
	// 해준 매거진 리스트
	@GetMapping("maga.re")
	public String selectMagaList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = magazineService.selectMagaListCount();
		int pageLimit = 10;
		int boardLimit = 9;	
		
		PageInfo pi 
		= Pagination.getPageInfo(listCount, 
							 	 currentPage, 
							 	 pageLimit, 
							 	 boardLimit);
		
		ArrayList<Magazine> mlist = magazineService.selectMagaList(pi);
		System.out.println(mlist);
		model.addAttribute("mpi", pi);
		model.addAttribute("mlist", mlist);
		
		return "magazine/magazineListView";
		
	}
	
}
