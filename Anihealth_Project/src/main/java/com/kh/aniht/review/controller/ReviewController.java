package com.kh.aniht.review.controller;

import java.io.File;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	@GetMapping("insertForm.re")
	public String reviewInsertForm() {
		
		
		return "review/insertReviewForm";
	}
	
	@PostMapping("insert.re")
	public String insertReview(Review r, MultipartFile upfile, HttpSession session) {
		
		
		r.setUserNo(2); //임시, sessionn 또는 요청값으로
		r.setOrderProductNo(1); //임시, 요청값으로
		if(!upfile.getOriginalFilename().equals("")) {
			// 요청 시 전달된 파일이 있을 경우
			
			// 파일명 수정 작업 후 서버에 업로드 시키기
			String changeName = savePath(upfile, session);
			
			// 원본파일명, 서버에 업로드된 경로를 포함한 수정파일명을
			r.setReviewFilePath("resources/rimg/" + changeName);	
		}
		
		//System.out.println(r);
		int result = reviewService.insertReview(r);
		
		//System.out.println(result);
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			
		} else {
			session.setAttribute("alertMsg", "게시글 등록실패.");
		}
		
		return "redirect:/";
	}
	
	@GetMapping("updateForm.re")
	public String reviewUpdateForm(Model model) {	
		
		int reviewNo = 18; // 임시, 요청값으로 받을 거임
		
		Review r = reviewService.selectReview(reviewNo);
		
		System.out.println(r);
		model.addAttribute("r", r);
		
		return "review/reviewUpdateForm";
	}
	
	
	@PostMapping("update.re")
	public String updateReview(Review r, MultipartFile reupfile, HttpSession session) {
		
		// 새로운 첨부파일 있음
		if(!reupfile.getOriginalFilename().equals("")) {
			
			// 기존 첨부파일 있음
			if(r.getReviewFilePath() != null) {
				
				String realPath = session.getServletContext().getRealPath(r.getReviewFilePath());
				
				System.out.println(realPath);
				
				new File(realPath).delete();
			}
			
			String changeName = savePath(reupfile, session);
			
			r.setReviewFilePath("resources/rimg/" + changeName);
			
		} 
		
		
		int result = reviewService.updateReview(r);
		
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정 되었습니다.");
			
		} else {
			session.setAttribute("alertMsg", "게시글 수정실패.");
		}
		
		return "redirect:/";
	}
	
	@GetMapping("delete.re")
	public String deleteReview(HttpSession session) {
		
		int reviewNo = 18;
		
		int result = reviewService.deleteReview(reviewNo);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제 되었습니다.");
			
		} else {
			session.setAttribute("alertMsg", "게시글 삭제실패.");
		}
		
		return "redirect:/";
	}
	
	
	
	
	public String savePath(MultipartFile upfile,
			   HttpSession session) {
	
		// 예) "bono.jpg" --> "2024052116143012345.jpg"
		// 1. 원본파일명 뽑아오기
		String originName = upfile.getOriginalFilename(); 
									// "bono.jpg"
		
		// 2. 시간 형식으로 문자열로 뽑아내기 (년월일시분초)
		String currentTime 
			= new SimpleDateFormat("yyyyMMddHHmmss")
								.format(new Date());
									// "20240521161430" 
		
		// 3. 뒤에 붙을 5자리 랜덤수 얻어내기 (10000 ~ 99999)
		int ranNum = (int)(Math.random() * 90000 + 10000);
									// 12345
		
		// 4. 원본파일명으로부터 확장자명 뽑기
		String ext 
		= originName.substring(originName.lastIndexOf("."));
									// ".jpg"
		
		// 5. 2 ~ 4 까지 모두 이어 붙이기
		String changeName = currentTime + ranNum + ext;
		
		// 6. 업로드하고자 하는 물리적인 서버의 경로 알아내기
		// > application 객체로부터
		// (webapp/resources/uploadFiles/~~)
		String savePath
			= session.getServletContext()
					 .getRealPath("/resources/rimg/");
		
		System.out.println(savePath);
		// 7. 경로와 수정파일명 합체 후 파일을 업로드해주기
		// > MultipartFile 객체가 제공하는
		//   transferTo 메소드를 이용함
		try {
		
		upfile.transferTo(new File(savePath + changeName));
		
		} catch (IllegalStateException | IOException e) {
		e.printStackTrace();
		}
		
		// 수정파일명 문자열을 리턴
		return changeName;
	}
	
}
