<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
      .header-background {

            width: 100%;
            height: 750px;
            background-image: url(resources/img/maincat.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            padding: 1px;
            position: relative;        
        }

        .header-background video {
            width: 100%;
            height: 100%;
            object-fit: fill;
            

        }


        .header-btn {
            width: 22%;
            height: 26%;
            bottom: 230px;
            /* 바닥으로 부터 0px 떨어진 위치 */
            right: 0;
            /* 오른쪽으로부터 0px 떨어진 위치 */
            margin-right: 50px;
            padding-bottom: 1px;
            position: absolute;
            border-radius: 10px;
        }

        .header-btn h2,
        .header-btn h1,
        .header-btn h4,
        .header-btn button {
            margin-left: 23px;
            /* 왼쪽 여백 추가 */
            margin-top: 10px;
            margin-bottom: 10px;
            /* 아래쪽 여백 추가 */
            color: white;
        }


        .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .left, .right {
            flex: 1;
            margin: 10px;
        }

        .info p, .right p {
            margin: 5px 0;
        }


       .table-container {
            width: 80%;
            margin: 0 auto;
        }

        .content-table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            margin-top: 20px;
            margin-bottom: 30px;
        }

        .content-table td {
            padding: 20px;
            vertical-align: top;
            text-align: center;
        }

        .content-table h3 {
            text-align: left;
            white-space: nowrap; /* 줄 바꿈 없이 한 줄로 유지 */
            font-weight: bold;
            color: rgb(88, 86, 86);
        }

        .content-image {
            width: 100%;
            height: 120%;
            max-width: none;
            margin-top: 10px;
            border-radius: 10px;
            cursor: pointer;
            object-fit: cover; /* 이미지 비율을 유지하면서 크기 조정 */
        }


        .slide-container {
            width: 80%;
            margin: 0 auto;
            text-align: center;
        }

        .slide-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-bottom: 40px;
        }

        .slide-table td {
        text-align: center;
        height: 300px; /* 부모 요소의 높이를 설정 */
       }

        .slide-table h3{
            text-align: left;
            white-space: nowrap; /* 줄 바꿈 없이 한 줄로 유지 */
            margin: 11px;
            font-weight: bold;
            color: rgb(88, 86, 86);
        }

        .slide-image {
            width: 100%; 
            height: 80%;
            cursor: pointer;
            object-fit: cover; /* 이미지 비율을 유지하면서 크기 조정 */
            border: 1px solid rgb(141, 174, 157);
        }

        .review-title{
            width: 100%;
            text-align: center;
            margin: 20px;
            margin-bottom: 30px;
           
        }

        .review-title h3{
            font-weight: bold;
            color:  rgb(118, 158, 138);
        }

        .review-container {
            width: 100%;
            display: flex;
            justify-content: center;
            background-color: rgb(228, 236, 232);
        }

        .review-table {
            width: 80%;
            border-collapse: collapse;
            text-align: center;
            margin-top: 40px;
            margin-bottom: 40px;
        }

        .review-table td {
            padding: 10px;
        }

        .review-table img {
            width: 100%;
            height: auto;
            border-radius: 20px;
        }
        
         .hidden {
            opacity: 0;
        }
    </style>
    
</head>

<body>
	
	<jsp:include page="common/header.jsp" />

	<div class="parent" >
                <div class="header-background">
                    <div class="header-btn">
                        <h2>지켜주고픈 </h2>
                        <h1>반려동물의 건강</h1>
                        <h4>댕냥이 전용 맞춤 영양제</h4>
                        <button class="btn btn-lg"
                                style="background-color: rgb(153, 188, 133);">
                                건강 설문 조사하기
                        </button>
                    </div>
                </div>
                <br><br>
                <div class="table-container main-section hidden animate__animated animate__slower" data-animate="animate__fadeInLeft">
                    <table class="content-table">
                        <tr>
                            <td>
                            <h3>매거진</h3>
                            <a href="">
                                <img src="resources/img/cat111.png" alt="매거진 이미지" class="content-image">
                                </a>
                            </td>
                            <td>
                                <h3> 동물병원 찾기</h3>
                                <a href="">
                                <img src="resources/img/dog111.png" alt="동물병원 이미지" class="content-image">
                            </a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="slide-container  main-section hidden animate__animated animate__slower" data-animate="animate__fadeInRight">
                    <table class="slide-table">
                    	<tr>
                        <td>
                            <h3>BestPick!</h3>
                            <a href="">
                                <img src="resources/img/slide-img.png" alt=""  class="slide-image">
                            </a>
                        </td>
                        </tr>
                    </table>
                </div>
                <div class="review-title  main-section hidden animate__animated animate__slower" data-animate="animate__fadeInLeft">
                    <h3>ANIHEALTH 와 함께하는 고객 후기</h3>
                </div>
                <div class="review-container main-section hidden animate__animated animate__slower" data-animate="animate__fadeInUp">
                    <table class="review-table">
                        <tr>
                            <td>
                                <a href="">
                                    <img src="resources/img/review-img.png" alt="">
                                </a>
                            </td>
                            <td>
                                <a href="">
                                    <img src="resources/img/review-img.png" alt="">
                                </a>
                            </td>
                            <td>
                                <a href="">
                                    <img src="resources/img/review-img.png" alt="">
                                </a>
                            </td>
                            <td>
                                <a href="">
                                    <img src="resources/img/review-img.png" alt="">
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
    </div>
     
      <script>
        document.addEventListener('DOMContentLoaded', function() {
            const observerOptions = {
                threshold: 0.1
            };

            const observerCallback = (entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.remove('hidden');
                        entry.target.classList.add(entry.target.getAttribute('data-animate'));
                        observer.unobserve(entry.target);
                    }
                });
            };

            const observer = new IntersectionObserver(observerCallback, observerOptions);

            document.querySelectorAll('.main-section').forEach(elem => {
                observer.observe(elem);
            });
        });
    </script>
     
    <br><br><br>
    
    <jsp:include page="common/footer.jsp" />

</body>
</html>