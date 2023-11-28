<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
	div{
		/*border: 1px solid black;*/
		
	}
	
	#move-main {
		width : 1200px;
		height : 1000px;
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
	
	#move-info{
		margin-top: 50px;
	}
	
	.info{
		width:1000px;
		height: 200px;
		margin:auto;
		margin-top:20px;
		border: 2px solid #28a745;
		border-radius: 33px;
	}
	.info > h1 {
		text-align : center;
		margin-top : 40px;
	}
	
	.temp {
		color : #28a745;
		font-weight : bold;
	}
	
	.floatleft > div {
		float: left;
		text-align: center;
	}
	
	.headinfo {
		margin-left: 30px;
		padding-top : 20px;
		text-align:center;
		width : 100%;
	}
	
	.headinfo > h3{
		float: left;
		width: 50%;
	}
	
	.tm {
		color : black;
		font-weight : bold;
		margin-bottom: 40px;
		text-align:center;
	}
	
	#roadview {
		width:80%;
		height:500px;
		margin :auto;
		border : 2px solid #28a745;
	}
	
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div id="move-main">
		<div id="move-search">
			<input type="text" id="move-search-input">
			<button type="submit" class="btn btn-basic" id="search-btn"><i class="fas fa-search fa-lg"></i></button>
		</div>
		<div id="roadview"></div>
		<div id="move-info" >
			<div class="info">  
				<h1>${bikeName}</h1>
				<div class="headinfo">
					<h3 class="temp tm">잔여 따릉이수</h3>
					<h3 class="temp" id="temp">${bikeCnt} 대</h3>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e73308cfe55f562948dee9ae8bcd721e"></script>
	<script>
	$(function(){
		
		//console.log(${bikeLat});
		var roadviewContainer = $('#roadview')[0]; //로드뷰를 표시할 div
		var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
		var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
		var position = new kakao.maps.LatLng(${bikeLat}, ${bikeLng});
		
		// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
		roadviewClient.getNearestPanoId(position, 50, function(panoId) {
		    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
		});
		
	});
	</script>
	
</body>
</html>