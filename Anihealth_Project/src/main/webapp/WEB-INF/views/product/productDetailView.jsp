<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
        
        .price-row td strong,
		.quantity-row td.quantity {
		    font-size: 1.2em; /* 글자 크기를 키웁니다 */
		}
		
		.price-row td,
		.quantity-row td {
		    font-size: 1.1em; /* 글자 크기를 키웁니다 */
		}
		
		.quantity-content span {
		    font-size: 1.1em; /* 수량 글자 크기를 키웁니다 */
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
         	border: 2px solid  rgb(233, 199, 199);
        }

        #cart1 {
            color: white;
            background-color: rgb(139, 198, 178);
            font-weight: bold;
         	padding: 10px 20px;
        }
         #cart1:hover{
            padding: 10px 20px;
         	 color: white;
         	 font-weight: bold;
         	 background-color: rgb(106, 165, 145);
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
		    width: 85%;
		    margin: 0 auto;
		    margin-top: 40px;
		    text-align: center;
		    padding-top: 20px;
		}
		.section-heading {
		    color: #333; 
		    margin-bottom: 10px; 
		    font-size: 24px; 
		}
			
		.effect-container {
		    display: flex;
		    justify-content: space-between; /* 효능과 부작용을 양 옆으로 배치 */
		    margin-top: 20px;
		    margin-bottom: 20px;
		    
		}
		
		.effect-cell {
		    width: 50%;
		    border: 1px solid #ddd;
		    padding: 10px;
		    border-radius: 8px;
		    text-align: center; /* 효능과 부작용 내용 가운데 정렬 */
		}
		
		.effect-cell:first-child {
		    margin-right: 2%; /* 효능과 부작용 사이 간격을 조절합니다 */
		}
		
		.effect-items {
		    display: flex;
		    flex-wrap: wrap; /* 공간이 부족할 경우 항목을 다음 줄로 넘깁니다 */
		    justify-content: center; /* 가운데 정렬 */
		}
		
		.effect-item {
		    margin-right: 20px; /* 각 항목 사이 간격을 조절합니다 */
		    margin-bottom: 10px; /* 항목들 사이의 여백을 조절합니다 */
		    text-align: center;
		}
		
		.section-title {
			    margin-bottom: 20px; /
			      color: #333; 
			}
			
		.effect-image {
		    width: 100px;
		    height: 100px;
		    object-fit: cover; /* 이미지를 확대 또는 축소하여 채웁니다 */
		    border-radius: 50%; /* 이미지를 둥글게 만듭니다 */
		}
		
		.effect-name {
		    font-weight: bold;
		    margin-top: 5px;
		     color: #666; 
		}
		
		.img-detail {
		    margin-top: 30px;
		    width: 100%;
		    max-width: 100%;
		    height: 300px;
		}
		 .no-side-effect-text {
	        font-weight: bold;
	        color: #666; 
	        margin-top: 5px; /* 상단 여백 설정 */
	        font-size: 18px;
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
            width: 70%; 
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
		                    <tr class="price-row" style="border-bottom: 2px solid rgb(198, 196, 196); background-color: rgb(254, 245, 237);">
			                    <td class="td-left"><strong>구매가</strong></td>
			                    <td><strong id="priceDisplay">₩ ${product.price}</strong></td>
		                    </tr>
		                    <tr class="quantity-row" style="background-color: rgb(254, 245, 237);">
			                    <td class="quantity td-left">수량</td>
			                    <td colspan="3">
			                        <div class="quantity-content">
			                         <span> 총  1   개 </span>
			                        </div>
			                    </td>
		                    </tr>
		                    <tr>
			                    <td colspan="2">
			                        <div class="button-container">
			                         <button type="button" id="heart1" class="btn btn-lg heart">${wishlistAdded ? '❤️' : '🤍'}</button>
			                        <button type="button" id="cart1" class="btn btn-lg cart-btn">장바구니 담기</button> 
			                        </div>
			                    </td>
		                    </tr>
	                 </form>
                </tbody>
            </table>
        </div>
         <br><br>
         
         

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
    
    
   <script>
			$(document).ready(function() {
			    const heartBtn = $("#heart1");
			    const productNo = ${product.productNo}; // 서버 측에서 할당된 실제 상품 번호로 변경
			
			    // 페이지 로드 시 위시리스트 상태 확인
			    checkWishlistStatus();
			
			    // 하트 버튼 클릭 이벤트
			    heartBtn.click(function() {
			        $.ajax({
			            url: "checkLogin1",
			            type: "GET",
			            success: function(response) {
			                if (response.loggedIn) {
			                    const formData = {
			                        productNo: productNo,
			                        userNo: response.userNo
			                    };
			
			                    // Ajax 요청: toggleHeart.pd로 POST 요청
			                    $.ajax({
			                        url: "toggleHeart.pd",
			                        type: "POST",
			                        contentType: "application/json",
			                        data: JSON.stringify(formData),
			                        success: function(result) {
			                            if (result.success) {
			                                console.log(result.message);
			                                alert(result.message);
			
			                                // 하트 버튼 상태 업데이트
			                                if (result.added) {
			                                    heartBtn.text("❤️"); // 하트 추가 상태
			                                } else {
			                                    heartBtn.text("🤍"); // 하트 제거 상태
			                                }
			                            } else {
			                                console.log(result.message);
			                                alert(result.message);
			                            }
			                        },
			                        error: function() {
			                            console.log("서버 오류: 하트 추가/삭제 실패");
			                            alert("서버 오류: 하트 추가/삭제 실패");
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
			
			    function checkWishlistStatus() {
			        $.ajax({
			            url: "checkWishlistStatus",
			            type: "GET",
			            data: { productNo: productNo },
			            success: function(response) {
			                if (response.inWishlist) {
			                    heartBtn.text("❤️"); // 하트 추가 상태
			                } else {
			                    heartBtn.text("🤍"); // 하트 제거 상태
			                }
			            },
			            error: function() {
			                console.log("위시리스트 상태 확인 실패");
			                alert("위시리스트 상태 확인 실패");
			            }
			        });
			    }
			});
  </script>
          
                  <div class="cont">
	                
	                <ul class="list">
	                    <li class="tab-button green" data-id="0">상세정보</li>
	                    <li class="tab-button" data-id="1">상품후기</li>
	                </ul>
	                
	                <div class="tab-content show">	                        
								<div class="detail-list-container">
								    <h4 class="section-heading">상세 정보</h4>
								    <div class="effect-container">
								        <!-- 효능 칸 -->
								        <div class="effect-cell">
								            <h5 style="font-weight: bold;"  class="section-title">효능</h5>
								            <div class="effect-items">
								                <!-- 효능 항목 반복문 -->
								                <c:forEach var="c" items="${requestScope.effects}">
								                    <div class="effect-item">
								                        <img src="${pageContext.request.contextPath}/${c.effectFilePath}" alt="효과 사진" class="effect-image">
								                        <div class="effect-name">${c.effectName}</div>
								                    </div>
								                </c:forEach>
								            </div>
								        </div>
								        
								        <!-- 부작용 칸 -->
								        <div class="effect-cell">
								            <h5 style="font-weight: bold;"  class="section-title">부작용</h5>
								            <div class="effect-items">
								                <!-- 부작용 항목 반복문 -->
								                <c:forEach var="se" items="${requestScope.sideEffects}">
								                    <div class="effect-item">
								                        <img src="${pageContext.request.contextPath}/${se.effectFilePath}" alt="효과 사진" class="effect-image">
								                        <div class="effect-name">${se.effectName}</div>
								                    </div>
								                </c:forEach>
								            </div>
								        </div>
								    </div>
								    <img src="${pageContext.request.contextPath}/${product.productDetailPath}" alt="상세 정보 이미지" style="border: 1px solid;" class="img-detail">
								</div>				    
						</div>  		
							   <div class="tab-content">
							   <jsp:include page="../review/productReview.jsp">
                			<jsp:param name="productNo" value="${product.productNo}" />
						</jsp:include>
	                            </div>  
						              
                    </div>
	
			   <br>  <br>
            <div class="btn-list-container" >
                <div class="btn-list">
                    <button class="btn btn-lg"
                                onclick="location.href='list.pd'">
                                					목록으로
                    </button>
                </div>
            </div>
             <br>  <br>  
         
</div>



<jsp:include page="../common/footer.jsp" />

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var sideEffects = document.querySelectorAll(".effect-cell:nth-child(2) .effect-item");
        if (sideEffects.length === 0) {
            var noSideEffectText = document.createElement("div");
            noSideEffectText.classList.add("effect-item", "no-side-effect-text");
            noSideEffectText.textContent = "부작용이 없습니다.";
            
            var sideEffectContainer = document.querySelector(".effect-cell:nth-child(2) .effect-items");
            sideEffectContainer.appendChild(noSideEffectText);
        }
    });
</script>




<script>

    //탭 전환 버튼 영역
    $('.tab-button').click(function (e) {
        if ($(e.target).hasClass('tab-button')) {
            openTab($(e.target).data('id')); // 클릭된 버튼의 data-id를 가져와서 탭 전환
        }
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