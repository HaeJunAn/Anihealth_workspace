package com.kh.aniht.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.aniht.member.model.dao.MemberDao;
import com.kh.aniht.member.model.vo.Delivery;
import com.kh.aniht.member.model.vo.Member;
import com.kh.aniht.order.model.vo.OrderProduct;
import com.kh.aniht.review.model.vo.Review;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member loginMember(Member m) {
		
		Member loginUser = memberDao.loginMember(sqlSession, m);
		
		return loginUser;
	}

	@Override
	@Transactional
	public int insertMember(Member m) {
		
		return memberDao.insertMember(sqlSession, m);
		
	}
	
	@Override
	@Transactional
	public int insertAddress(Member m) {
		
		return memberDao.insertAddress(sqlSession, m);
	}
	
	@Override
	public String findIdEmail(Member m) {
		
		return memberDao.findIdEmail(sqlSession, m);
	}

	@Override
	public String findPwdEmail(Member m) {
		
		return memberDao.findPwdEmail(sqlSession, m);
	}


	@Override
	public int updateMember(Member m) {
		
		return memberDao.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(String userId) {
		
		return memberDao.deleteMember(sqlSession, userId);
	}

	@Override
	public int idCheck(String checkId) {
		
		return memberDao.idCheck(sqlSession, checkId);
	}

	@Override
	public int updateFindPwd(Member m) {
		
		return memberDao.updateFindPwd(sqlSession, m);
	}

	@Override
	public int updatePwd(Member m) {
		
		return memberDao.updatePwd(sqlSession, m);
	}

	@Override
	public int nickCheck(String checkNick) {
		
		return memberDao.nickCheck(sqlSession, checkNick);
	}

	@Override
	public int emailCheck(String checkEmail) {
		
		return memberDao.emailCheck(sqlSession, checkEmail);
	}

	@Override
	public ArrayList<OrderProduct> selectOrderList(Member m) {
		
		return memberDao.selectOrderList(sqlSession, m);
	}
	
	@Override
	public ArrayList<Delivery> selectDeliveryList(Member m) {
		
		return memberDao.selectDeliveryList(sqlSession, m);
	}

	@Override
	public int updateDelivery(Delivery d) {
		
		return memberDao.updateDelivery(sqlSession, d);
	}

	@Override
	public int deleteDelivery(Delivery d) {
		
		return memberDao.deleteDelivery(sqlSession, d);
	}

	@Override
	public ArrayList<String> DeliList(Member m) {
		
		return memberDao.DeliList(sqlSession, m);
	}

	@Override
	public int insertDelivery(Delivery d) {
		
		return memberDao.insertDelivery(sqlSession, d);
	}

	@Override
	public ArrayList<Review> selectReviewList(Member m) {
		
		return memberDao.selectReviewList(sqlSession, m);
	}

	



}
