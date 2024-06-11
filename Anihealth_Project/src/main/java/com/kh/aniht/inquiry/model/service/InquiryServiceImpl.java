package com.kh.aniht.inquiry.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.inquiry.model.dao.InquiryDao;
import com.kh.aniht.inquiry.model.vo.Inquiry;

@Service
public class InquiryServiceImpl  implements InquiryService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private InquiryDao inquiryDao;
	
	@Override
	public int selectListCount() {
		
		return inquiryDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Inquiry> selectList(PageInfo pi) {
		
		return inquiryDao.selectList(sqlSession, pi);
	}

}
