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
	
	.info{
		width:1000px;
		height: 800px;
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
		width : 45%;
	}
	
	.midinfo{
		margin: auto;
		padding-top : 50px;
		width : 100%;
	}
	
	.botinfo {
		padding-top : 50px;
		text-align:center;
		width : 100%;
	}
	
	.botinfo > .tf{
		float:left;
		margin: auto;
		width: 50%;
	}
	
	.tm {
		color : black;
		font-weight : bold;
		margin-bottom: 40px;
		text-align:center;
	}
	
	#back-btn{
		float: right;
		margin-top: 10px;
		margin-right: 10px;
		color: #28a745;
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
		<div id="move-info" >
			<div class="info">  
			<button type="submit" class="btn btn-basic" id="back-btn"><i class="fas fa-reply fa-lg"></i></button>
				<h1>${name}</h1>
				<div class="floatleft">
					<div class="headinfo">
						<h3 class="temp tm">현재 기온</h3>
						<h3 class="temp" id="temp">${temp}<sup>o</sup>C</h3>
					</div>
					<div class="headinfo">
						<h3 class="temp tm">오늘 날씨</h3>
						<h3 class="temp" id="todaytemp">
							오전 | ${mintemp}<sup>o</sup>C 
							<span id="mintoday"></span>&nbsp;&nbsp;
							오후 | ${maxtemp}<sup>o</sup>C 
							<span id="maxtoday"></span>
						</h3>
					</div>
					
					<div class="botinfo">
						<h3 class="temp tm">대기 상태</h3><br>
						<h3 class="temp tf" id="todaypm10">
							미세먼지 | ${pm10}<sub>ppm</sub> 
							<span id="pmVal"></span>&nbsp;&nbsp;
						</h3>
						<h3 class="temp tf" id="todaykhai">
							통합대기 환경수치 | ${khai} 
							<span id="khaiVal"></span>
						</h3>
					</div>
					<div class="botinfo">
						<h3 class="temp tm"></h3><br>
						<h3 class="temp tf" id="todayo3">
							오존 농도 | ${o3}<sub>ppm</sub> 
							<span id="o3Val"></span>&nbsp;&nbsp;
						</h3>
						<h3 class="temp tf" id="todayno2">
							이산회질소 농도 | ${no2}<sub>ppm</sub> 
							<span id="no2Val"></span>
						</h3>
					</div>
					<div class="botinfo">
						<h3 class="temp tm"></h3><br>
						<h3 class="temp tf" id="todayso2">
							아황산가스 농도 | ${so2}<sub>ppm</sub> 
							<span id="so2Val"></span>&nbsp;&nbsp;
						</h3>
						<h3 class="temp tf" id="todayco">
							일산화탄소 농도 | ${co}<sub>ppm</sub> 
							<span id="coVal"></span>
						</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(function(){
		
		$('#back-btn').on('click', () => {
			location.href="move";
		})
		  const rainIconMap = {
		    1: '<i class="fas fa-cloud-rain" style="font-size:24px;"></i>',
		    3: '<i class="far fa-snowflake" style="font-size:24px;"></i>',
		    4: '<i class="fas fa-cloud-showers-heavy" style="font-size:24px;"></i>',
		  };

		  const iconMap = {
		    1: '<i class="far fa-sun" style="font-size:24px;"></i>',
		    3: '<i class="fas fa-cloud" style="font-size:24px;"></i>',
		    4: '<i class="fas fa-cloud" style="font-size:24px; font-weight:bold;"></i>',
		  };

		  const setRainIcon = (element, condition) => {
		    if (rainIconMap[condition]) {
		      $(element).html(rainIconMap[condition]);
		    }
		  };

		  const setWeatherIcon = (element, condition) => {
		    if (iconMap[condition]) {
		      $(element).html(iconMap[condition]);
		    }
		  };

		  console.log(${nigsky});

		  if (${morpty} == 1 || ${morpty} == 3 || ${morpty} == 4 ) {
		    setRainIcon('#mintoday', ${morpty});
		  } else {
			   if (${morsky} == 1 || ${morsky} == 3 || ${morsky} == 4) {
			    setWeatherIcon('#mintoday', ${morsky});
			  }
		  } 
		  
		  if(${nigpty} == 1 || ${nigpty} == 3 || ${nigpty} == 4) {
			  setRainIcon('#maxtoday', ${nigpty});
		  } else {
			  if(${nigsky} == 1 || ${nigsky} == 3 || ${nigsky} == 4){
				  setWeatherIcon('#maxtoday', ${nigsky});
			  }
		  }
		  
		  if(${pm10} <= 30) {
			  $('#pmVal').text('좋음');
			  $('#todaypm10').css('color', 'royalblue');
		  } else if(${pm10} <= 80){
			  $('#pmVal').text('보통');
			  $('#todaypm10').css('color', '#28a745');
		  } else if(${pm10} <= 150){
			  $('#pmVal').text('나쁨');
			  $('#todaypm10').css('color', 'gold');
		  } else if(${pm10} > 150){
			  $('#pmVal').text('매우나쁨');
			  $('#todaypm10').css('color', 'red');
		  } else {
			  $('#pmVal').text('점검중');
			  $('#todaypm10').css('color', 'lightgray');
		  }
		  
		  if(${o3} <= 0.0309) {
			  $('#o3Val').text('좋음');
			  $('#todayo3').css('color', 'royalblue');
		  } else if(${pm10} <= 0.0909){
			  $('#o3Val').text('보통');
			  $('#todayo3').css('color', '#28a745');
		  } else if(${pm10} <= 0.1509){
			  $('#o3Val').text('나쁨');
			  $('#todayo3').css('color', 'gold');
		  } else if(${pm10} > 0.1509){
			  $('#o3Val').text('매우나쁨');
			  $('#todayo3').css('color', 'red');
		  } else {
			  $('#o3Val').text('점검중');
			  $('#todayo3').css('color', 'lightgray');
		  }
		  
		  if(${khai} <= 50) {
			  $('#khaiVal').text('좋음');
			  $('#todaykhai').css('color', 'royalblue');
		  } else if(${khai} <= 100){
			  $('#khaiVal').text('보통');
			  $('#todaykhai').css('color', '#28a745');
		  } else if(${khai} <= 250){
			  $('#khaiVal').text('나쁨');
			  $('#todaykhai').css('color', 'gold');
		  } else if(${khai} > 250){
			  $('#khaiVal').text('매우나쁨');
			  $('#todaykhai').css('color', 'red');
		  } else {
			  $('#khaiVal').text('점검중');
			  $('#todaykhai').css('color', 'lightgray');
		  }
		  
		  if(${no2} <= 0.03) {
			  $('#no2Val').text('좋음');
			  $('#todayno2').css('color', 'royalblue');
		  } else if(${no2} <= 0.060){
			  $('#no2Val').text('보통');
			  $('#todayno2').css('color', '#28a745');
		  } else if(${no2} <= 0.2){
			  $('#no2Val').text('나쁨');
			  $('#todayno2').css('color', 'gold');
		  } else if(${no2} > 0.2){
			  $('#no2Val').text('매우나쁨');
			  $('#todayno2').css('color', 'red');
		  } else {
			  $('#no2Val').text('점검중');
			  $('#todayno2').css('color', 'lightgray');
		  }
		  
		  if(${co} <= 2) {
			  $('#coVal').text('좋음');
			  $('#todayco').css('color', 'royalblue');
		  } else if(${co} <= 9){
			  $('#coVal').text('보통');
			  $('#todayco').css('color', '#28a745');
		  } else if(${co} <= 15){
			  $('#coVal').text('나쁨');
			  $('#todayco').css('color', 'gold');
		  } else if(${co} > 15){
			  $('#coVal').text('매우나쁨');
			  $('#todayco').css('color', 'red');
		  } else {
			  $('#coVal').text('점검중');
			  $('#todayco').css('color', 'lightgray');
		  }
		  
		  if(${so2} <= 0.02) {
			  $('#so2Val').text('좋음');
			  $('#todayso2').css('color', 'royalblue');
		  } else if(${so2} <= 0.05){
			  $('#so2Val').text('보통');
			  $('#todayso2').css('color', '#28a745');
		  } else if(${so2} <= 0.15){
			  $('#so2Val').text('나쁨');
			  $('#todayso2').css('color', 'gold');
		  } else if(${so2} > 0.15){
			  $('#so2Val').text('매우나쁨');
			  $('#todayso2').css('color', 'red');
		  } else {
			  $('#so2Val').text('점검중');
			  $('#todayso2').css('color', 'lightgray');
		  }
		});


	</script>
	
</body>
</html>