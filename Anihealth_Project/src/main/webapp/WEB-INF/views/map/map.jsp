<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=b25f42243570baa281b34156c4e66644&libraries=services"></script>
<style>
	@font-face {
		font-family: 'WavvePADO-Regular';
		src:
			url('https://fastly.jsdelivr.net/gh/projectnoonnu/2404@1.0/WavvePADO-Regular.woff2')
			format('woff2');
	}
	
	* {
		font-family: 'WavvePADO-Regular';
		box-sizing: border-box;
	}
	
	.map-wrap {
		width: 1400px;
		height: 1000px;
		
	}
	
	.map-wrap {
		margin: auto;
		display: flex;
		justify-content: center;
		gap: 40px;
	}

	#map {
		width: 600px;
		height: 600px;
		border-radius: 20px;
		box-shadow: 0px 0px 15px rgba(92, 92, 92, 0.2);
		/*border: 1px solid black;*/
		position: relative;
		z-index: 1;
		margin-bottom: 20px;
	}
	
	#address {
		display: flex;
		width: 300px;
		height: 40px;
		border: 1px solid lightgray;
		border-radius: 10px
	}
	
	#address input {
		height: 100%;
		border: none;
		border-radius: 10px;
	}
	
	#address input:focus {
		outline: none;
		box-shadow: none;
	}
	#address button span{
		line-height: 1.3em;
	}
	
	#suggestions {
		/*border: 1px solid blue;*/
		width: 600px;
		height: 200px;
	}
	
	#map>button {
		position: absolute;
		bottom: 10px;
		left: 225px;
		width: 150px;
		border-radius: 20px;
		z-index: 2;
	}
	
	.map-content button {
		border-radius: 10px;
		padding-top: 5px;
		padding-bottom: 5px;
		background-color: #9ac5ab;
		background-color: rgba(47, 142, 219, 0.801);
		/*background-color: transparent;*/
		cursor: pointer;
		border: none;
		color: white;
	
	}
	
	.list-wrap {
		width: 400px;
	
	}
	.list-wrap {
		/*border: 1px solid red;*/
	}
	.list-content {
		width: 400px;
		height:90%;
		border: 1px solid lightgray;
		border-radius: 10px;
		overflow: scroll;
		overflow: auto;
	}
	
	.list-content::-webkit-scrollbar {
		width: 10px;
	}
	
	.list-content::-webkit-scrollbar-button {
		display: none !important;
	}
	
	.list-content::-webkit-scrollbar-thumb {
		background-color: lightgray;
		border-radius: 15px;
	}
	
	.list-item {
		width: 100%;
		border-bottom: 1px solid lightgray;
		padding: 10px
	}
	
	.list-item:hover {
		opacity: 80%;
	}
	
	.list-item>div {
		width: 100%;
		margin-bottom: 10px;
	}
	
	.list-item>div:nth-child(2) {
		font-weight: 100;
		color: rgb(73, 73, 73)
	}
	
	.list-item>div:nth-child(3) {
		font-weight: 100;
		color: rgb(73, 73, 73)
	}
	
	.list-item>div:nth-child(4) {
		font-weight: 100;
		color: rgb(73, 73, 73);
		margin-bottom: 0px;
	}
	#next-div-btn {
		padding-top: 20px;
		padding-bottom: 20px;
	}
	#next-div-btn:hover {
		cursor: pointer;
	}
	.list-content button {
		background-color: white;
		color: lightgray;
		border: none;
	}
	
	.name-category {
		display: flex;
		align-items: center;
		justify-content: center;
		gap: 10px;
	}
	
	.name-category>span {
		width: 50%;
	}
	
	.name-category>span:nth-child(1) {
		width: 50%;
		font-size: 19px;
	}
	
	.name-category>span:nth-child(2) {
		width: 50%;
		font-size: 12px;
		color: rgb(185, 184, 184);
	}
	
	.map-wrap a {
		text-decoration: none;
		color: rgba(47, 142, 219, 0.801) !important;
		/* #9ac5ab; */
	}
	
	.map-wrap table {
		font-weight: 100;
		font-size: 15px;
		color: rgb(128, 128, 128);
		border-collapse: separate;
		border-spacing: 3px;
	}
	#suggestions tr:hover {
		cursor: pointer;
		opacity: 80%;
	}
	#marker {
		width:230px;
		padding:5px;
		font-size:12px; 
		border: none;
	}
