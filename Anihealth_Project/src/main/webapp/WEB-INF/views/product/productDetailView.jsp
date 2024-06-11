<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
 /* 메인컨테츠영역 시작 */
        .parent {
            width: 100%;
            padding-top: 100px;
            padding-bottom: 50px;
        }

        .parent-container {
            width: 100%;
        }

        .header-faq {
            text-align: center;
            padding-bottom: 20px;
            /* margin-bottom: 60px; */
        }
        .header-faq h1{
            color: #57585c;
            text-align: center;
        }

        /* 제품이미지랑 구매가 영역 시작 */
        .parent-info {
            background-color: #f6f9f9c9;
            width: 60%; 
            margin: 0 auto;
            padding-top: 5px;
            padding-bottom: 20px;
            padding-right: 40px;
            border-radius: 30px;
        }

        .info-table {
            width: 100%; 
            margin: 0 auto;   
            padding-top: 10px; 
            margin-top: 30px; 
            border-collapse: collapse;
        }


        .td-left {
            padding: 10px;
            text-align: left;
            white-space: nowrap; 
        }
  
        img {
            display: block;
            margin: 0 auto;
            width: 80%;
            height: auto;
            border-radius: 45px;
        }

        .quantity-content span {
            vertical-align: middle;
        }

        #minus, #plus {
            background-color: rgb(100, 99, 99);
            color: white;
            width: 30px;
            height: 30px;
            border: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0;
        }

        .quantity-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
        }

        .quantity-content {
            display: flex;
            align-items: center;
        }
        .quantity-content span{
            margin-right: 10px;
        }


        .quantity-content button {
            margin: 0 5px;
            padding: 5px 10px;
            cursor: pointer;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 15px;
        }

        #heart {
            font-size: large;
         	margin-left: 50px;
        }

        #cart {
            color: white;
            background-color: rgb(139, 198, 178);
            font-weight: bold;
             padding-right: 40px;
            padding-left: 40px;
        }

        #table-line{
            border-bottom: 2px solid rgb(55, 51, 51);
            width: 90%;
            margin: 0 auto;    
        }
    
         /* 제품이미지랑 구매가 영역 끝*/


         .gray-line {
            width: 70%; 
            margin: 0 auto;
            border-bottom: 2px solid lightgray;
            margin-top: 30px;
            margin-bottom: 30px;
        }

        /* 영양제 전체보기랑 후기영역 시작 */
        .slide-container {
            width: 70%;
            margin: 0 auto;
            margin-top: 30px;
            margin-bottom: 30px;
         }

        .slide-table {
            width: 100%; 
            border-collapse: separate;
            border: 1px solid grey;
            border-radius: 10px;
            margin-top: 10px;
            border-spacing: 0; /* 셀 간의 경계선을 유지하면서 경계선을 적용 */
        }
        .slide-table td {
            text-align: left;
            vertical-align: top;
            padding: 3px;
        }

        .bestpick-container {
            width: 100%; 
            margin: 0 auto; 
            display: flex;
            justify-content: space-between;
        }

        .rw-tb1{
            border-radius: 20px;
            margin: 5px;
            overflow: hidden; 
            border: 1px solid lightgrey; 
            border-spacing: 0;
        }
        .rw-tb1 td {
         padding: 0; /* 텍스트 칸의 여백 제거 */
        }
        /* BEST 후기와 전체보기 글자 굵게 하기 */
        .bestpick-container h5 {
            font-weight: bolder; /* 글자 더 굵게 */
            font-size: 1.3em; /* 글자 크기 키우기 */
        }

        .bestpick-link {
            text-decoration: none;
            color: inherit; 
        }

        .bestpick-link:hover {
            cursor: pointer; 
        }
        .image-box {
            text-align: center; 
            display: flex; 
            align-items: center; 
            justify-content: center;
            padding-top: 5px;
            border-radius: 10px;
        }

        .slide-image {
            width: 100%;
            height: auto;
            object-fit: cover;
            border-radius: 10px;
        }

        .info-title1 {
            font-weight: bold;
            margin: 0;
        }

        .stars {
            display: inline-block !important;
            text-align: left !important;
            color: rgb(255, 222, 36);
            margin: 0;
        }

        .star-score {
            font-size: large;
            font-weight: bold;
            color: rgb(51, 132, 245);
        }

        .review-content {
           margin: 0;
        }

      /* 영양제 전체보기랑 후기영역 시작 */



        /* 영양제 상세설명 시작 */
        .detail-list-container {
            width: 80%;
            margin: 0 auto;
            margin-top: 40px;
            text-align: center; /* 내용물을 가운데 정렬 */
            padding-left: 0; /* 불필요한 패딩 제거 */
        }

        .delivery-list-container {
            width: 90%;
            margin: 0 auto;
            margin-top: 40px;
            text-align: center; /* 내용물을 가운데 정렬 */
        }

        .delivery-list {
            display: inline-block;
            text-align: left; /* 내부 리스트는 왼쪽 정렬 */
        }
        /* 영양제 상세설명 끝 */

        /* 목록으로 버튼 영역시작 */
        .btn-list-container {
            width: 100%;
            text-align: center; /* 중앙 정렬 */
        }


        .btn-list>button {
            font-size: 120%;
            font-weight: bold;
            cursor: pointer; 
            border: 3px solid rgb(82, 166, 121);
            color: rgb(83, 88, 88);
            font-weight: 600;
            margin-top: 40px;
        }
        /*목록으로 버튼 영역끝 */
