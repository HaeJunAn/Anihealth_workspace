package com.kh.aniht.inquiry.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Inquiry {
	
	private int inquiryNo; //문의번호
	private String inquiryTitle; //문의제목
	private String inquiryContent; //문의내용
	private Date inquiryCreate; //문의작성일
	
	private String inquiryAnswer; //답변내용
	
	private Date inquiryAnswerContent; //답변작성일
	private String inquiryStatus; //문의상태
	private int userNo; //회원번호
	
	

}
