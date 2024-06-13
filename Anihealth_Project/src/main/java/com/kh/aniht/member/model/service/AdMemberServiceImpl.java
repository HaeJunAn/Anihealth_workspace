package com.kh.aniht.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.member.model.dao.AdMemberDao;
import com.kh.aniht.member.model.vo.Delivery;
import com.kh.aniht.member.model.vo.Member;

@Service
public class AdMemberServiceImpl implements AdMemberService{ // 클래스 영역 시작

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdMemberDao memberDao;
	
	// 회원 총 인원수 조회 : 페이징 처리
	@Override
	public int selectMemberListCount() {
		
		return memberDao.selectMemberListCount(sqlSession);
		
	}

	// 회원 목록 조회
	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		
		return memberDao.selectMemberList(sqlSession, pi);
		
	}

	// 회원 상세 조회
	@Override
	public Member selectMember(int userNo) {
		
		return memberDao.selectMember(sqlSession, userNo);
		
	}

	// 회원 배송지 조회
	@Override
	public ArrayList<Delivery> selectDelivery(String userId) {
		
		return memberDao.selectDelivery(sqlSession, userId);
		
	} 

} // 클래스 영역 끝
