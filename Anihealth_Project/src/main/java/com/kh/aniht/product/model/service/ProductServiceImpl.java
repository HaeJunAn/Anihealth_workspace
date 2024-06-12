package com.kh.aniht.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.product.model.dao.ProductDao;
import com.kh.aniht.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private SqlSessionTemplate sqlSession;
    
    @Autowired
    private ProductDao productDao;
    
    @Override
    public int selectProductListCount(String category, String keyword) {
       
    	return productDao.selectProductListCount(sqlSession, category, keyword);
    }

    @Override
    public ArrayList<Product> selectProductList(PageInfo pi, String order) {
        
    	return productDao.selectProductList(sqlSession, pi, order);
    }

    @Override
    public Product selectProductDetail(int productNo) {
       
    	// System.out.println("Service: Fetching product details for productNo: " + productNo);
        Product product = productDao.selectProductDetail(sqlSession, productNo);
        //System.out.println("Service: Fetched product: " + product);
        return product;
    }

	@Override
	public ArrayList<Product> selectFilteredProductList(PageInfo pi, String order, String category, String keyword) {
		
		 return productDao.selectFilteredProductList(sqlSession, pi, order, category, keyword);  
	}
	
	//평점조회
		@Override
		public ArrayList<HashMap<String, Object>> selectRating(int[] productNoArr) {
			
			ArrayList<HashMap<String, Object>> rList = new ArrayList<>();
			
			for (int productNo :  productNoArr) {
				HashMap<String, Object> rMap = new HashMap<>();
				rMap.put("productNo", productNo);
				rMap.put("rating", productDao.selectRating(sqlSession, productNo));
				
				rList.add(rMap);
			}
			
			return rList;
		}
	
	
	
}