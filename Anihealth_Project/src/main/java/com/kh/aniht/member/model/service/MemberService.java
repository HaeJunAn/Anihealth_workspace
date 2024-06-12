package com.kh.aniht.member.model.service;

import java.util.ArrayList;

import com.kh.aniht.member.model.vo.Member;
import com.kh.aniht.order.model.vo.OrderProduct;

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

		// 닉네임 중복체크 -ajax
		int nickCheck(String checkNick);
		
		// 이메일 중복체크 - ajax
		int emailCheck(String checkEmail);

		// 아이디 찾기 (이메일 전송)
		String findIdEmail(Member m);
		
		// 비밀번호 찾기 (이메일 전송)
		String findPwdEmail(Member m);

		// 비밀번호 찾기 후 랜덤비번으로 업데이트
		int updateFindPwd(Member m);

		// 마이페이지 - 주문내역
		ArrayList<OrderProduct> selectOrderList(Member m);

		// 비밀번호 변경
		int updatePwd(Member m);

		
	
}
