<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>     
        div {
            box-sizing: border-box;
            /* border : 1px solid darkblue;  */
        }

        html,
        body {
            margin: 0;
            padding: 0;
        }

        /* 메인 영역 시작 */
        .parent {
            width: 100%;
            text-align: center;
            padding: 40px;
        }

        .parent-content {
            width: 100%;
            margin: 0 auto;
            /* 부모 요소의 가운데 정렬을 위해 auto 마진 추가 */
            text-align: left;
        }


        /* faq 제목 시작 */
        .header-faq {
            margin-left: auto;
            margin-right: auto;
            margin-top: 30px;
            margin-bottom: 70px;
        }

        .header-faq h1 {
            color: #57585c;
            text-align: center;
        }

        /* faq 제목 끝 */


        .cart-background {
            width:  70%;
            height: auto;
            margin: auto;
            padding:30px 30px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(59, 173, 110, 0.3);
            border-radius:10px;
            box-sizing: border-box;
            position: relative;
        }
        .cart-table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 10px;
        }

    
        .header-text {
            color: #696969;
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            text-align: center;
        }

        .cart-table th,
        .cart-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #63a07a;
        }

        .cart-table thead {
            background-color:#f4f8f1;
            color: #555;
            font-size: 130%;
        }
        .cart-table-content td {
            vertical-align: middle; 
            height: 110%;
            color: #333;
        }

        .cart-table-inner td{
            font-size: 110%;
        }

        .item-container {
            display: flex;
            align-items: center; 
            padding: 0px 10px; 
            flex-direction: row; 
        }

        #quantity-cell {
            padding-left: 0;
        }

        #title-iq{
           padding-left: 20px;
        }
         #checkout-button {
            display: block;
            box-sizing: border-box;
            width: auto;
            margin: 20px auto;
            padding: 10px 30px;
            margin-left: 80%;
            background-color: #99BC85;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        #checkout-button:hover {
		    background-color: #88a874;
		}
		.content h2{
             color: #57585c;
             text-align: center;
        }

      #btn-update{
            padding: 10px 50px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            background-color:#87cfb8;
            color: white;
            font-size: large;
        }
        #btn-delete{
            padding: 10px 50px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            background-color:#ec767e; 
            color: white;
            font-size: large;
        }
        /* 전체 내용 영역 끝 */
        /* 메인 영역 끝 */

    </style>

</head>
<body>

<jsp:include page="../common/header.jsp" />



  <div class="parent">
        <div class="parent-content">

            <div class="header-faq">
                <h1>1 : 1 문의</h1>
            </div>
            <br>

   

            <div class="cart-background">
                <button class="btn btn-lg right-button" id="checkout-button" onclick = "location.href = 'list.iq'" >목록으로</button>

                <table class="cart-table">
               
                    <thead>
                        <tr>    
                            <th class="cart-table-item" id="product-header">
                            	 ${ requestScope.iq.inquiryTitle }
                            </th>
                           
                             <th style="text-align: right;">
                             	${ requestScope.iq.inquiryCreate }
                             </th>

                            
                               <th style="text-align: right;">  
                                 <c:choose>
								    	<c:when test="${not empty requestScope.iq.inquiryAnswer }">
								    		답변 완료
								    	</c:when>
								    	<c:otherwise>
								    		답변 대기
								    	</c:otherwise>
							       </c:choose>    
							 </th>

                        </tr>
                    </thead>


                    <tbody class="cart-table-content">
                        
                        <tr class="cart-table-inner">
                            <td class="content-iq" colspan="3" style="font-size: large;">
                                <p style="height:150px;">
                                    ${ requestScope.iq.inquiryContent }
                                </p>
                            </td>  
                        </tr>   
                        
                    </tbody>
                </table>

		   <!-- 답변 내용이 있으면 답변 내용을 표시하는 조건문 -->
              <c:if test="${not empty requestScope.iq.inquiryAnswer }"> 
                <table class="cart-table">      
                    <thead>
                        <tr>    
                            <th class="cart-table-item" id="product-header">답변내용</th>
                           <td style="text-align: right;">${requestScope.iq.inquiryAnswerContent} 답변날짜</td>
                            
                        </tr>
                    </thead>

                    <tbody class="cart-table-content">
                        <tr class="cart-table-inner">
                            <td colspan="2" class="content-iq" style="font-size: large;">
                                <p style="height:150px;">
                                    ${ requestScope.iq.inquiryAnswer}
                                </p>
                            </td>
                        </tr>   
                    </tbody>
                </table>
           </c:if>  
             
            </div>
            
            <br><br>
            
            

                    
            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
                <!-- 
                    * 기존의 수정하기, 삭제하기 요청을 GET 방식으로 보냈었음!!
                    > 쿼리스트링을 조작하여 내가 쓴 게시글이 아니더라도 수정, 삭제가 가능해짐
                    > 수정하기, 삭제하기 요청을 POST 방식으로 보내면 해결 가능함
                -->
                <a class="btn btn-update" id="btn-update" onclick="postFormSubmit(1);">수정하기</a>
                <a class="btn btn-delete" id="btn-delete" onclick="postFormSubmit(2);">삭제하기</a>
            </div>
            <br><br>
            
            <form id="postForm" action="" method="post">
                <!-- 수정하기든, 삭제하기든 간에 글번호를 넘겨줘야함 -->
                <input type="hidden" name="ino" value="${ requestScope.iq.inquiryNo }"> 
            </form>
            
            <script>
                function postFormSubmit(num) {
                    
                    // console.log("호출됨", num);
                    
                    if(num == 1) { // 수정하기 클릭 시
                        
                        $("#postForm").attr("action", "updateForm.iq")
                                      .submit();
                        
                    } else { // 삭제하기 클릭 시
                        
                        $("#postForm").attr("action", "delete.iq")
                                      .submit();
                    }
                    // > form 요소를 선택 후 attr 메소드를 이용해서
                    //   action 속성을 각각 부여해준 후 submit 메소드로 요청 날리기
                }
            </script>
            



        </div>
    </div>


    <style>
	     @media (max-width: 950px) {
	    .cart-background {
	        width: 100%;
	        padding: 20px;
	    }
	
	    .cart-table-header {
	        flex-direction: column;
	        align-items: flex-start;
	    }
	
	    .left-header, .right-header {
	        margin-bottom: 10px;
	    }
	
	    .item-container {
	        flex-direction: column;
	        align-items: flex-start;
	    }
	
	    .item-text {
	        padding-left: 0;
	        margin-top: 10px;
	    }
	
	    .quantity-wrapper {
	        justify-content: space-between;
	        width: 100%;
		    }
		}
    </style>


	<jsp:include page="../common/footer.jsp" />


</body>
</html>