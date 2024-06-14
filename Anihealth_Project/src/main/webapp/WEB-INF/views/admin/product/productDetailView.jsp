<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
		width: 100%;
        /* text-align: center; */
        padding-top: 100px;
        padding-bottom: 150px;
	}
	
	#detail-area-content, #detail-area-img  {
		width: 50%;
        margin: 0 auto; 
        /* 부모 요소의 가운데 정렬을 위해 auto 마진 추가 */
	}
	
	#detail-area-content th, .area-middle {
		text-align: center;
	}
	
	.detail-area img {
		text-align: center;
	}
	
	/* 제목 영역 시작 */
 	.header-product {
        margin-left: auto;
        margin-right: auto;
        margin-bottom: 50px;   
    }

    .header-product h1 {
        color: #57585c;
        text-align: center;
    }
    /* 제목 영역 끝 */
    
    /* 버튼 영역 시작 */
    .btns a {
       border: none;
       background-color: #f0f0f0; 
       color: #202020; 
       padding: 10px 25px; 
       margin: 0 5px; 
       cursor: pointer;
       border-radius: 10px; 
       margin-right: 15px;
       border: 1px solid  rgb(82, 166, 121);
   }

   .btns a:hover {
       background-color:  rgb(198, 228, 212);
   }
   /* 버튼 영역 끝 */
</style>
</head>
<body>
	
	<jsp:include page="../../common/header.jsp" />
	
	<div class="outer">
	
		<div class="header-product">
            <h1>PRODUCT DETAIL</h1>
        </div>
        
        <div class="detail-area">
	        <table id="detail-area-content" class="table">
	        	<thead>
		        	<tr>
		        		<th width="150px">상품번호</th>
		        		<td width="800px">${ requestScope.p.productNo }</td>
		        		<th width="150px" class="area-middle">카테고리</th>
		        		<td width="250px" class="area-middle">${ requestScope.p.category }</td>
		        	</tr>
		        	<tr>
		        		<th>상품명</th>
		        		<td colspan="3">${ requestScope.p.productName }</td>
		        	</tr>
		        	<tr>
		        		<th>상품재고</th>
		        		<td>${ requestScope.p.productStock }</td>
		        		<th class="area-middle">조회수</th>
		        		<td class="area-middle">${ requestScope.p.productCount }</td>
		        	</tr>
		        	<tr>
		        		<th>가격</th>
		        		<td>
		        			<fmt:formatNumber value="${ p.price }" type="number" groupingUsed="true" /> &nbsp;원
		        		</td>
		        		<th class="area-middle">공개여부</th>
		        		<td class="area-middle">${ requestScope.p.productStatus }</td>
		        	</tr>
		        	<tr>
		        		<th style="color : blue;">효능</th>
		        		<td>
		        			<c:forEach var="effect" items="${ requestScope.e }">
		        				<span>${ effect.effectName } &nbsp;</span>
		        			</c:forEach>
		        		</td>
		        		<th style="color : red;">부작용</th>
		        		<td>
		        			<c:forEach var="sideEffect" items="${ requestScope.se }">
		        				<span>${ sideEffect.effectName } &nbsp;</span>
		        			</c:forEach>
		        		</td>
		        	</tr>
		        </thead>
		        <tbody id="detail-area-img">
		        	<tr>
		        		<th width="130px" class="area-middle">대표이미지</th>
		        		<td width="700px" colspan="4">
		        			<img src="${ requestScope.p.productThumbnailPath }" width="100%">
		        		</td>
		        	</tr>
		        	<tr>
		        		<th class="area-middle">상세이미지</th>
		        		<td colspan="4">
		        			<img src="${ requestScope.p.productDetailPath }" width="100%">
		        		</td>
		        	</tr>
	        	</tbody>
	        </table>
        </div>
        
        <div class="btns" align="center">
        	<a class="btn btn-lg" onclick="postFormSubmit(1);">수정</a>
        	<a class="btn btn-lg" href="product.ad">목록</a>
        	<a class="btn btn-lg" onclick="postFormSubmit(2);">품절</a>
        	<a class="btn btn-lg" onclick="deleteAlert();">삭제</a>
        </div>
        
        <form id="postForm" action="" method="post">
        	<input type="hidden" name="pno" value="${ requestScope.p.productNo }" >
        </form>
        
        <script>
        	function postFormSubmit(num) {
        		
        		switch(num) {
        		
        			case 1 : $("#postForm").attr("action", "updateFormProduct.ad").submit(); break; 
        			case 2 : $("#postForm").attr("action", "soldOutProduct.ad").submit(); break; 
        			
        		}
        		
        	}
        	
        	function deleteAlert() {
        		
        		if (window.confirm('제품을 공개하지 않으시겠습니까?')) {
        			$("#postForm").attr("action", "deleteProduct.ad").submit();
        		}
        		
        	}
        </script>
        
	</div>

</body>
</html>