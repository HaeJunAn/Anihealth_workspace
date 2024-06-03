<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헤더 페이지</title>
    <!-- jQuery 연동 : 모든 페이지 상단에 menubar.jsp 가 include 되므로 -->
    <!-- 부트스트랩 연동도 마찬가지 -->

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

	<!-- 애니메이션 CDN방식-->
	 <link
	 rel="stylesheet"
	 href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

    <style>
        @font-face {
            font-family: 'WavvePADO-Regular';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2404@1.0/WavvePADO-Regular.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        * {
            font-family: 'WavvePADO-Regular';
        }

        /* 헤더 시작 */
        div {
            box-sizing: border-box;
            /* border : 1px solid darkblue;  */
        }

        html,
        body {
            margin: 0;
            padding: 0;
        }

        #header {
            height: 132px;
            width: 100%;
            display: flex;
            padding-top: 20px;
            margin-bottom: 20px;
            align-items: center;
            /* 수직 가운데 정렬 */
            justify-content: space-between;
        }

        #header>div {
            display: flex;
            align-items: center;
        }

        #logo {
            height: 138px;
            width: auto;
            margin-left: 150px;
            /* 로고 이미지와 다음 요소 사이 간격 설정 */
        }

        #header_1 {
            width: 30%;
        }

        #header_2 {
            width: 50%;
            justify-content: center;
            /* 가운데 정렬 */
            margin-right: 30px;
        }

        #header_2 a,
        #header_3 a {
            color: gray;
            text-decoration: none;
            font-size: 120%;
        }

        #header_3 a {
            font-weight: bold;
        }

        #header_2,
        #header_3 {
            height: 100%;
            display: flex;
            align-items: center;
            /* 수직 가운데 정렬 */
        }

        #header_2 ul {
            margin: 0;
            /* 리스트의 기본 마진 제거 */
            padding: 0;
            /* 리스트의 기본 패딩 제거 */
        }

        #header_3 {
            width: 20%;
            justify-content: flex-end;
            /* 로그인 구역을 오른쪽 정렬 */
            margin-right: 100px;
        }

        .navbar-nav {
            display: flex;
            align-items: center;
            /* 수직 가운데 정렬 */
        }

        #header_2 .nav-item {
            margin-right: 50px;
            /* 각 네비게이션 아이템 간격 설정 */
        }

        #header_2 .nav-item:last-child {
            margin-right: 0;
            /* 마지막 네비게이션 아이템의 마진 제거 */
        }
        
        .wrap>div {
            width: 100%;
            margin: auto;
        }

        /* 헤더 영역 끝 */
    </style>
</head>
    
    <body>
    
        <div class="wrap">
    
            <div id="header">
    
                <div id="header_1" align="center">
                    <a href="#">
                        <img src="resources/img/image (4).png" id="logo">
                    </a>
                </div>
    
                <div id="header_2" align="center">
                    <ul class="nav justify-content-center">
                        <li class="nav-item">
                            <a class="nav-link" href="#">영양제</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">건강체크</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">동물병원 찾기</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">매거진</a>
                        </li>
    
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">고객센터</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="faq.bo">FAQ</a>
                                <a class="dropdown-item" href="#">1:1 문의</a>
    						</div>
                        </li>
    
                    </ul>
                </div>
    
                <div id="header_3">
                    <div id="text">
                        <a href="" id="sign">로그인</a> &nbsp;&nbsp;|&nbsp; &nbsp;
                        <a href="">회원가입</a>
                    </div>
                </div>
    
            </div>
        </div>
    
    </body>
</html>