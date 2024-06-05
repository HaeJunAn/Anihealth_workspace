package com.kh.aniht.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.aniht.member.model.vo.Member;

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




} // 클래스 영역 끝
