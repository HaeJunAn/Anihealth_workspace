package com.kh.aniht.cart.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.aniht.cart.model.dao.CartDao;
import com.kh.aniht.cart.model.vo.Cart;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CartDao cartDao;
	
	// 해준 장바구니 리스트
	@Override
	public ArrayList<Cart> selectCartList(int userNo) {
		
		return cartDao.selectCartList(sqlSession,userNo);
	}
	// 해준 장바구니 수량업데이트 에이쟉스
	 	@Override
	    @Transactional
	    public int ajaxUpdateCart(int cartNo, int newQuantity) {
	        return cartDao.ajaxUpdateCart(cartNo, newQuantity);
	    }
	 // 해준 장바구니 에이쟉스 삭제 
		@Override
		@Transactional
		public int ajaxDeleteCart(int cartNo) {
			
			return cartDao.ajaxDeleteCart(cartNo);
		}
		
		
		 
	
	
		
}
