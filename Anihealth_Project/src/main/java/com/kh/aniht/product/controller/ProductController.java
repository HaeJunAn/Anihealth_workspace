package com.kh.aniht.product.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.common.template.Pagination;
import com.kh.aniht.product.model.service.ProductService;
import com.kh.aniht.product.model.vo.Product;
import com.kh.aniht.review.model.vo.Review;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping("list.pd")
    public String productList(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
                              @RequestParam(value="order", defaultValue="newest") String order,
                              @RequestParam(value="category", required=false) String category,
                              @RequestParam(value="keyword", required=false) String keyword,
                              Model model) {

       // System.out.println("Category: " + category);
        //System.out.println("Keyword: " + keyword);

        PageInfo pi = Pagination.getPageInfo(productService.selectProductListCount(category, keyword), currentPage, 10, 8);
        ArrayList<Product> list;

        // 검색 조건이 없을 경우 전체 제품 목록 조회
        if ((category == null || category.isEmpty()) && (keyword == null || keyword.isEmpty())) {
            list = productService.selectProductList(pi, order);
        } else {
            list = productService.selectFilteredProductList(pi, order, category, keyword);
        }

        model.addAttribute("pi", pi);
        model.addAttribute("list", list);
        model.addAttribute("selectedCategory", category);
        model.addAttribute("searchKeyword", keyword);

        if (list.isEmpty()) {
            model.addAttribute("noResults", true);
        }

        return "product/productListView";
    }

    @GetMapping("search.pd")
    public String searchProduct(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
                                @RequestParam(value="order", defaultValue="newest") String order,
                                @RequestParam(value="category", required=true) String category,
                                @RequestParam(value="keyword", required=true) String keyword,
                                RedirectAttributes redirectAttributes) {

       // System.out.println("Search Category: " + category);
        //System.out.println("Search Keyword: " + keyword);

        PageInfo pi = Pagination.getPageInfo(productService.selectProductListCount(category, keyword), currentPage, 10, 8);
        ArrayList<Product> list;

        list = productService.selectFilteredProductList(pi, order, category, keyword);

        if (list.isEmpty()) {
            redirectAttributes.addFlashAttribute("noResults", true);
            return "redirect:/list.pd";
        }

        redirectAttributes.addFlashAttribute("pi", pi);
        redirectAttributes.addFlashAttribute("list", list);
        redirectAttributes.addFlashAttribute("selectedCategory", category);
        redirectAttributes.addFlashAttribute("searchKeyword", keyword);

        return "redirect:/list.pd";
    }


    @GetMapping("detail.pd")
    public ModelAndView selectProductDetail(@RequestParam("pno") int productNo, ModelAndView mv) {
     //   System.out.println("Controller: Fetching product details for productNo: " + productNo);
        Product product = productService.selectProductDetail(productNo);
        
        if (product != null) {
           // System.out.println("Controller: Fetched product: " + product);
            mv.addObject("product", product)
              .setViewName("product/productDetailView");
        } else {
           // System.out.println("Controller: Product not found for productNo: " + productNo);
            mv.addObject("errorMsg", "제품 상세조회 실패")
              .setViewName("common/errorPage");
        }
        
        return mv;
    }
    
    
    @ResponseBody
    @GetMapping(value = "rating.pd", produces="application/json; charset=UTF-8")
    public String selectRating(int[] productNoArr) {
    	ArrayList<HashMap<String, Object>> rList = productService.selectRating(productNoArr); 	
    	
    	System.out.println(rList);
    	
    	return new Gson().toJson(rList);
		
	}
    
    
    
    
    

}
