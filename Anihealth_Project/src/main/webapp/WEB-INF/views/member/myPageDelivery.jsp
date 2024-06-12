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

        /* 콘텐츠 스타일 */
        .content-my {
            width: 70%;
            margin: 0 auto;
            margin-left: 10px;
        }

        .content-my h2 {
            margin-top: 0;
            padding-bottom: 20px;
            border-bottom: 2px solid lightgray;
            margin-bottom: 20px;
        }

        .address-container {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            position: relative; 
        }

        .address-item {
            display: flex;
            flex-direction: column;
        }

        .badge {
            display: inline;
            padding: 5px 7px;
            background-color: white;
            color: gray;
            border: 1px solid lightgray;
            border-radius: 10px;
            margin-right: 10px;
            font-size: 0.75em;
            max-width: 100px;
        }

        .address-name {
            font-weight: bold;
            margin-top: 10px;
            margin-bottom: 5px;
        }

        .address-details {
            margin: 5px 0;
        }

        .btn {
            margin-top: 10px;
            display: inline-block;
        }

        #btn-edit {
            background-color: #599a83;
            /* color: aliceblue; */
            margin: 5px;
            color: white;
        }

        #btn-add {
            display: block;
            margin: 0 auto;
            padding: 10px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            /*background-color: rgb(191, 216, 175);*/
            border: 1px solid rgb(191, 216, 175);
            color: black;
        }
        
        #btn-add:hover {
        	background-color: rgb(191, 216, 175);
        	color: white;
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
	            <h2>배송지 관리</h2> 
	            <br>
	            <div class="address-container">
	                <div class="address-item">
	                    <span class="badge badge-pill">기본배송지</span>
	                    <p class="address-name">정화목1</p>
	                    <p class="address-details">서울특별시 영등포구 선유동2로 57 이레빌딩 19F</p>
	                    <p class="address-details">010-1234-5678</p>
	                    <p class="address-details">일반: 문 앞 / 새벽 : 문 앞 (자유출입가능)</p>
	                    <button class="btn btn-edit" id="btn-edit">수정</button>
	                </div>
	            </div>
	            
	            <br>
	            <div class="gray-line"></div> 
	            <br><br>
	            <button class="btn" id="btn-add">+ 배송지 추가</button>
	        </div>
        </div>
        <div class="gray-line"></div>
    </div>

    <br><br><br><br><br><br>
    <!-- 푸터바 -->
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