</style>


</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="parent">
  <div class="parent-container">
    <div class="header-faq">
        <h1>영양제 상세보기</h1>
    </div>
  </div>
  <div class="gray-line"></div> 


  <div class="parent-info">
  <table class="info-table">
    <tbody>
      <form id="addToCartForm">
        <!-- Hidden field for product number -->
        <input type="hidden" name="productNo" value="${product.productNo}">
        <input type="hidden" name="productName" value="${product.productName}">
        <input type="hidden" name="price" value="${product.price}">
  
        <tr>
          <td rowspan="8" style="width: 60%;">
            <img src="${pageContext.request.contextPath}/${product.productThumbnailPath}" alt="${product.productName}">
          </td>
        </tr>
        <tr>
          <td class="td-left">
            <h5 style="font-weight: bold; color: rgb(118, 117, 117);"> ${product.category} 영양제</h5>
            <h4 style="font-weight: bold;">${product.productName}</h4>
          </td>
        </tr>
        <tr style="border-bottom: 2px solid rgb(198, 196, 196); background-color: rgb(254, 245, 237);">
          <td class="td-left"><strong>구매가</strong></td>
          <td><strong id="priceDisplay">₩ ${product.price}</strong></td>
        </tr>
        <tr style="background-color: rgb(254, 245, 237);">
          <td class="quantity td-left">수량</td>
          <td colspan="3">
            <div class="quantity-content">
              <span>총</span> 1 개 
            </div>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <div class="button-container">
              <button id="heart" class="btn btn-lg">❤️</button>
              <button type="button" id="cart" class="btn btn-lg">장바구니 담기</button> <!-- 기존 id="cart" 사용 -->
            </div>
          </td>
        </tr>
      </form>
    </tbody>
  </table>
</div>

<script>
  $(document).ready(function() {
    $('#cart').click(function() { // id="cart" 사용
      var form = $('#addToCartForm');
      var formData = form.serialize();

      $.ajax({
        url: '${pageContext.request.contextPath}/add-to-cart',
        method: 'POST',
        data: formData,
        success: function(response) {
          if (response.success) {
            alert('장바구니에 추가되었습니다!');
            window.location.href = '${pageContext.request.contextPath}/cart-page'; // 성공 시 장바구니 페이지로 리디렉션
          } else {
            if (response.message === "로그인이 필요합니다.") {
              alert('로그인이 필요합니다.');
              window.location.href = '${pageContext.request.contextPath}/login'; // 로그인 페이지로 리디렉션
            } else {
              alert('장바구니 추가에 실패했습니다.');
            }
          }
        },
        error: function() {
          alert('장바구니 추가에 실패했습니다.');
        }
      });
    });
  });
