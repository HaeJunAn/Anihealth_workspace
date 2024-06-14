<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<style>
				* {
					box-sizing: border-box;
					color: #383838;
				}

				div {

				}

				.surveyResult-wrap {
					width: 1000px;
					margin: auto;
				}

				.surveyResult-wrap>div {
					width: 70%;
					margin: auto;
					margin-bottom: 20px;
					padding: 20px 12px;
					box-shadow: 0px 0px 7px rgba(26, 26, 26, 0.2);
					border-radius: 20px;
				}

				.surveyResult-wrap>div>section {
					width: 100%;
				}
				.outline >* {
					margin-bottom: 20px;
				}
				.outline-container {
					width: 80%;
					border: 1px solid #d3d3d3; 
					border-radius: 10px;
					overflow: hidden;
					
				}
				.outline table {
					width: 100%;
					border-style: hidden;
				}
				.th-img{
					border-right : 1px solid #d3d3d3;
				}
				.outline th{
					border-top : 1px solid #d3d3d3;
					text-align: center;
					font-size: 20px;
					font-weight: 900;
					background-color: #F3F2F8;
					/*text-shadow:0px 5px 20px gray;*/
					
				}
				.outline td  {
					border-top : 1px solid #d3d3d3;
					font-size: 20px;
					text-align: center;
					font-weight: 100;
				}
				.totalScore {
					font-size: 20px;
					padding-left: 30px;
					display: flex;
					align-items: center;
					justify-content: center;
				}
				.weight>section:nth-child(2){
					width: 100%;
					margin: auto;
					border: 1px solid #d3d3d3; 
					border-radius: 15px;
					overflow: hidden;
					
				}
				.weight table {
					width: 100%;
					text-align: center;
					background-color: #F3F2F8;
					border-style: hidden;
				}
				.weight {
					padding: 20px 20px!important;
					position: relative;
				}

				.weight th {
					border-color: #d3d3d3; 
					font-size: 25px;
				}

				.weight td {
					border-color: #d3d3d3; 
					text-align: center;
					line-height:1em;
				}

				.weight section:nth-child(1)>div {
					margin-bottom: 20px;
					border-radius: 15px;
					overflow: hidden;
				}
				.weight section:nth-child(1) img {
					display: inline-block;
					width: 20%;
				}

				.weight p {
					clear: both;
					padding: 15px;
					background-color: #F3F2F8;
					border: 1px solid #d3d3d3;
					border-radius: 15px;
					text-align: left;
					color: #383838;
					line-height: 1.7em;
				}
				.weight p > span{
					font-weight: 700;
				}
				.bcsInactive{
					/*transform: scale(1.1);*/
					opacity: 70%;
				}

				.weight .help {
					position: absolute;
					right: 30px;
					top: 23px;
					opacity: 60% ;
				}
				.weight .help:hover {
					opacity: 80%;
					cursor: pointer;
				}

				.weight #helpModal {
					position: absolute;
					width: 300px;
					height: auto;
					border-radius: 15px;
					box-shadow: 0px 0px 15px rgba(92, 92, 92, 0.2);
					top: 5px;
					left: 715px;
					border: none;
				}
				.modal-content {
					position: relative;
					border: none !important;
					padding: 10px;
				}
				#helpModal p {
					font-size: 15px;
					background: none;
					border: none;
					padding-bottom: 0px;
					color: #535353;
				}

				.effect-selected{
					text-align: center;
				}
				.effect-selected > * {
					margin-bottom: 20px;
				}
				.effect-selected>h3{
					margin-bottom: 40px;
				}

				.effect-selected img {
					width: 70px;
					
				}
				.effect-container {
					width: 80%;
					margin: auto;
					display: flex;
					justify-content: center;
					gap: 20px;
					margin-bottom: 15px;
					padding: 10px;
				}

				.effect-container>div:nth-child(1){
					display: flex;
					flex-wrap: wrap;
					flex-direction:column;
					align-items: center;
					justify-content: center;
					width: 15%;	
				}
				.effect-container>div:nth-child(2){
					width: 15%;
					display: flex;
					align-items: center;
					justify-content: center;
					gap: 3px;
				}
				.effect-container>div:nth-child(3){
					width: 70%;
					background-color: #F3F2F8;
					border-radius: 10px;
					text-align: left;
				}
				.effect-container>div:nth-child(1)>div:nth-child(1){
					width: 100%;
				}
				.effect-container>div:nth-child(3)>div{
					padding: 10px;
				}
				.effect-container>div:nth-child(3)>div:nth-child(1){
					font-size: 20px;
					font-weight: 900;
					
				}
				.effect-container>div:nth-child(3)>div:nth-child(2){
					color: #535353;
					line-height: 1.7em;
					
				}
				.effect-container>div:nth-child(3)>div:nth-child(2)>span{
					font-weight: 600;
				}
				
				.effect-total {
					display: flex;
					justify-content: space-evenly;
					margin-bottom: 50px;
				}
				.effect-total>div {
					display: flex;
					align-items: center;
				}
				/* 제품목록 */
				.product-selected form {
					width: 80%;
					margin: auto;
				}

				.product-selected input {
					float: left;
				}

				.product-selected img {
					width: 150px;
				}
				.product-selected h3 {
					text-align: center;
				}

				.product-selected table {
					width: 100%;	
					border-top : 1px solid #d3d3d3;		
				}
				.product-selected td{
					text-align: center;
					border-bottom : 1px solid #d3d3d3;
					font-size: 20px;
				}
				.product-selected h3 {
					margin-bottom: 20px;
				}
				.effect-icon img {
					width: 50px;
				}
				th, td {
					padding: 12px;
				}

				#loading {
					height: 800px;
					text-align: center;
					display: flex;
					flex-direction: column;
					align-items: center;
					gap: 40px;
					padding-top: 100px;
					background-color: #fafafa;
				}
				.progress {
					width: 500px;
					margin-bottom: 40px;
				}
				.product-selected button {
				border-radius: 10px;
                font-weight: 100;
                padding: 5px 10px;
                background-color: #9ac5ab;
                /*background-color: transparent;*/
                cursor: pointer;
                border: none;
                color: white;
                margin-top: 30px;
            	}
				.product-selected form {
					width: 100%;
				}
				.product-selected form:last-child {
					text-align: center;
				}
				
				


			</style>
			<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
		</head>

		<body>
			<jsp:include page="../common/header.jsp" />

			<main class="surveyResult-wrap" style="display: none;">
				<div class="outline" align="center">
					<!-- 종합결과 -->
					<h2>검진개요</h2>
					<div>24년 06월 13일</div>
					<div class="outline-container">
						<table>
							<tr height="30">
								<td rowspan="4" class="th-img"><img src="resources/simg/${breed}.png" style="width: 160px;"></td>
								<th>견종</th>
								<th>나이</th>
							</tr>
							<tr>
								<td>${breed}</td>
								<td>${age}</td>
							</tr>
							<tr>
								<th>건강점수</th>
								<th>체질량</th>
							</tr>
							<tr>
								<c:choose>
									<c:when test="${effectInfo.totalScore >= 80}">
										<td class="totalScore"><span>${effectInfo.totalScore}점</span><span class="material-symbols-outlined" style="color: lightgreen;">check</span></td>
									</c:when>
									<c:when test="${effectInfo.totalScore >= 40}">
										<td class="totalScore"><span>${effectInfo.totalScore}점</span><span class="material-symbols-outlined" style="color: yellow;">error</span></td>
									</c:when>
									<c:otherwise>
										<td class="totalScore"><span>${effectInfo.totalScore}점</span><span class="material-symbols-outlined" style="color: red;">warning</span></td>
									</c:otherwise>
								</c:choose>
								<td>
									${weightInfo.bcsStatus}
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="weight">
					<!-- 체중/bcs 정보 -->
					<section align="center">
						<!-- bcs -->
						<h3>BCS 지수</h3>
						<span class="material-symbols-outlined help">help</span>
						<div>
							<img src="resources/simg/bcs1_2.png"><img src="resources/simg/bcs2_2.png"><img src="resources/simg/bcs3_2.png"><img src="resources/simg/bcs4_2.png"><img src="resources/simg/bcs5_2.png">
						</div>
						<div id="helpModal" class="modal">
							<div class="modal-content">
								<span class="close" align="left" style="margin-left: 15px;">&times;</span>
								<h4>bcs 지수란?</h4>
								<p>BCS(신체충실지수)는 반려동물의 비만도를 측정하는 지표로서 
									미국동물병원협회(AAHA) 등 많은 전문 기관에서 사용하고 있습니다. 
									1단계에 가까울수록 저체중, 9단계에 가까울수록 과체중입니다.</p>
							</div>
						</div>
						<p>${bcsInfo}</p>
						<!-- 컨트롤러 내용정의 참조 -->
					</section>
					<section>
						<!-- 체중 -->
						<table border="1">
							<tr>
								<th width="200">
									현재 체중
								</th>
								<th width="200">
									표준 체중
								</th>
							</tr>
							<tr>
								<td>${weightInfo.weight} Kg</td>
								<!-- 입력값 참조 -->
								<td>${weightInfo.standardWeight} kg</td>
								<!-- 계산 -->
							</tr>
							<tr>
							<c:choose>
								<c:when test="${weightInfo.weightRatio >= 20}">
									<td colspan="2" style="color: rgb(250, 55, 55);">과체중: 표준체중의 ${weightInfo.weightRatio}%를 초과했습니다.</td>
							</c:when>

								<c:when test="${20 > weightInfo.weightRatio and weightInfo.weightRatio >= 10}">
									<td colspan="2" style="color: rgb(226, 192, 0);">표준범위: 표준체중보다 ${weightInfo.weightRatio}% 무겁습니다</td>
								</c:when>

								<c:when test="${10 > weightInfo.weightRatio and weightInfo.weightRatio > -10}">
									<td colspan="2">정상범위: 표준체중보다 ${weightInfo.weightRatio}% 무겁습니다</td>
								</c:when>

								<c:when test="${-10 >= weightInfo.weightRatio and weightInfo.weightRatio > -20}">
									<td colspan="2" style="color: rgb(226, 192, 0);">표준범위: 표준체중보다 ${weightInfo.weightRatio}% 무겁습니다</td>
								</c:when>

								<c:otherwise>
									<td colspan="2" style="color: rgb(250, 55, 55);">저체중: 표준체중보다 ${-weightInfo.weightRatio}% 부족합니다.</td>
								</c:otherwise>
							</c:choose>
								<!-- 프론트 내용정의, 30% 이상이면 빨간색, 15%이상이면 노란색 -->
							</tr>
							<tr>
								<c:choose>
									<c:when test="${weightInfo.calorieNeed > 0}">
										<td colspan="2"> 현재 강아지의 일일 표준 섭취량은 ${weightInfo.staRer} kcal 입니다. 현재 섭취량에서 약 ${weightInfo.calorieNeed} kcal 줄여주세요 </td>
									</c:when>
									<c:otherwise>
										<td colspan="2"> 현재 강아지의 일일 표준 섭취량은 ${weightInfo.staRer} kcal 입니다. 현재 섭취량에서 약 ${-weightInfo.calorieNeed} kcal 늘려주세요</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</table>
					</section>
				</div>
				<div class="effect-selected">
					<!-- 건강 세부 정보 -->
					<h3>건강 상세</h3>
					<div class="effect-total">
						<div><span class="material-symbols-outlined" style="color: red;">warning</span><span>경고 ${effectInfo.warning}개</span></div>
						<div><span class="material-symbols-outlined" style="color: yellow;">error</span><span>주의 ${effectInfo.caution}개</span></div>
						<div><span class="material-symbols-outlined" style="color: lightgreen;">check</span><span>양호 ${effectInfo.ideal}개</span></div>
						<!-- db 참조 -->
					</div>
					<h5 style="text-align: left; margin-left: 90px;">관리 필요 TOP5</h5>
					<!-- db 참조 -->
					<c:forEach var="s" items="${sList}" begin="0" end="4">
						<div class="effect-container">
							<div>
								<img src="resources/simg/${s.effectName}.png"><span>${s.effectName}</span>
							</div>
							<div>
								<c:choose>
									<c:when test="${((100-s.effectWeight*20) + 20) == 20}">
										<span>${(100-s.effectWeight*20) + 20}점</span> <span class="material-symbols-outlined" style="color: red;">warning</span>
									</c:when>
									<c:when test="${((100-s.effectWeight*20) + 20) <= 60}"> 
										<span>${(100-s.effectWeight*20) + 20}점</span> <span class="material-symbols-outlined" style="color: yellow;">error</span>
									</c:when>
									<c:otherwise>
										<span>${(100-s.effectWeight*20) + 20}점</span> <span class="material-symbols-outlined" style="color: lightgreen;">check</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div>
								<div>주요질환</div>
								<div>
									${s.disease}
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="product-selected">
					<!-- 추천 영양제 정보(5개)-->
					<form action="">
						<h3>추천제품</h3>
						<table>
							<c:forEach var="p" items="${pList}" varStatus="status">
									<tr>
										<td rowspan="2">
											<label for="item${status.index + 1}">
												<input type="checkbox" name="recommendedProduct"
													id="item${status.index + 1}" class="recommendedProduct"
													value="${p.productNo}">
											</label>
										</td>
										<td rowspan="2">
											<img src="resources/pimg/skin-hair.png">
											<!-- <img src="${p.productThumbnailPath}"> -->
										</td>
										<td>
											${p.productName}
										</td>
									</tr>
									<tr>
										<td id="effect-icon${p.productNo}" class="effect-icon">
										</td>
									</tr>
							</c:forEach>
						</table>
						<div><button type="submit">장바구니 담기</button></div>
					</form>
				</div>
			</main>
			<div id="loading">
				<h1>건강검진 진행중...</h1>
				<div class="progress">
                    <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0"
                        aria-valuemax="100"></div>
                </div>
				<div class="text-center">
					<div class="spinner-border" role="status">
					  <span class="visually-hidden"></span>
					</div>
				</div>
			</div>
			<br> <br>
			<jsp:include page="../common/footer.jsp" />
			<script>
				$(function () {
					// 로딩 화면
					/*
					let l = 0;
					for(let i = 0; i < 5; i++) {
						setTimeout(function(){
							l += 20;
							$(".progress-bar").width(l + "%");
						}, 600);
					}
					*/

					//$(".progress-bar").width("100%");
					// 로딩바
					$(".progress-bar").animate({
						width: "100%"
					}, 3500); 
					// 로딩 페이지
					setTimeout(function() {
						$("#loading").hide();
						$("main").show();
					}, 4000);

					

					$(".weight section").eq(0).find("img").each(function (index) {
						if(index != ${(weightInfo.bcsNo - 1) / 2}) {
							$(this).addClass("bcsInactive");
						} else {
							$(this).addClass("bcsActive");
						}
					});

					$(".help").on("click", function () {
						$("#helpModal").show();
					});
					$(".close").on("click", function(){ 
						$("#helpModal").hide();
					});

					// $(document).on("mouseenter", ".product-selected tr:odd", function () { 
					// 	$(this).css("opacity", "0.8");
					// 	$(this).prev().css("opacity", "0.8");
					// });

					// $(document).on("mouseleave", ".product-selected tr:odd", function () { 
					// 	$(this).css("opacity", "1");
					// 	$(this).prev().css("opacity", "1");
					// });

					// $(document).on("mouseenter", ".product-selected tr:even", function () { 
					// 	$(this).css("opacity", "0.8");
					// 	$(this).next().css("opacity", "0.8");
					// });

					// $(document).on("mouseleave", ".product-selected tr:even", function () { 
					// 	$(this).css("opacity", "1");
					// 	$(this).next().css("opacity", "1");
					// });

					// $(document).on("click", ".product-selected tr", function () { 
					// 	$(this).prop('checked', true);
					// });


		

					//$(".weight section").eq(0).find("img").eq(${(weightInfo.bcsNo - 1) / 2}).addClass("bcsActive");
					
					let productNoArr = [];
					//또는 element
					$(".recommendedProduct").each(function () {
						productNoArr.push($(this).val());
					});
					
					// 상품별 효과 아이콘
					$.ajax({
						url: "selectEffect.su",
						method: "get",
						data: { productNoArr: productNoArr },
						traditional: true, // 요청값이 배열일때
						success: function (eList) {
							console.log(eList);
							let effectStr = "<span> </span>";
							// 일반 for 가능
							eList.forEach(function (eMap) {
								eMap.effectArr.forEach(function (effect) {
									effectStr += "<img src='" + effect.effectFilePath + "'/>";
								});

								$("#effect-icon" + eMap.productNo).html(effectStr);
									effectStr = "<span> </span>";
							});
						},
						error: function () {
							console.log("효과 조회 실패!");
						}
					});
				});
			</script>
		</body>

		</html>