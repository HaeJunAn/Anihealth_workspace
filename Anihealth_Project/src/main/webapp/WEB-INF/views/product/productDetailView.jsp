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
  
        .img-thumb {
            display: block;
            margin: 0 auto;
            width: 80%;
            height: auto;
            border-radius: 45px;
        }

        .quantity-content span {
            vertical-align: middle;
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
        #heart1 {
            font-size: large;
         	margin-left: 30px;
         	border: 1px solid   rgb(233, 199, 199);
        }

        #cart1 {
            color: white;
            background-color: rgb(139, 198, 178);
            font-weight: bold;
         
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


        /* 영양제 상세설명 시작 */
        .detail-list-container {
            width: 80%;
            margin: 0 auto;
            margin-top: 40px;
            text-align: center; /* 내용물을 가운데 정렬 */
            padding-left: 0; /* 불필요한 패딩 제거 */
        }

        /* 영양제 상세설명 끝 */

        /* 탭버튼영역시작 */
        ul.list {
            list-style-type: none;
            margin: 0;
            padding: 0;
            border-bottom: 2px solid #ccc;
        }
        ul.list::after {
            content: '';
            display: block;
            clear: both;
        }
        .tab-button {
            display: block;
            padding: 10px 40px; 
            float: left;
            margin-right: -1px;
            margin-bottom: -1px;
            color: grey;
            text-decoration: none;
            cursor: pointer;
            font-size: 1.3em; 
        }
        .green {
            border-top: 3px solid rgb(175, 215, 175);
            border-right: 2px solid #ccc;
            border-bottom: 1px solid white;
            border-left: 2px solid #ccc;
            color: black;
            margin-top: -2px;
        }
        .tab-content {
            display: none;
            padding: 10px;
        }
        .show {
            display: block;
        }
        .cont {
            width: 70%; /* 너비를 부모의 60%로 설정 */
            margin: 0 auto; /* 수평 중앙 정렬 */
            padding-top: 20px; /* 상단 패딩 */
            padding-bottom: 20px; /* 하단 패딩 */
            border-radius: 10px; /* 테두리 둥글게 설정 */
        }
        /* 탭버튼 영역 끝 */

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
       				 	<input type="hidden" name="price" value="${product.price}">
                    <tr>
                    <td rowspan="8" style="width: 60%;">
                        <img src="${pageContext.request.contextPath}/${product.productThumbnailPath}" 
                             alt="${product.productName}"
                             class="img-thumb">
                    </td>
                    </tr>
                    <tr>
                    <td class="td-left">
                        <h5 style="font-weight: bold; color: rgb(118, 117, 117);">${product.category} 영양제</h5>
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
                        <span>총</span> 1 개 <!-- 수정된 부분 -->
                        </div>
                    </td>
                    </tr>
                    <tr>
                    <td colspan="2">
                        <div class="button-container">
                        <button id="heart1" class="btn btn-lg heart-btn">❤️</button>
                        <button type="button" id="cart1" class="btn btn-lg cart-btn">장바구니 담기</button> 
                        </div>
                    </td>
                    </tr>
                </form>
               </tbody>
            </table>
        </div> <br><br>

        <script>
    document.getElementById("cart1").addEventListener("click", function() {
        $.ajax({
            url: "checkLogin",
            type: "get",
            success: function(response) {
                if (response.loggedIn) {
                    // Proceed with adding to cart
                    const form = document.getElementById("addToCartForm");
                    const formData = {
                        productNo: form.productNo.value,
                        price: form.price.value,
                    };
                    $.ajax({
                        url: "cart.ad",
                        type: "post",
                        contentType: "application/json",
                        data: JSON.stringify(formData),
                        success: function(result) {
                            if (result.success) {
                                console.log(result.message);
                                alert(result.message);
                            } else {
                                console.log(result.message);
                                alert(result.message);
                            }
                        },
                        error: function() {
                            console.log("장바구니 담기 실패");
                            alert("장바구니 담기 실패");

                        }
                    });
                } else {
                    alert("로그인이 필요합니다.");
                }
            },
            error: function() {
                console.log("로그인 상태 확인 실패");
                alert("로그인 상태 확인 실패");
            }
        });
    });
    </script>
          
            <div class="cont">
                <ul class="list">
                    <li class="tab-button green" data-id="0">상세정보</li>
                    <li class="tab-button" data-id="1">상품후기</li>
                </ul>
                <div class="tab-content show">
                        <!-- 상세 정보 리스트 추가 -->
                        <div class="detail-list-container">
                            <h4>상세 정보</h4>
                            <img src="${pageContext.request.contextPath}/${product.productDetailPath}" 
                                alt="상세 정보 이미지">
                        
                        </div>
                </div>
                <div class="tab-content">
                		영양제 후기 영역  
                </div>
            </div>
	
			<br>
            <div class="btn-list-container" >
                <div class="btn-list">
                    <button class="btn btn-lg"
                                onclick="location.href='list.pd'">
                                목록으로
                    </button>
                </div>
            </div>
            <br>
         
</div>



<jsp:include page="../common/footer.jsp" />


<script>
    //탭전환 버튼 영역
    $('.list').click(function (e) {
        openTab(e.target.dataset.id); // 상위요소 리스트로 이벤트 버블링을 이용한 축약 코드
    });

    function openTab(number) { // 함수 이름을 'openTab'으로, 파라미터를 'number'로 변경
        $('.tab-button').removeClass('green');
        $('.tab-button').eq(number).addClass('green');
        $('.tab-content').removeClass('show');
        $('.tab-content').eq(number).addClass('show');
    }
</script>


</body>
</html>