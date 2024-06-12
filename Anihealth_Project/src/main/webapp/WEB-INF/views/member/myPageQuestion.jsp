<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 부트스트랩 연동 코드 (CDN방식)-->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <!-- 온라인 방식 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Font Awesome CSS 포함 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <title>마이페이지 메인</title>
    <style>
        /* 공통 스타일 */
        div {
            box-sizing: border-box;
        }

        html,
        body {
            margin: 0;
            padding: 0;
        }

        .mypage-panel-container-my {
            display: flex;
            justify-content: center; 
            width: 100%;
        }

        .mypage-panel-my {
            display: flex;
            justify-content: center; 
            width: 80%;
        }

        .sidebar-my {
		    width: 20%;
		    padding: 20px;
		    height: 400px;
		    overflow: hidden;
		    position: relative;
		    left: -3%;
		}

        .sidebar-my h3 {
            margin-top: 0;
        }

        nav-my ul {
            list-style-type: none;
            padding: 0;
            margin-left: 4px;
            margin-top: 20px;
        }

        nav-my ul li {
            margin-bottom: 15px;
            font-size: large;
        }

		nav-my ul li span {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }
		

        nav-my ul li a {
            text-decoration: none;
            color: #333;
            font-weight: normal;
            font-size: small;
        }

        nav-my ul li a:hover {
            color: rgb(67, 104, 80);
            text-decoration: none;
        }

        .content-my {
            width: 70%;
            margin: 0 auto;
            margin-left: 10px;
        }

        .content-my h2 {
            margin-top: 0;
            padding-bottom: 20px;
            border-bottom: 2px solid lightgray;
        }

        .cart-background {
            margin-top: 20px;
        }

        .item-container {
            display: flex;
            align-items: center;
            padding: 0px 10px;
            flex-direction: row;
        }

        .img-size {
            height: auto;
            object-fit: cover;
            max-width: 100px;
            border-radius: 10px;
            margin-right: 5px;
        }

        .item-text {
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
            font-weight: bold;
            vertical-align: middle;
        }

        .item-title {
        	text-align: left;
            font-weight: bold;
            margin: 5px;
        }

        .item-subtitle {
            color: gray;
            margin: 5px;
            text-align: left;
        }

        .item-details {
            display: flex;
            align-items: center;
        }

        .cart-background {
            box-sizing: border-box;
            position: relative;
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin: auto;
            text-align: center;
        }

		.cart-table th {
			padding: 15px;
            border-bottom: 1px solid #5a5b5a;
            background-color: #f3f7f1;
            color: rgb(104, 103, 103);
            font-size: large;
            font-weight: bold;
		}

        .cart-table td {
            padding: 15px;
            text-align: center;
            border-top: 1px solid #4ca64c;
        }

        .cart-table tbody:last-child {
            border-bottom: 1px solid #4ca64c;
        }

        .cart-table-item{
          margin-left: 50px;
        }
        

        .cart-table-inner .btn {
            background-color: #599a83;
            /* color: aliceblue; */
            margin: 5px;
            color: white;
        }

        .cart-table-content td {
            vertical-align: middle;
        }

        .gray-line {
            border-bottom: 2px solid lightgray;
        }
        
        
		

    </style>
</head>
<body>
    <!-- 헤더바 -->
    <jsp:include page="../common/header.jsp" />
   
    <div class="mypage-panel-container-my">
        <div class="mypage-panel-my">
            <div class="sidebar-my">
                <h3>
                    <span style="color: rgb(67, 104, 80);"><b>${ sessionScope.loginUser.userNick }</b></span>님의 <br>
                    마이페이지 <br>
                </h3>
                
                <nav-my>
                    <ul>
                        <li>
                        	<span>나의 정보</span> <br>
                        	<a href="myPage.me">회원 정보 관리</a> <br> 
                        	<a href="myPageDelivery.me">배송지 관리</a> <br>
                        </li>	
                        <li>
                        	<span>나의 쇼핑정보</span> <br> 
                        	<a href="myPageOrder.me">주문 내역</a> <br> 
                        	<a href="myPageReview.me">후기 내역</a> <br> 
                        	<a href="myPageWish.me">찜한 제품</a> <br> 
                        </li>
                        
                        <li>
                        	<span>나의 문의정보</span> <br> 
                        	<a href="myPageQuestion.me">1 : 1 문의</a> <br> 
                        </li>
                    </ul>
                </nav-my>
            </div>
            <div class="content-my">
                    <h2>1:1 문의</h2>
                    <br>
                    
                    <div class="cart-background">
                        <table class="cart-table">
                        	<thead>
                                <tr>
                                    <th class="cart-table-item" width="360px;">문의 내역</th>
                                    <th>작성일</th>
                                    <th width="360px;">문의답변</th>
                                    <th>문의답변일</th>
                                    <th width="100px;">삭제</th>
                                    
                                </tr>
                            </thead>
                            <tbody class="cart-table-content">
                                <tr class="cart-table-inner">
                                    <td>  
	                                    <div class="item-text">
	                                        <p class="item-title">배송시간</p>
	                                        <div class="item-details">
	                                            <span class="item-subtitle">얼마나 걸려요?얼마나 걸려요?얼마나 걸려요?</span>
	                                        </div>
	                                    </div>
                                        
                                    </td>
                                    <td>2024-06-11</td>
                                    <td>일주일정도 걸립니다.</td>
                                    <td>2024-06-11</td>
                                    <td>
                                        <button class="btn btn-sm">삭제</button>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <br><br>
                    <div class="gray-line"></div> 
                </div>
        </div>
    </div>

    <br><br><br><br><br><br><br>
    <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
