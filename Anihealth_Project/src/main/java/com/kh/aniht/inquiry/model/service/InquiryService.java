package com.kh.aniht.inquiry.model.service;

import java.util.ArrayList;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.inquiry.model.vo.Inquiry;

public interface InquiryService {

	int selectListCount();

	ArrayList<Inquiry> selectList(PageInfo pi);

}