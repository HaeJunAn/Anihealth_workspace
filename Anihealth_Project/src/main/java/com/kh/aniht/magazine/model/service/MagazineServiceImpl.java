package com.kh.aniht.magazine.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.magazine.model.dao.MagazineDao;
import com.kh.aniht.magazine.model.vo.Magazine;

@Service
public class MagazineServiceImpl implements MagazineService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MagazineDao magazineDao;
	
	// 해준 매거진 게시글 숫자세어오는거
	@Override
	public int selectMagaListCount() {
		
		return magazineDao.selectMagaListCount(sqlSession);
	}

	@Override
	public ArrayList<Magazine> selectMagaList(PageInfo pi) {
		
		return magazineDao.selectMagaList(sqlSession, pi);
	}

}
