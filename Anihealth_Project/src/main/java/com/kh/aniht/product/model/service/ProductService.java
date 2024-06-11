package com.kh.aniht.product.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.product.model.vo.Product;

public interface ProductService {
    
	int selectProductListCount(String category, String keyword);
   
    ArrayList<Product> selectProductList(PageInfo pi, String order);
    
    Product selectProductDetail(int productNo);
	
    ArrayList<Product> selectFilteredProductList(PageInfo pi, String order, String category, String keyword);
    
    ArrayList<HashMap<String, Object>> selectRating(int[] productNoArr);
}

