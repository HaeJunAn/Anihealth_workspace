package com.kh.aniht.member.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.aniht.member.model.service.MemberService;
import com.kh.aniht.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j // Lombok 이 제공해주는 어노테이션
//해당 클래스의 전역변수로 Logger 객체를 자동으로 생성해주는 어노테이션
//(Logger 객체명이 log 로 잡힘)

@Controller
public class MemberController {

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService memberService;
	
	// 인증번호를 담아둘 해시맵
	private Map<String, String> certNoList 
						= Collections.synchronizedMap(new HashMap<>());
	
	@Autowired
	private JavaMailSender mailSender; // = new JavaMailSenderImpl();

	
	// 로그인 페이지 이동
	@GetMapping("loginPage.me")
	public String loginPage() {
		
		return "member/loginPage";
		
	}
	
	// 로그인
	@PostMapping("login.me")
	public ModelAndView loginMember(Member m, 
									String saveId,
									ModelAndView mv,
									HttpSession session,
									HttpServletResponse response) {
		
		log.debug("저장할 아이디 : " + saveId);
		
		// 아이디 저장 로직 추가
		if(saveId != null && saveId.equals("y")) {
			// 로그인 요청 시 아이디를 저장하겠다.
			
			// saveId 라는 키값으로 현재 아이디값을 쿠키로 저장
			Cookie cookie = new Cookie("saveId", m.getUserId());
			
			// 유효기간 1일
			cookie.setMaxAge(1 * 24 * 60 * 60); // 초단위로
			
			// 만들어진 Cookie 객체를 response 에 첨부
			response.addCookie(cookie);
			
		} else {
			// 아이디를 저장하지 않겠다.
			
			// 아이디를 저장한 쿠키를 삭제
			Cookie cookie = new Cookie("saveId", m.getUserId());
			
			cookie.setMaxAge(0);
			
			response.addCookie(cookie);
		}
		
		
		// System.out.println(m);
		
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser != null && 
				   bcryptPasswordEncoder.matches(m.getUserPwd(), 
						   						 loginUser.getUserPwd())) {
		
		session.setAttribute("loginUser", loginUser);
		
		session.setAttribute("alertMsg", "성공적으로 로그인이 되었습니다.");
		
		mv.setViewName("redirect:/");
		
	} else {
		// 로그인 실패
		
		mv.addObject("errorMsg", "로그인 실패");
		
		mv.setViewName("common/errorPage");
	}
	
	return mv;
	
	} // loginMember 영역 끝
	
	// 회원가입창 이동
	@GetMapping("enrollForm.me")
	public String enrollForm() {
		
		return "member/memberEnrollForm";
	}
	
	// 회원가입
	@PostMapping("insert.me")
	public String insertMember(Member m,
							   Model model,
							   HttpSession session) {
		
		System.out.println(m);
		
		// 암호화
		String encPwd
			= bcryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		
		// address1 + address2 합쳐서 전체 주소 만들기
		String deliveryAddress = m.getAddress1() +" "+ m.getAddress2();
		
		m.setAddressAll(deliveryAddress);
		
		int result1 = memberService.insertMember(m);
		int result2 = memberService.insertAddress(m);
		
		int result = result1 * result2;
		
		// 결과에 따른 응답
		if(result > 0) {
			
			session.setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다.");
			
			return "redirect:/";
		} else {
			
			model.addAttribute("errorMsg","회원가입을 실패하였습니다.");
			
			return "common/errorPage";
		}
		
	}
	
	// 아이디 체크
	@ResponseBody
	@GetMapping(value="idCheck.me", produces = "text/html; charset=UTF-8")
	public String idCheck(String checkId) {
		
		// System.out.println(checkId);
		
		int count = memberService.idCheck(checkId);
		
		return (count > 0) ? "NNNNN" : "NNNNY";
	}
	
	// 아이디 체크
	@ResponseBody
	@GetMapping(value="nickCheck.me", produces = "text/html; charset=UTF-8")
	public String nickCheck(String checkNick) {
		
		int count = memberService.idCheck(checkNick);
		
		return (count > 0) ? "NNNNN" : "NNNNY";
	}
	
	// 로그아웃
	@GetMapping("logout.me")
	public ModelAndView logoutMember(HttpSession session,
									 ModelAndView mv) {
		
		session.removeAttribute("loginUser");
		
		session.setAttribute("alertMsg", "성공적으로 로그아웃 되었습니다.");
		
		mv.setViewName("redirect:/");
		
		return mv;
	}
	
	
	// 이메일 인증번호
	@ResponseBody
	@PostMapping(value="cert.do", produces = "text/html; charset=UTF-8")
	public String getCertNo(String email) {
		
		// 6자리 랜덤값 뽑기 (10000 ~ 99999)
		int random = (int)(Math.random() * 90000 + 10000);
		
		certNoList.put(email, String.valueOf(random));
		
		System.out.println(certNoList);
		
		// 사용자에게 이메일 보내기
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setSubject("[ANIHEALTH] 이메일 인증 번호입니다.");
		message.setText("인증번호 : " + random);
		message.setTo(email);
		
		mailSender.send(message);
		
		return "인증번호 발급 완료";
		
	}
	
	@ResponseBody
	@PostMapping(value="validate.do", produces = "text/html; charset=UTF-8")
	public String validate(String email, String checkNo) {
		
		String result = "";
		
		if(certNoList.get(email).equals(checkNo)) {
			result = "인증 성공하였습니다.";
			
		} else {
			
			result = "인증 실패하였습니다.";
		}
		
		// 인증 끝난 인증번호는 삭제 (일회성)
		certNoList.remove(email);
		
		return result;
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
}


