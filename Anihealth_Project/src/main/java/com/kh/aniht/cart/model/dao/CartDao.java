package com.kh.aniht.cart.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.aniht.cart.model.vo.Cart;

@Repository
public class CartDao {
	
	@Autowired
    private SqlSessionTemplate sqlSession;
	
	// 장바구니 카트 리스트 가져오기  해준
	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession,int userNo){
		
		return (ArrayList)sqlSession.selectList("cartMapper.selectCartList",userNo);
		
	}
	// 장바구니 수량변경 쟉스 해준

    public int ajaxUpdateCart(int cartNo, int newQuantity) {
      // MyBatis에서 사용하는 파라미터를 위한 맵 생성
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("cartNo", cartNo);
        paramMap.put("newQuantity", newQuantity);

        return sqlSession.update("cartMapper.ajaxUpdateCart",paramMap);
    }
    
    // 장바구니 선택삭제 쟉스 해준
    public int ajaxDeleteCart(int cartNo) {
    	
    	return sqlSession.delete("cartMapper.ajaxDeleteCart",cartNo);
    	
    }
    
    public List<Cart> cartOrder(List<Integer> cartNos) {
        return sqlSession.selectList("cartMapper.cartOrder", cartNos);
    }
	
}
