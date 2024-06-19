<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

        /* 메인컨텐츠 영역 시작 */
        .parent {
            width: 100%;
            padding-top: 100px;
            padding-bottom: 80px;
        }

        .parent-content {
            width: 70%;
            margin: 0 auto;
        }

        .header-faq {
            padding-bottom: 20px;
            margin-bottom: 10px;
        }

        .header-faq h1 {
            color: #57585c;
            text-align: center;
        }

        .gray-line {
            border-bottom: 2px solid lightgray;
        }

        .info-bar {
            display: flex;
            justify-content: space-between;
            font-size: large;
        }

        .info-bar .left-info {
            text-align: left;
        }

        .info-bar .right-info {
            text-align: right;
        }

        .info-bar span {
            margin-right: 10px;
        }

        .info-bar .right-info span:last-child {
            margin-right: 0;
        }

        .content-table {
            max-width: 80%;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .content-table img {
              width:52em;
            /* max-width: 700px; */
            height: 450px; 
            display: block;
            margin: 0 auto;
        }
        .content-table p {
            white-space: pre-line;
            /* p태그에서 엔터 가능하게함 */
            text-align: left;
            font-size: 120%;
        }
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
        <div class="parent-content">
            <div class="header-faq">
                <h1>MAGAZINE</h1>
                <br> <br><br><br>
                <div class="info-bar">
                    <div class="left-info">
                        <span>No. ${ requestScope.m.magazineNo }</span>
                    </div>
                    <div class="right-info">
                        <span>${ requestScope.m.magazineCreate }</span>
                        <span>조회수 ${ requestScope.m.magazineCount }</span>
                    </div>
                </div>
                <div class="gray-line"></div> 
                <br>
                <h2 align="center">${ requestScope.m.magazineTitle }</h2>
                <br>
                <div class="gray-line"></div> 
            </div>
            <br>
			<c:forEach var="lm" items="${ requestScope.lm }">
            <div>
                <table class="content-table">
                    <tbody class="tbody1">
                        <tr>
                            <td>
                                <img src="${lm.magazinePath}" alt="${lm.magazinePath}">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p style="white-space: pre-wrap; height: 150px;">
                              	${lm.magazineContent }
                                </p>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </c:forEach>
            
                    <div class="btn-list-container" >
                        <div class="btn-list">
                            <button class="btn btn-lg"
                                        onclick="location.href='maga.re'">목록으로</button>
                        </div>
                    </div>
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>