package com.kh.aniht.review.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.review.model.vo.Review;
@Repository
public class ReviewDao {
	
	public ArrayList<HashMap<String, Object>> selectRatingCount(SqlSessionTemplate sqlSession, int productNo) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("reviewMapper.selectRatingCount", productNo);
	}
	
	public int selectCountReview(SqlSessionTemplate sqlSession, Review r) {
		//System.out.println("호출");
		return sqlSession.selectOne("reviewMapper.selectCountReview", r);
	}

	public ArrayList<Review> selectProductReview(SqlSessionTemplate sqlSession, Review r, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectProductReview", r, rowBounds);
	}



}
