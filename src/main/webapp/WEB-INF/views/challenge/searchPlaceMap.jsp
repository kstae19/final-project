<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 
 <!-- 카카오지도API 인증키 -->
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=427eb9b131f8088e7da32f842dbff655"></script>
<title>지도보기 결과</title>
</head>
<body>

	<div id="map" style="width:100%; height:350px;"></div>
	
	<script>
		let mapContainer = document.getElementById('map'),
			mapOption = {
				center : new kakao.maps.LatLng(${x}, ${y}), // 지도 중심좌표
				level : 4// 지도확대레벨
			};
		
		let map = new kakao.maps.Map(mapContainer, mapOption);//지도생성
		
		//마커이미지위한 변수들
		let imageSrc = 'https://mblogthumb-phinf.pstatic.net/MjAyMDA4MDZfMTY0/MDAxNTk2Njk2NDQyMDA4.drcC9tYNJUZM8aSelobQUS05iZGvDHRrCKevlwz-hesg.znD-na-O1sfqNIbl6Av5gOXNDNKadi7KORL7Y8fRhtAg.GIF.rlatjdgus195/2.gif?type=w800';
		let imageSize = new kakao.maps.Size(64,69);
		let imageOption = {offset : new kakao.maps.Point(27,69)};
		
		//마커이미지 생성
		let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		let markerPosition = new kakao.maps.LatLng(${x},${y});
	
		//마커생성
		let marker = new kakao.maps.Marker({
			position : markerPosition,
			image : markerImage
		});
		
		// 마커를 지도위에 표시하기
		marker.setMap(map);
		
	</script>




</body>
</html>