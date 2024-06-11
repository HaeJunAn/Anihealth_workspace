package com.kh.aniht.cart.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.aniht.cart.model.vo.Cart;

public interface CartService {
	
	// 카트 리스트 조회 해준
	ArrayList<Cart> selectCartList();
	
	// 에이작스 장바구니수량업데이트 해준 
	 int ajaxUpdateCart(int cartNo, int newQuantity);
	
	 // 에이쟉스 장바구니삭제 해준
	 int ajaxDeleteCart(int cartNo);
	
}