</script>
  
                    
                           <div class="gray-line"></div> 
                    
                                            
                  <div class="slide-container">
			                        <div class="bestpick-container">
			                            <h5>BEST 후기</h5>
			                            <a href="#" class="bestpick-link">
			                                <h5>전체보기 〉〉</h5>
			                            </a>
			                        </div>

                       <table class="slide-table">
                            <tr>
                                <td style="width: 50%; vertical-align: top;">
                                    <table class="rw-tb1">
                                        <tr>
                                            <td rowspan="3" style="width: 30%;">
                                                <div class="image-box">
                                                    <img src="../resources/image/skin-hair.png" alt="이미지 설명" class="slide-image">
                                                </div>
                                            </td>
                                            <td style="vertical-align: top;">
                                                <span class="info-title1">뽀또</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top;">
                                                <div class="stars" style="margin-top: 10px;">
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <span class="star-score">5</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top;">
                                                <div class="review-content" style="margin-top: 10px;">
                                                    <p>나이가 드니 건강이 조금씩 안 좋아지고 있어서 ㅠㅠ 병원에서...</p>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="width: 50%; vertical-align: top;">
                                    <table class="rw-tb1">
                                        <tr>
                                            <td rowspan="3" style="width: 30%;">
                                                <div class="image-box">
                                                    <img src="../resources/image/skin-hair.png" alt="이미지 설명" class="slide-image">
                                                </div>
                                            </td>
                                            <td style="vertical-align: top;">
                                                <span class="info-title1">뽀또</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top;">
                                                <div class="stars" style="margin-top: 10px;">
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <span class="star-score">5</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top;">
                                                <div class="review-content" style="margin-top: 10px;">
                                                    <p>나이가 드니 건강이 조금씩 안 좋아지고 있어서 ㅠㅠ 병원에서...</p>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                   </div>
                    


                <!-- 상세 정보 리스트 추가 -->
                <div class="detail-list-container">
                    <h4>상세 정보</h4>
                    <img src="${pageContext.request.contextPath}/${product.productDetailPath}" alt="상세 정보 이미지">
                   
                </div>

                <div class="gray-line"></div> 

                <div class="delivery-list-container">  
                    <div class="delivery-list">
                        <strong style="list-style-type: none; ">배송정보</strong>
                            <ul>
                                <li>브랜드 배송 상품은 페이지 상단에 별도 기재된 브랜드별 기준에 따릅니다.</li>
                                <li>브랜드마다 배송비 및 무료배송 조건이 개별로 적용됩니다.</li>
                                <li>롯데택배를 통해 배송됩니다.</li>
                                <li>부피가 큰 용품 및 일부 상품, 제주도를 포함한 도서산간 지역은 추가배송비 요청이 있을 수 있습니다.</li>
                            </ul>
                        
                    
                            <strong>취소/교환/반품 안내</strong>
                            <ul>
                                <li>주문 취소는 ‘결제 완료’ 상태에서만 가능합니다.</li>
                                <li>교환/반품은 상품 수령일로부터 7일 이내 가능합니다.</li>
                                <li>교환/반품은 상품 회수 및 상태 확인 후 거부될 수 있습니다.</li>
                                <li>환불은 상품 반품 절차가 완료된 후 이상이 없는 경우에 진행됩니다.</li>
                            </ul>
                    
                    </div>
        </div>

        <div class="btn-list-container" >
            <div class="btn-list">
                <button class="btn btn-lg"
                             onclick="location.href='list.pd'">목록으로</button>
            </div>
        </div>
   </div>



<jsp:include page="../common/footer.jsp" />


</body>
</html>