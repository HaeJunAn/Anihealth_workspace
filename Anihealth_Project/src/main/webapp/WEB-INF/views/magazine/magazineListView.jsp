<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 
<meta charset="UTF-8">
<title>매거진</title>
 <style>
        /* 헤더 시작 */
        div {
            box-sizing: border-box;
            /* border : 1px solid darkblue;  */
        }

        html, body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
        }

        /* 메인컨텐츠영역 시작 */
        .parent {
            width: 100%;
            padding-top: 100px;
            padding-bottom: 80px;
            background-color: rgb(240, 240, 240);
        }

        .parent-content {
            width: 80%;
            margin: 0 auto;
        }

        .parent-container {
            width: 100%;
            display: flex;
            justify-content: center;
            /* 부모 요소를 중앙에 배치 */
        }

        /* 매거진 제목영역 시작 */
        .header-faq {
            padding-bottom: 20px;
            margin-bottom: 10px;
        }

        .header-faq h1 {
            color: #57585c;
            text-align: center;
        }

        /* 매거진 제목 영역 끝 */

        /* 각 매거진 사진 영역 시작 */
        .outer-container {
            text-align: center;
            /* 중앙 정렬을 위한 텍스트 정렬 */
            position: relative;
            /* 검색 폼을 절대 위치로 정렬하기 위해 상대 위치 지정 */
            margin-bottom: 80px;
        }

        .container-custom {
            display: inline-block;
        }

        .row-custom-product-list {
            display: flex;
            /* flexbox를 사용하여 자식 요소들을 정렬 */
            flex-wrap: wrap;
            /* 여러 줄로 감싸기 */
            justify-content: flex-start;
            /* 자식 요소들을 왼쪽 정렬 */
            width: 1350px;
            /* 부모 요소의 너비를 100%로 설정 */
            margin: 0 auto;
            /* 부모 요소를 중앙에 배치 */
            margin-left: 4%;
        }

        .row-custom {
            width: 100%;
            overflow: hidden;
        }

        .card-custom {
            width: 29.5%;
            box-sizing: border-box;
            margin: 1.5%;
            display: flex;
            flex-direction: column;
            cursor: pointer;
        }

        .card {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            border-radius: 20px !important;
            overflow: hidden;
            height: 100%;
            border: none;
            border: 2px solid lightgray;
        }

        .card-footer {
            text-align: left;
            background-color: white;
            padding-left: 10px;
        }

        .fixed-img {
            width: 100%;
            height: 200px; 
            object-fit: cover;
        }

        .rounded {
            border-radius: 10px;
        }

        .drug-name {
            font-weight: bold;
        }

        .drug-dose {
            white-space: nowrap;
            /* 텍스트 줄바꿈 방지 */
        }

        .drug-detail {
            font-weight: bold; 
            color: gray;
        } 

        .drug-price {
            font-weight: bold;
            text-align: left;
        }
        /* 매거진 영역 끝 */

        /* 페이징버튼 영역 시작 */
        .paging-btns button {
            border: none;
            background-color: #f0f0f0;
            color: #202020;
            padding: 10px 15px;
            margin: 0 5px;
            cursor: pointer;
            border-radius: 10px;
            margin-right: 6%;
            border: 1px solid rgb(82, 166, 121);
        }

        .paging-btns button:hover {
            background-color: rgb(198, 228, 212);
        }

        .paging-area button.active {
            background-color: rgb(198, 228, 212);
            color: #202020;
            cursor: default;
        }

        .paging-area button.active:hover {
            background-color: rgb(198, 228, 212);
            color: #202020;
        }

        .paging-btns>button {
            background-color: rgb(249, 246, 246);
        }

        .paging-area {
            text-align: center;
            display: flex;
            justify-content: center;
            /* 페이지 버튼을 가운데 정렬 */
            align-items: center;
            margin-top: 20px;
            /* 푸터 위로 나오게 적절한 여백 추가 */
        }

        .paging-btns {
            display: flex;
            justify-content: center;
            /* 페이지 버튼을 가운데 정렬 */
        }

        .paging-btns button {
            font-size: 105%;
            font-weight: 600;
        }

        /* 페이징버튼 끝 */
        /* 메인컨텐츠 영역 끝 */
    </style>
</head>
   
      
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	  <div class="parent">
        <div class="parent-content">

            <div class="header-faq">
                <h1>MAGAZINE</h1>
            </div>
				
				
            <div class="outer-container">
                <div class="container-custom">
                    <div class="row-custom-product-list">

                        <c:forEach var="ma" items="${requestScope.mlist }">
                            <div class="card-custom">
                                <div class="card">
                                    <img class="fixed-img rounded" src="${ma.magazinePath}" alt="Product Image">

                                    <div class="card-footer">
                                        <table class="drug-info">
                                            <tr>
                                                <td>
                                                    <h6 class="drug-name" style="font-weight: bold;">
                                                        ${ma.magazineTitle} &nbsp; &nbsp;
                                                    </h6>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <small class="drug-detail" style="font-weight: bold; color: gray;">
                                                        ${ma.magazineCreate}
                                                    </small>
                                                </td>
                                                <td>
                                                    <small class="drug-detail" style="font-weight: bold; color: gray;" align="right">
                                                        조회수 : ${ma.magazineCount}
                                                    </small>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>


            <!-- 페이징바가 보여질 부분 -->
          <div align="center" class="paging-area">
                            <div class="paging-btns">
                            	
                            	<c:choose>
                            	<c:when test="${ requestScope.mpi.currentPage eq 1 }">	
                                <button onclick="" class="disabled">&lt;</button>
                                </c:when>
                                <c:otherwise>
                                <button onclick="location.href=`maga.re?cpage=${ requestScope.mpi.currentPage - 1 }`">&lt;</button>
                                </c:otherwise>
                                </c:choose>
                                
                                <c:forEach var="mp" begin="${ requestScope.mpi.startPage }"
                                end="${ requestScope.mpi.endPage }"
                    		   step="1">
                    		   <c:choose>	
                    		   <c:when test="${ requestScope.mpi.currentPage ne mp }">
                    		   <button onclick="location.href='maga.re?cpage=${ mp }'">${ mp }</button>
                    		   </c:when>
                    		   <c:otherwise>
                    		   <button class="page-item active">${ mp }</button>
                    		   </c:otherwise>
                    		   </c:choose>
                    		    </c:forEach>
                    		    
                                <c:choose>
                                <c:when test="${ requestScope.mpi.currentPage eq requestScope.mpi.maxPage }">
                                <button onclick="" class="disabled">&gt;</button>
                                </c:when>
                                <c:otherwise>
                                 <button onclick="location.href=`maga.re?cpage=${ requestScope.mpi.currentPage + 1 }`">&gt;</button>
                                </c:otherwise>
                                </c:choose>
                            </div>
                        </div>      


        </div>
    </div>
	
	

	<jsp:include page="../common/footer.jsp" />
	
	
</body>
</html>