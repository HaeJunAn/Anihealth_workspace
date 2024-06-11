package com.kh.aniht.cart.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.aniht.cart.model.service.CartService;
import com.kh.aniht.cart.model.vo.Cart;
import com.kh.aniht.member.model.vo.Member;


@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	// 해준 장바구니 리스트
	@GetMapping("cart.re")
	public String selectCartList(Model model) {
		
		ArrayList<Cart> list = cartService.selectCartList();
		//System.out.println(list);
		model.addAttribute("list", list);
		
		return "cart/cartListView";
		
	}
	// 해준 에이쟉스 장바구니 수량업데이트
	 	@ResponseBody
	    @PostMapping(value="cart.up", produces="application/json; charset=UTF-8")
	    public String ajaxUpdateCart(@RequestParam("cartNo") int cartNo, @RequestParam("newQuantity") int newQuantity) {
	       // System.out.println(cartNo);
	       // System.out.println(newQuantity);
	 		int result = cartService.ajaxUpdateCart(cartNo, newQuantity);
	 	//	System.out.println(result);
	        if (result > 0) {
	            return "{\"success\": true}";
	        } else {
	            return "{\"success\": false}";
	        }
	    }
	 	// 해준 에이쟉스 장바구니 삭제
	 	@ResponseBody
	    @PostMapping(value="cart.de",produces="application/json; charset=UTF-8")
	 	public String ajaxDeleteCart(@RequestParam("cartNo") int cartNo) {
	 		//System.out.println(cartNo);
	 		int result = cartService.ajaxDeleteCart(cartNo);
	 		
            // 성공 응답 반환
            if (result > 0) {
                return "{\"success\": true}";
            } else {
                return "{\"success\": false}";
            }
	 		
	 	}
	 	
	
}