</style>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<br>
	<br>
	<div class="map-wrap">
		<div class="map-content">
			<div id="map" align="center">
				<button onclick="searchButton2();">현지도로 검색</button>
			</div>
			<div id="address" align="left">
				<button type="button" style="background-color: transparent;">
					<span class="material-symbols-outlined" onclick="searchButton();"
						style="color: black;">search</span>
				</button>
				<input onkeyup="suggest(this.value, event);" type="text" class="form-control" placeholder=""
					aria-label="Example text with button addon"
					aria-describedby="button-addon1">
			</div>
			<div id="suggestions" align="left">
				<table>
					<!-- 자동완성 -->
				</table>
			</div>
		</div>
		<!-- <div class="list-wrap"> -->
			<!-- <div class="list-button">
				<select>
					<option>
						거리순
					</option>
					<option>
						정확도
					</option>
				</select>
			</div> -->
		<div class="list-content">
	
			<!--  
				<div class="list-item">
					<div class="name-category">
						<span><a href="https://place.map.kakao.com/23120139" target='_blank'>플러스동물메디컬센터</a></span><span>가정,생활 > 반려동물 > 동물병원</span>
					</div>
					<div>02-3662-3533</div>
					<div>서울 영등포구 양평로12가길 14</div>
					<div>449m</div>
				</div>
				 -->
		</div>

		<!-- </div> -->
	</div>
	<br>
	<script>
		// 동적요소에 대한 이벤트 부여
		$(document).on("click", "#nextBtn", function () {
			if (pagination && pagination.hasNextPage) {
				$(this).remove(); // 버튼 생성전 기존 버튼 삭제
				pagination.nextPage();
			}
		})

		$(document).on("click", "#next-div-btn", function () {
			$("#nextBtn").click();
		});

		$(document).on("click", "#suggestions tr", function() {
			let str = $(this).children().eq(0).text();
			$("#address>input").val(str);
			$(this).parent().children().remove();
		});

		$("#address input").on("focus", function (event) {
			suggest(this.value, event);
		});


		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.534, 126.897), // 지도의 중심좌표
			level : 5, // 지도의 확대 레벨
			mapTypeId : kakao.maps.MapTypeId.ROADMAP
		// 지도종류
		};

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 뷰전환
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		//줌 컨트롤러 추가
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();
		// 상세정보창 객체 생성
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});
		// 화면에 출력할 리스트
		let mapList = '';
		// 마커배열
		var markers = [];
		// autocomplete 함수명 쓰면 오류남
		// 자동완성 함수
		function suggest(keyword, event) {
			geocoder.addressSearch(keyword, function(result, status) {
				
				if(event.keyCode == 13){
					$(".material-symbols-outlined").click();
				}

				if (status === kakao.maps.services.Status.OK) {
					let autoList = '';
					for (let i = 0; i < result.length; i++) {
						autoList += "<tr>" + "<td>" + result[i].address_name + "</td>" + "</tr>";
					}
					$("#suggestions>table").html(autoList);
				} else {
					$("#suggestions>table").html('');
				}
			});
		}

		// 키워드 검색
		function searchButton() {
			let address = $("#address>input").val();
			geocoder.addressSearch(address,
					function(result, status) {
						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {
							mapList = ''; // 검색할떄마다 리스트 비우기
							$("#suggestions>table").children().remove(); //자동완성 지우기
							hideMarkers();
							var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

							// 지도의 중심을 결과값으로 받은 위치로 이동
							map.panTo(coords);
							// 키워드로 장소를 검색합니다, 매개변수 location 추가
							//hideMarkers();
							ps.keywordSearch('동물병원', placesSearchCB, {location : coords, radius : 2000, size: 10, sort : kakao.maps.services.SortBy.DISTANCE}); //size : 5, page : 1	결과 최대 45개 지원
						}
					});
		}
		// 키워드 검색 (현위치)
		function searchButton2() {
			mapList = '';
			hideMarkers();
			var center = map.getCenter();
			ps.keywordSearch('동물병원', placesSearchCB, {location : center, radius : 2000, size: 10, sort : kakao.maps.services.SortBy.DISTANCE});
		}
		// data[i] 에 장소 정보 객체 저장
		function placesSearchCB(data, status, pagination) {
			window.pagination = pagination;
			if (status === kakao.maps.services.Status.OK) {

				for (var i = 0; i < data.length; i++) {

					displayMarker(data[i]);

		            mapList += "<div class='list-item'><div class='name-category'>" +
			                    "<span><a href='" + data[i].place_url + "' target='_blank'>" + data[i].place_name + "</a></span>" +
			                    "<span>" + data[i].category_name + "</span></div>" +
			                    "<div>" + data[i].phone + "</div>" +
			                    "<div>" + data[i].address_name + "</div>" +
			                    "<div>" + data[i].distance + "m</div></div>";			
				}
				//mapList += "<button id='nextBtn' type='button'>더보기..</button>";
				
				$(".list-content").html(mapList);
				if(data.length >=  10) {
					$(".list-content").append("<div align='center' id='next-div-btn'><button id='nextBtn' type='button'>더보기..</button></div>");
				}
			}

		}

		// 마커 삭제
		/*
		function hideMarkers() {
		    setMarkers(null);    
		}
		 */
		// 마커생성 && 지도 마커표기 함수
		function displayMarker(place) {
			// 마커를 생성 && 지도표기
			var marker = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(place.y, place.x)
			});
			markers.push(marker); // 마커배열에 마커 추가
			// 마커에 클릭이벤트를 등록
			kakao.maps.event.addListener(marker, 'click',function() {
								// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
								infowindow.setContent('<div id="marker">'
												+ '<a href=' + place.place_url + '>'+ place.place_name + '</a>'
												+ '<br>'
												+ place.phone
												+ '<br>'
												+ place.address_name
												+ '<br>' 
												+ place.distance + 'm </div>');
								infowindow.open(map, marker);
							});
			
			
		}
		// 이전 마커 삭제 함수
		function hideMarkers() {
			for (let i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
		}
	</script>


	<jsp:include page="../common/footer.jsp" />

</body>
</html>