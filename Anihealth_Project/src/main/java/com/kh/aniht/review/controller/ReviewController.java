package com.kh.aniht.review.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.common.template.Pagination;
import com.kh.aniht.review.model.service.ReviewService;
import com.kh.aniht.review.model.vo.Review;

import oracle.net.aso.i;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("list.re")
	public String ReviewList() {
		
		
		return "review/productReview";
	}
	
	@ResponseBody
	@GetMapping(value = "plist.re", produces="application/json; charset=UTF-8")
	public String selectProductReview(Review r, int currentPage) {
		ArrayList<HashMap<String, Object>> ratingList = reviewService.selectRatingCount(r.getProductNo());
		
		int listCount = 0;
		if (r.getRating() != 0) {
			for (HashMap<String, Object> rMap : ratingList) {
				if (Integer.parseInt(String.valueOf(rMap.get("RATING"))) == r.getRating()) {
					listCount = Integer.parseInt(String.valueOf(rMap.get("COUNT")));
					break;
				}
			}
		} else {
			for (HashMap<String, Object> rMap : ratingList) {
				listCount += Integer.parseInt(String.valueOf(rMap.get("COUNT")));
			}
		}
		
		//System.out.println(ratingList);
		for (int i = 5; i > 0; i--) {
			Boolean tf = false;
			for (HashMap<String, Object> rMap : ratingList) {
				tf = tf || (((BigDecimal) rMap.get("RATING")).intValue() == i);
				if (tf) {
					break;
				}
			}
			//System.out.println(tf);
			if(!tf) {
				HashMap<String, Object> newrMap = new HashMap<>();
				newrMap.put("RATING", i);
				newrMap.put("COUNT", 0);
				ratingList.add(newrMap);
			}
		}
		/*
		TreeMap<String, String> ratingMap = new TreeMap<>();
		int listCount = 0;
		for (HashMap<String, Object> rMap : ratingList) {
			ratingMap.put(String.valueOf(rMap.get("RATING")), String.valueOf(rMap.get("COUNT")));
		}
		
		//System.out.println(ratingMap);
		if( r.getRating() != 0) {
			listCount = Integer.parseInt(ratingMap.get(""+ r.getRating()));
		} else {
			for (String key : ratingMap.keySet()) {
				//System.out.println(ratingMap.get(key));
				listCount += Integer.parseInt(ratingMap.get(key));
			}
		
		}
		*/
		//System.out.println("개수" + listCount);
		//int listCount = reviewService.selectCountReview(r);

		int pageLimit = 10;
		int ReviewLimit = 5;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, ReviewLimit);

		ArrayList<Review> list = reviewService.selectProductReview(r, pi);
		//System.out.println(ratingMap);
		//System.out.println(ratingList);
		HashMap<String, Object> reviewMap= new HashMap<>(); 
		reviewMap.put("ratingList", ratingList);
		reviewMap.put("pi", pi);
		reviewMap.put("list", list);
		
		return new Gson().toJson(reviewMap);

	}

}
