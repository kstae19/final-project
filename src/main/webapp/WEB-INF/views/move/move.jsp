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
	
	.info .temp{
		font-size: 25px;
		font-weight: bold;
		color: #28a745;
		margin-top: 20px;
		margin-left: 30px;
	}
	
	.info .more{
		float: right;
		margin-right: 30px;
		margin-top: 10px;
	}
	
	.more > a{
		text-decoration: none;
		color: black;
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
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d6ee5a80094907acaaed993806e68028"></script>
	
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
		
		<div id="move-info">
			
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
		
	    var areas = [];
	    
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
		    
			removeOverLay();
			createPolygon();
			
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
			
			removePolygon();
			createOverLay();
			createOverLay2();
			createOverLay3();
			
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
		});
		
		/* 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
		function setMapType(maptype) { 
		    var roadmapControl = document.getElementById('btnRoadmap');
		    var skyviewControl = document.getElementById('btnSkyview'); 
		    if (maptype === 'roadmap') {
		        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
		        roadmapControl.className = 'selected_btn';
		        skyviewControl.className = 'btn';
		    } else {
		        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
		        skyviewControl.className = 'selected_btn';
		        roadmapControl.className = 'btn';
		    }
		}
		*/
		
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
		        var content = '<div class="info">' + 
			                  '   <div class="title">' + area.name + '</div>' +
			                  '   <div class="floatleft">' +
			                  '		<div class="content">현재 기온  </div>' +
			                  '	  	<div class="temp">' + Math.floor(polygon.getArea()) + '<sup>o</sup>C</div>' + 
			                  '	  </div><br><br><br>' +
			                  '   <div class="floatleft">' +
			                  '		<div class="content">오늘 날씨  </div>' +
			                  '	  	<div class="temp">' + Math.floor(polygon.getArea()) + '<sup>o</sup>C</div>' + 
			                  '	  </div><br><br><br>' +
			                  '   <div class="floatleft">' +
			                  '		<div class="content">대기 상태  </div>' +
			                  '	  	<div class="temp">' + Math.floor(polygon.getArea()) + '<sup>o</sup>C</div>' + 
			                  '	  </div><br><br>' +
			                  '   <div class="more"> <a href="#">상세보기</a> </div><br><br>' +
			                  '</div>';
		
		        $('#move-info').html(content);
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
					
					for(let i in bicycles){
						bike = bicycles[i];
						// console.log(bike);
					    // 마커를 생성합니다
					    var overlayposition = new kakao.maps.LatLng(bike.stationLatitude, bike.stationLongitude),
					    	content = '<div class ="label" > '
									+ bike.parkingBikeTotCnt 	
									+ '</div>';
					    
						var customOverlay = new kakao.maps.CustomOverlay({
						    position: overlayposition,
						    content: content   
						});
						customOverlay.setMap(map);
					}
				},
				error : ()=> {
					
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
					
					for(let i in bicycles){
						bike = bicycles[i];
						// console.log(bike);
					    // 마커를 생성합니다
					    var overlayposition = new kakao.maps.LatLng(bike.stationLatitude, bike.stationLongitude),
					    	content = '<div class ="label" > '
									+ bike.parkingBikeTotCnt 	
									+ '</div>';
					    
						var customOverlay = new kakao.maps.CustomOverlay({
						    position: overlayposition,
						    content: content   
						});
						customOverlay.setMap(map);
					}
				},
				error : ()=> {
					
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
					
					for(let i in bicycles){
						bike = bicycles[i];
						// console.log(bike);
					    // 마커를 생성합니다
					    var overlayposition = new kakao.maps.LatLng(bike.stationLatitude, bike.stationLongitude),
					    	content = '<div class ="label" > '
									+ bike.parkingBikeTotCnt 	
									+ '</div>';
					    
						var customOverlay = new kakao.maps.CustomOverlay({
						    position: overlayposition,
						    content: content   
						});
						customOverlay.setMap(map);
					}
				},
				error : ()=> {
					
				}
			});
		}
		
		function removeOverLay() {
			$('.label').remove();
			$('.label').parent().remove();
			$('.label').parent().parent().remove();
		}
		
	});
	

	</script>
</body>
</html>