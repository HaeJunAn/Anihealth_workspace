package com.kh.aniht.review.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.common.template.Pagination;
import com.kh.aniht.review.model.service.ReviewService;
import com.kh.aniht.review.model.vo.Review;

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
		
		// 모든 키값이 없으면
		ArrayList<HashMap<String, Object>> ratinglist = reviewService.selectRatingCount(r.getProductNo());
		
		//System.out.println(ratinglist);
		for (int i = 5; i > 0; i--) {
			Boolean tf = false;
			for (HashMap<String, Object> rMap : ratinglist) {
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
				ratinglist.add(newrMap);
			}
		}
		
		HashMap<String, String> ratingMap = new HashMap<>();

		int listCount = 0;
		for (HashMap<String, Object> rMap : ratinglist) {
			ratingMap.put(String.valueOf(rMap.get("RATING")), String.valueOf(rMap.get("COUNT")));
		}
		
		System.out.println(ratingMap);
		if( r.getRating() != 0) {
			listCount = Integer.parseInt(ratingMap.get(""+ r.getRating()));
		} else {
			for (String key : ratingMap.keySet()) {
				System.out.println(ratingMap.get(key));
				listCount += Integer.parseInt(ratingMap.get(key));
			}
		
		}
		
		System.out.println("개수" + listCount);
		//int listCount = reviewService.selectCountReview(r);

		int pageLimit = 3;
		int boardLimit = 5;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);


		ArrayList<Review> list = reviewService.selectProductReview(r, pi);
		
		HashMap<String, Object> reviewMap= new HashMap<>(); 
		reviewMap.put("ratinglist", ratinglist);
		reviewMap.put("pi", pi);
		reviewMap.put("list", list);
		
		return new Gson().toJson(reviewMap);

	}

}
