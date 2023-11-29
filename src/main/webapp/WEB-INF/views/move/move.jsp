<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eco Map</title>
 <!-- css -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
	div{
		/*border: 1px solid black;*/
		
	}
	
	#move-main {
		width : 1200px;
		height : 1200px;
		margin: auto;
		background-color: #e3ffea;
	}
	
	#move-search {
		text-align:center;
		padding-top: 100px;
		padding-bottom: 40px;
	}
	
	#move-search-input{
		width: 700px;
		height : 40px;
		border: 2px solid #28a745;
		border-radius: 5px;
		margin-top: 10px;
	}
	
	#move-search-input:focus {
		outline: none;
		caret-color: #28a745;
		color: #28a745;
	}
	
	#search-btn {
		border: 2px solid #28a745;
		border-radius: 5px;
		margin-left: 5px;
		margin-bottom: 5px;
		padding: 6px 8px;
		background-color: #96f1ab;
	}
	
	.fas{
		color: #28a745;
	}
	
	.fa-plus, .fa-minus{
		margin-top: 11px;
		margin-right: 1px;
	}
	
	#move-map {
		position:relative;
		overflow:hidden;
	}
	
	#movemap {
		width:1000px; 
		height:600px; 
		border:2px solid #28a745;
		margin: auto;
	}
	
	.radius_border{
		border:1px solid #919191;border-radius:5px;
	} 
	    
	.custom_typecontrol {
		position:absolute;
		top:20px;
		right:115px;
		overflow:hidden;
		width:150px;
		height:50px;
		margin:0;
		padding:0;
		z-index:1;
		background-color:#f5f5f5;
	}
	
	.custom_typecontrol span {
		display:block;
		width:49px;
		height:50px;
		float:left;
		text-align:center;
		line-height:50px;
		cursor:pointer;
	}
	
	.custom_typecontrol span:first-child{
		border-right:1px solid #bfbfbf;
	}
	
	.custom_typecontrol span:last-child{
		border-left:1px solid #bfbfbf;
	}
	  
	.custom_zoomcontrol {
		position:absolute;
		top:90px;
		right:115px;
		width:40px;
		height:100px;
		overflow:hidden;
		z-index:1;
		background-color:#f5f5f5;
	} 
	
	.custom_zoomcontrol span {
		display:block;
		width:40px;
		height:49px;
		line-height:49px;
		text-align:center;
		cursor:pointer;
	}     
	
	.custom_zoomcontrol span:first-child{
		border-bottom:1px solid #bfbfbf;
	}  
	
	.info{
		width:1000px;
		margin:auto;
		margin-top:50px;
		border: 2px solid #28a745;
		border-radius: 33px;
	}
	
	.info .floatleft > div{
		float: left;
	}
	
	.info .title {
		font-size: 35px;
		margin-top: 10px;
		margin-left: 30px;
	}
	
	.info .content {
		font-size: 25px;
		margin-top: 20px;
		margin-left: 40px;
	}
	
	.temp, .today, .air{
		font-size: 25px;
		font-weight: bold;
		color: #28a745;
		margin-top: 20px;
		margin-left: 30px;
	}
	
	.today > div {
		float: left;
	}
	
	.more{
		float: right;
		margin-right: 20px;
		margin-top: 10px;
	}
	
	.more > a{
		text-decoration: none;
		color: black;
	}
	
	.more button, #bikeinfo > button{
		border: none;
		background-color: white;
	}
	
	#bikeinfo > button {
		margin-right: 3px;
		margin-bottom: 3px;
	}
	
	.label{
		width: 30px;
		height: 30px;
		background-color: #04a05a;
		border: 2px solid #28a745;
		border-radius: 33px;
		color: white;
		font-weight: bold;
		text-align: center;
	}
	
	#move-info{
		display : none;
	}
	
	
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e73308cfe55f562948dee9ae8bcd721e"></script>
	
	<div id="move-main">
		<div id="move-search">
			<input type="text" id="move-search-input">
			<button type="submit" class="btn btn-basic" id="search-btn"><i class="fas fa-search fa-lg"></i></button>
		</div>
		<div id="move-map">
			<div id="movemap"></div>
			<!-- 지도타입 컨트롤 div 입니다 -->
		    <div class="custom_typecontrol radius_border">
		        <span id="btnWeather"><i class='fas fa-cloud fa-lg'></i></span>
		        <span id="btnBicycle"><i class='fas fa-bicycle fa-lg'></i></span>
		        <span id="btnBus"><i class='fas fa-bus fa-lg'></i></span>
		    </div>
		    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
		    <div class="custom_zoomcontrol radius_border"> 
		        <span id="zoomIn"><i class='fas fa-plus fa-lg'></i></span>  
		        <span id="zoomOut"><i class='fas fa-minus fa-lg'></i></span>
    		</div>
		</div>
		
		<div id="move-info" >
			<div class="info">  
				 <div class="title"></div>
				 <div class="floatleft">
			     	<div class="content">현재 기온  </div>
   					<div class="temp">

					</div>
  				</div><br><br><br>
  				<div class="floatleft">
					<div class="content">오늘 날씨  </div>
					<div class="today">    						
						<div class="ltemp"> </div>
   						<div class="htemp"> </div>
					</div>
  				</div><br><br><br>
 				<div class="floatleft">
					<div class="content">대기 상태  </div>
  					<div class="air">

					</div><br><br>
 				</div>
 				<div class="more"> 
 					
 				</div><br><br>
			</div>
		</div>
	</div>
	
	<script>
	$(function(){
		var container = $('#movemap')[0];
		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.566826, 126.9820000), //지도의 중심좌표.
				level: 7 //지도의 레벨(확대, 축소 정도)
			};
		
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		var customOverlay = new kakao.maps.CustomOverlay({});
	    var infowindow = new kakao.maps.InfoWindow({removable: true});
	    
	    var place;
	    var local;
	    var today;
		
	    var areas = [];
	    var markers = [];
	    var infowindows = [];
	    
	    $.getJSON("resources/json/seoul.json", function(geojson) {
			var units = geojson.features; // 파일에서 key값이 "features"인 것의 value를 통으로 가져옴(이것은 여러지역에 대한 정보를 모두 담고있음)			
			$.each(units, function(index, unit) { // 1개 지역씩 꺼내서 사용함. val은 그 1개 지역에 대한 정보를 담음
				var coordinates = []; //좌표 저장할 배열
				var name = ''; // 지역 이름

				coordinates = unit.geometry.coordinates; // 1개 지역의 영역을 구성하는 도형의 모든 좌표 배열을 가져옴 
				name = unit.properties.SIG_KOR_NM; // 1개 지역의 이름을 가져옴

				var ob = new Object();
				ob.name = name;
				ob.path = [];

				$.each(coordinates[0], function(index, coordinate) { // []로 한번 더 감싸져 있어서 index 0번의 것을 꺼내야 배열을 접근가능.
					ob.path
							.push(new kakao.maps.LatLng(coordinate[1],
									coordinate[0]));
				});

				areas[index] = ob;
			});
		});
	    	
		$('#btnWeather').on('click', () => {
			map.setMinLevel(9);
			map.setMaxLevel(9);
			map.setLevel(9);
			$('#btnWeather').css("background-color", "#28a745");
			$('#btnWeather .fas').css("color", "#f5f5f5");
			$('#btnWeather').css("pointer-events", "none");
			
			$('#btnBicycle').css("background-color", "#f5f5f5");
			$('#btnBicycle .fas').css("color", "#28a745");
			$('#btnBicycle').css("pointer-events", "auto");
			
			$('#btnBus').css("background-color", "#f5f5f5");
			$('#btnBus .fas').css("color", "#28a745");
			$('#btnBus').css("pointer-events", "auto");
		    
			createPolygon();
			removeOverLay();
			removeInfowindow();
			//map.setDraggable(false);
		});
		
		$('#btnBicycle').on('click', () => {
			map.setMinLevel(2);
			map.setMaxLevel(6);
			map.setLevel(3);
			$('#btnBicycle').css("background-color", "#28a745");
			$('#btnBicycle .fas').css("color", "#f5f5f5");
			$('#btnBicycle').css("pointer-events", "none");
			
			$('#btnWeather').css("background-color", "#f5f5f5");
			$('#btnWeather .fas').css("color", "#28a745");
			$('#btnWeather').css("pointer-events", "auto");
			
			$('#btnBus').css("background-color", "#f5f5f5");
			$('#btnBus .fas').css("color", "#28a745");
			$('#btnBus').css("pointer-events", "auto");
			
			createOverLay();
			createOverLay2();
			createOverLay3();
			removePolygon();
			$('#move-info').css('display', 'none');
		});
		
		$('#btnBus').on('click', () => {
			map.setMinLevel(2);
			map.setMaxLevel(6);
			map.setLevel(4);
			$('#btnBus').css("background-color", "#28a745");
			$('#btnBus .fas').css("color", "#f5f5f5");
			$('#btnBus').css("pointer-events", "none");
			
			$('#btnWeather').css("background-color", "#f5f5f5");
			$('#btnWeather .fas').css("color", "#28a745");
			$('#btnWeather').css("pointer-events", "auto");
			
			$('#btnBicycle').css("background-color", "#f5f5f5");
			$('#btnBicycle .fas').css("color", "#28a745");
			$('#btnBicycle').css("pointer-events", "auto");
			
			removePolygon();
			removeOverLay();
			removeInfowindow();
			$('#move-info').css('display', 'none');
			createSubway();
		});
				
		// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
		$('#zoomIn').on('click', ()=> {
		    map.setLevel(map.getLevel() - 1);
		})
		
		// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
		$('#zoomOut').on('click', ()=> {
		    map.setLevel(map.getLevel() + 1);
		})
		
		// 다각형을 생상하고 이벤트를 등록하는 함수입니다
		
		function createPolygon(){
			for (var i = 0, len = areas.length; i < len; i++) {
			    $.displayArea(areas[i]);
			}
		}
		$.displayArea = function(area) {
			// 다각형을 생성합니다 
		    var polygon = new kakao.maps.Polygon({
		        map: map, // 다각형을 표시할 지도 객체
		        path: area.path,
		        name: area.name,
		        strokeWeight: 2,
		        strokeColor: '#004c80',
		        strokeOpacity: 0.6,
		        fillColor: '#fff',
		        fillOpacity: 0.5 
		    });
		
		    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
		    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
		    kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
		        polygon.setOptions({fillColor: '#09f'});
		
		        customOverlay.setPosition(mouseEvent.latLng); 
		        customOverlay.setMap(map);
		    });
		
		    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
		    kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
		        
		        customOverlay.setPosition(mouseEvent.latLng); 
		    });
		
		    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
		    // 커스텀 오버레이를 지도에서 제거합니다 
		    kakao.maps.event.addListener(polygon, 'mouseout', function() {
		        polygon.setOptions({fillColor: '#fff'});
		        customOverlay.setMap(null);
		    }); 
		
		    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
		    kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
		    	
		    	var ajax1 = $.ajax({
		    		url : 'air.mo',
		    		async: false, // 동기 처리
		    		success : data => {
		    			// console.log(data.response.body.items);
		    			const place = data.response.body.items;
		    			let moreresult = '';
		    			let title = '';
		    			let airresult = '';
		    			for(let i in place){
		    				air = place[i];
		    				if(air.stationName == area.name){
			    				$.ajax({
			    					url : 'temp.mo',
			    					data : {
			    						areaName : air.stationName
			    					},
			    					async: false, // 동기 처리
			    					success: result => {
			    						const local = result.response.body.items.item;
			    						//console.log(local);
			    						
			    						let tempresult = '';
			    						
			    						moreresult += '<form action="airInfo">'
			    						
			    						for(let i in local){
			    							temp = local[i];
			    							// console.log(temp.obsrValue);
			    							if(temp.category == 'T1H'){
					    						tempresult += temp.obsrValue + '<sup>o</sup>C';
					    						moreresult += '<input type="hidden" name="temp" value="' + temp.obsrValue +'"/>'
					    						$.ajax({
			    			    					url : 'today.mo',
			    			    					data : {
			    			    						areaName : air.stationName
			    			    					},
			    			    					async: false, // 동기 처리
			    			    					success: answer => {
			    			    						const today = answer.response.body.items.item;
			    			    						console.log(today);
			    			    						let todayLresult = '';
			    			    						let todayHresult = '';
			    			    						
			    			    						for(let i in today){
			    			    							todaytemp = today[i];
			    			    							// console.log(temp.obsrValue);
			    			    							if(todaytemp.category == 'TMN'){
			    			    								todayLresult += '최저 온도 | ' + todaytemp.fcstValue + '<sup>o</sup>C';
			    			    								moreresult += '<input type="hidden" name="mintemp" value="' + todaytemp.fcstValue +'"/>'
			    			    							}
			    			    							else if(todaytemp.category == 'TMX') {
		    			    									todayHresult += ' &nbsp;&nbsp;&nbsp;최고 온도 | ' + todaytemp.fcstValue + '<sup>o</sup>C';
		    			    									moreresult += '<input type="hidden" name="maxtemp" value="' + todaytemp.fcstValue +'"/>'
			    			    							}
			    			    							else if(todaytemp.category == 'SKY' && todaytemp.fcstTime == '0800'){
			    			    								moreresult += '<input type="hidden" name="morsky" value="' + todaytemp.fcstValue +'"/>'
			    			    							}
			    			    							else if(todaytemp.category == 'SKY' && todaytemp.fcstTime == '1800'){
			    			    								moreresult += '<input type="hidden" name="nigsky" value="' + todaytemp.fcstValue +'"/>'
			    			    							}
			    			    							else if(todaytemp.category == 'PTY' && todaytemp.fcstTime == '0800'){
			    			    								moreresult += '<input type="hidden" name="morpty" value="' + todaytemp.fcstValue +'"/>'
			    			    							}
			    			    							else if(todaytemp.category == 'PTY' && todaytemp.fcstTime == '1800'){
			    			    								moreresult += '<input type="hidden" name="nigpty" value="' + todaytemp.fcstValue +'"/>'
			    			    							}
			    			    						}
			    			    					$('#move-info .ltemp').html(todayLresult);
			    			    					$('#move-info .htemp').html(todayHresult);
			    			    					}
			    			    				});
			    							}
			    						}
			    					$('#move-info .temp').html(tempresult);
			    					}
			    				});
		    					title += air.stationName,
		    					airresult += '미세먼지 | ' + air.pm10Value 
					    	              + ' &nbsp;&nbsp;&nbsp;'
					    	              + '통합대기환경수치 | ' + air.khaiValue ;
		    					moreresult += '<input type="hidden" name="pm10" value="' + air.pm10Value +'"/>'
		    								+ '<input type="hidden" name="khai" value="' + air.khaiValue +'"/>'
		    								+ '<input type="hidden" name="co" value="' + air.coValue +'"/>'
		    								+ '<input type="hidden" name="no2" value="' + air.no2Value +'"/>'
		    								+ '<input type="hidden" name="o3" value="' + air.o3Value +'"/>'
		    								+ '<input type="hidden" name="so2" value="' + air.so2Value +'"/>'
		    								+ '<input type="hidden" name="name" value="' + air.stationName+'"/>'
			    			}
		    			}
		    			$('#move-info .title').html(title);
		    			$('#move-info .air').html(airresult);
				    	$('#move-info').css('display', 'block');
				    	moreresult += '<button>상세보기</button>'
				    				+ '</form> ';	
    					$('#move-info .more').html(moreresult);
		    		}
		    	});
		    });
		}
		
		function removePolygon() {
		    $('path').remove();
		}
		
		function createOverLay() {
			$.ajax({
				url : 'bicycle.mo',
				data : {pageNo : $('#pageNo').val()},
				success : data => {
					// console.log(data);
					const bicycles = data.rentBikeStatus.row;
					// console.log(bicycles);
					
				    var imageSrc = 'https://www.bikeseoul.com/img/icon_big1.png',
				    imageSize = new kakao.maps.Size(25, 28), // 마커이미지의 크기입니다
				    imageOption = {offset: new kakao.maps.Point(12, 15)};
				    var bikestation = '';
					
				    for (let i in bicycles) {
		                const bike = bicycles[i];
		                
		                const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		                const markerPosition = new kakao.maps.LatLng(bike.stationLatitude, bike.stationLongitude);
		                
		                const marker = new kakao.maps.Marker({
		                    position: markerPosition,
		                    image: markerImage
		                });
					    
				    	marker.setMap(map);
				    	
				    	markers.push(marker);
				    	
				    	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
						var iwContent = '<div style="width:220px; height:100%"> ' +
				    					'<div style="width:200px; height:100%"> '+bike.stationName + '<br>잔여 자전거 수 : ' +
				    					bike.parkingBikeTotCnt + '<br></div>' + 
										'<div style="text-align:right"> ' +
										'<form action="bikeinfo" id="bikeinfo">' +
										'	<button>상세보기</button>' +
										'	<input type="hidden" name="bikeLat" value="' + bike.stationLatitude + '"/>' +
										'	<input type="hidden" name="bikeLng" value="' + bike.stationLongitude + '"/>' +
										'	<input type="hidden" name="bikeName" value="' + bike.stationName + '"/>' +
										'	<input type="hidden" name="bikeCnt" value="' + bike.parkingBikeTotCnt + '"/>' +
										'</form></div></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

						// 인포윈도우를 생성합니다
						var infowindow = new kakao.maps.InfoWindow({
						    content : iwContent,
						    removable : iwRemoveable
						});
						    
						infowindows.push(infowindow);
						
						//마커 클릭하면 인포윈도우
						kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));
						
						//marker click event/
						function makeClickListener(map, marker, infowindow) {
							return function() {
								removeInfowindow();
								infowindow.open(map, marker);
							};
						}
					}
				}
			});
			
		}
		
		function createOverLay2() {
			$.ajax({
				url : 'bicycle2.mo',
				data : {pageNo : $('#pageNo').val()},
				success : data => {
					// console.log(data);
					const bicycles = data.rentBikeStatus.row;
					// console.log(bicycles);
					var imageSrc = 'https://www.bikeseoul.com/img/icon_big1.png',
					    imageSize = new kakao.maps.Size(25, 28), // 마커이미지의 크기입니다
					    imageOption = {offset: new kakao.maps.Point(12, 15)};
					
				    var bikestation= '';
					
				    for (let i in bicycles) {
		                const bike = bicycles[i];
		                
		                const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		                const markerPosition = new kakao.maps.LatLng(bike.stationLatitude, bike.stationLongitude);
		                
		                const marker = new kakao.maps.Marker({
		                    position: markerPosition,
		                    image: markerImage
		                });
					    
				    	marker.setMap(map);
				    	
				    	markers.push(marker);
				    	
				    	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
						var iwContent = '<div style="width:220px; height:100%"> ' +
				    					bike.stationName + '<br>잔여 자전거 수 : ' +
				    					bike.parkingBikeTotCnt + '<br>' + 
										'<div style="text-align:right"> ' +
										'<form action="bikeinfo" id="bikeinfo">' +
										'	<button>상세보기</button>' +
										'	<input type="hidden" name="bikeLat" value="' + bike.stationLatitude + '"/>' +
										'	<input type="hidden" name="bikeLng" value="' + bike.stationLongitude + '"/>' +
										'	<input type="hidden" name="bikeName" value="' + bike.stationName + '"/>' +
										'	<input type="hidden" name="bikeCnt" value="' + bike.parkingBikeTotCnt + '"/>' +
										'</form></div></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

						// 인포윈도우를 생성합니다
						var infowindow = new kakao.maps.InfoWindow({
						    content : iwContent,
						    removable : iwRemoveable
						});
						    
						infowindows.push(infowindow);
						    
						//마커 클릭하면 인포윈도우
						kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));

						//marker click event/
						function makeClickListener(map, marker, infowindow) {
							return function() {
								removeInfowindow();
								infowindow.open(map, marker);
							};
						}

					}
			    	
				}
			});
		}
		
		function createOverLay3() {
			$.ajax({
				url : 'bicycle3.mo',
				data : {pageNo : $('#pageNo').val()},
				success : data => {
					// console.log(data);
					const bicycles = data.rentBikeStatus.row;
					// console.log(bicycles);
					var imageSrc = 'https://www.bikeseoul.com/img/icon_big1.png',
				    imageSize = new kakao.maps.Size(25, 28), // 마커이미지의 크기입니다
				    imageOption = {offset: new kakao.maps.Point(12, 15)};
					
					var bikestation= '';
					
					for (let i in bicycles) {
		                const bike = bicycles[i];
		                
		                const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		                const markerPosition = new kakao.maps.LatLng(bike.stationLatitude, bike.stationLongitude);
		                
		                const marker = new kakao.maps.Marker({
		                    position: markerPosition,
		                    image: markerImage
		                });
					    
				    	marker.setMap(map);
				    	
				    	markers.push(marker);
				    	
				    	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
						var iwContent = '<div style="width:220px; height:100%"> ' +
				    					bike.stationName + '<br>잔여 자전거 수 : ' +
				    					bike.parkingBikeTotCnt + '<br>' + 
										'<div style="text-align:right"> ' +
										'<form action="bikeinfo" id="bikeinfo">' +
										'	<button>상세보기</button>' +
										'	<input type="hidden" name="bikeLat" value="' + bike.stationLatitude + '"/>' +
										'	<input type="hidden" name="bikeLng" value="' + bike.stationLongitude + '"/>' +
										'	<input type="hidden" name="bikeName" value="' + bike.stationName + '"/>' +
										'	<input type="hidden" name="bikeCnt" value="' + bike.parkingBikeTotCnt + '"/>' +
										'</form></div></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

						// 인포윈도우를 생성합니다
						var infowindow = new kakao.maps.InfoWindow({
						    content : iwContent,
						    removable : iwRemoveable
						});
						    
						infowindows.push(infowindow);
						    
						//마커 클릭하면 인포윈도우
						kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));
						//marker click event/
						function makeClickListener(map, marker, infowindow) {
							return function() {
								removeInfowindow();
								infowindow.open(map, marker);
							};
						}

					}
			    	
				}
			});
		}
		
		function createSubway() {
			$.ajax({
				url: 'subwayST',
				success: subStData => {
					var imageSrc = 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Taegeuk.svg/2048px-Taegeuk.svg.png',
					imageSize = new kakao.maps.Size(16, 18), // 마커이미지의 크기입니다
				    imageOption = {offset: new kakao.maps.Point(8, 10)};
					//console.log(subStData);
					for(let i in subStData){
						StData = subStData[i];
						// console.log(StData);
						
						const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		                const markerPosition = new kakao.maps.LatLng(StData.convY, StData.convX);
		                
		                const marker = new kakao.maps.Marker({
		                    position: markerPosition,
		                    image: markerImage
		                });
					    
				    	marker.setMap(map);
				    	
				    	// markers.push(marker);
					}
				}
			});
		}
		
		function removeOverLay() {
			for(let i = 0; i < Object.keys(markers).length; i++){
				markers[i].setMap(null);
			}
		}
		
		function removeInfowindow() {
			for(let i = 0; i < Object.keys(infowindows).length; i++){
				infowindows[i].close();
			}
		}
		
	});
	

	</script>
</body>
</html>