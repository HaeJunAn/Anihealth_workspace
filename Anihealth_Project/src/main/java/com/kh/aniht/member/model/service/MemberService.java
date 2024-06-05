package com.kh.aniht.member.model.service;

import com.kh.aniht.member.model.vo.Member;

public interface MemberService {

	// 로그인 서비스 (select)
		/* public abstract */ Member loginMember(Member m);

		// 회원가입 서비스 (insert)
		int insertMember(Member m);
		
		// 회원가입 시 배송지 추가
		int insertAddress(Member m);
		
		// 회원정보수정 서비스 (update)
		int updateMember(Member m);
		
		// 회원탈퇴 서비스 (update)
		int deleteMember(String userId);
		
		// 아이디 중복체크 서비스 (select) - ajax
		int idCheck(String checkId);

		
		
	
}
