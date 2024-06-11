package com.kh.aniht.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.product.model.vo.Product;

@Repository
public class ProductDao {

    public int selectProductListCount(SqlSessionTemplate sqlSession, String category, String keyword) {

    	Map<String, Object> params = new HashMap<>();
        
    	params.put("category", category);
        params.put("keyword", keyword);
        
        return sqlSession.selectOne("productMapper.selectProductListCount", params);
    }

    public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession, PageInfo pi, String order) {
       
    	Map<String, Object> params = new HashMap<>();
       
    	params.put("order", order);
       
    	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        
    	RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        
    	return (ArrayList) sqlSession.selectList("productMapper.selectProductList", params, rowBounds);
    }

    public ArrayList<Product> selectFilteredProductList(SqlSessionTemplate sqlSession, PageInfo pi, String order, String category, String keyword) {
        
    	Map<String, Object> params = new HashMap<>();
        
    	params.put("order", order);
        
    	params.put("category", category);
        
    	params.put("keyword", keyword);
        
    	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        
    	RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        
    	return (ArrayList) sqlSession.selectList("productMapper.selectFilteredProductList", params, rowBounds);
    }

    public Product selectProductDetail(SqlSessionTemplate sqlSession, int productNo) {
        
        Product product = sqlSession.selectOne("productMapper.selectProductDetail", productNo);
    
        return product;
    }
    
    // 평점조회
  	public Object selectRating(SqlSessionTemplate sqlSession, int productNo) {

  		return sqlSession.selectOne("productMapper.selectRating", productNo);
  	}
    
    
}
