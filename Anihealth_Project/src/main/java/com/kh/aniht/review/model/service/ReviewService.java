package com.kh.aniht.review.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.review.model.dao.ReviewDao;
import com.kh.aniht.review.model.vo.Review;


@Service
public class ReviewService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReviewDao reviewDao;
	
	// 별점별 리뷰수
	public ArrayList<HashMap<String, Object>> selectRatingCount(int productNo) {
		
		return reviewDao.selectRatingCount(sqlSession, productNo);
	}
	
	public int selectCountReview(Review r) {
		//System.out.println("호출");
		return reviewDao.selectCountReview(sqlSession, r);
	}
	// 리뷰 목록
	public ArrayList<Review> selectProductReview(Review r, PageInfo pi) {
		
		return reviewDao.selectProductReview(sqlSession, r, pi);
	}


}
