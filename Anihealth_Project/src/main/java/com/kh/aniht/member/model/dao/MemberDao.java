package com.kh.aniht.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.aniht.member.model.vo.Member;
import com.kh.aniht.order.model.vo.OrderProduct;

@Repository
public class MemberDao {

public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
	return sqlSession.selectOne("memberMapper.loginMember", m);
}

public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
	
	return sqlSession.selectOne("memberMapper.idCheck", checkId);
}

public int insertMember(SqlSessionTemplate sqlSession, Member m) {
	
	return sqlSession.insert("memberMapper.insertMember", m);
}

public int insertAddress(SqlSessionTemplate sqlSession, Member m) {
	
	return sqlSession.insert("memberMapper.insertAddress", m);
}

public String findIdEmail(SqlSessionTemplate sqlSession, Member m) {
	
	return sqlSession.selectOne("memberMapper.findIdEmail", m);
	
}

public String findPwdEmail(SqlSessionTemplate sqlSession, Member m) {
	
	return sqlSession.selectOne("memberMapper.findPwdEmail", m);
}

public int updateFindPwd(SqlSessionTemplate sqlSession, Member m) {
	
	return sqlSession.update("memberMapper.updateFindPwd", m);
}

public int updateMember(SqlSessionTemplate sqlSession, Member m) {
	
	return sqlSession.update("memberMapper.updateMember", m);
	
}

public ArrayList<OrderProduct> selectOrderList(SqlSessionTemplate sqlSession, Member m) {
	
	return (ArrayList)sqlSession.selectList("memberMapper.selectOrderList", m);
	
}

public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
	
	return sqlSession.update("memberMapper.deleteMember", userId);
}

public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
	
	return sqlSession.update("memberMapper.updatePwd", m);
}

public int nickCheck(SqlSessionTemplate sqlSession, String checkNick) {
	
	return sqlSession.selectOne("memberMapper.nickCheck", checkNick);
}

public int emailCheck(SqlSessionTemplate sqlSession, String checkEmail) {
	
	return sqlSession.selectOne("memberMapper.emailCheck", checkEmail);
}



} // 클래스 영역 끝
