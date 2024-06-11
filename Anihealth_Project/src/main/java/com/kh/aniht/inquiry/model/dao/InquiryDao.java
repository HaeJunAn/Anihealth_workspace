package com.kh.aniht.inquiry.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.inquiry.model.vo.Inquiry;

@Repository
public class InquiryDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("inquiryMapper.selectListCount");
	}

	public ArrayList<Inquiry> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return  (ArrayList)sqlSession.selectList("inquiryMapper.selectList", null, rowBounds);
	}

	
	
	
}
