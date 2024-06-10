package com.kh.aniht.magazine.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.magazine.model.vo.Magazine;

public interface MagazineService {
	
	// 매거진 총 갯수 조회 페이징처리 24/6/10해준
	int selectMagaListCount();
	
	// 매거진 리스트 조회 해준
	ArrayList<Magazine> selectMagaList(PageInfo pi);
	

}
