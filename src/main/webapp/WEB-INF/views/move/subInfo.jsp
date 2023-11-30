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
		height : 1500px;
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
		height: 1100px;
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
		padding-top : 20px;
		text-align: center;
		width : 100%;
	}
	
	.headinfo > h3{
		float: left;
		width: 50%;
	}
	
	.tm {
		color : black;
		font-weight : bold;
		margin-bottom: 15px;
		text-align:center;
	}
	
	#content{
		width: 100%;
	}
	
	.subTimeInfo {
		margin: auto;
		border: 2px solid #28a745;
		width: 50%;
		overflow: auto; 
		height: 300px;
		text-align: left;
		margin-bottom : 30px;
	}
	
	.subTimeInfo::-webkit-scrollbar {
	  	display: none;
	}
	
	#h3time {
		margin-top : 15px;
	}
	
	#content > div{
		float: left;
		width: 50%;
	}
	
	#ar-content{
		heigth: 20%;
	}
	#ar-content > div{
		heigth: 50%;
	}
	
	.arrivalInfo {
		width: 80%;
		border: 2px solid #28a745;
		margin-left: 100px;
		height: 150px;
		text-align: left;
		margin-bottom : 30px;
	}
	
	.ar{
		border: solid 10px #28a745; 
		margin: 60px 50px 60px 50px;
	}
	
	#floatleft > div {
		float: left;
	}
	
	.cir{
		width: 33px;
		border: solid 5px #28a745; 
		border-radius: 33px;
		background-color: #ffffff;
		position: relative;
	}
	
	#cir{
		left: 45px;
    	bottom: 87px;
	}
	
	.cirinfo{
		font-weight: bold;
		position: relative;
		left: 39px;
    	bottom: 85px;
	}
	
	#cirTop{
		left: 100px;
    	bottom: 87px;
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
				<h1>${subName}역 ${subLine}</h1>
				<h3 class="temp tm" id="h3time">열차 시간표</h3>
				<div class="headinfo">
					<h3 class="temp tm">상행선</h3>
					<h3 class="temp tm">하행선</h3>
					<div id="content">
						<div>
							<div class="subTimeInfo" id="subTimeInfo">
							
							</div>
						</div>
						<div>
							<div class="subTimeInfo" id="subTime2Info">
							
							</div>
						</div>
					</div>
				</div>
				<h3 class="temp tm" id="h3time">실시간 열차</h3>
				<div class="headinfo arr">
					<div id="ar-content">
						<h3 class="temp tm">상행선</h3>
						<div id="floatleft">
							<div class="arrivalInfo" id="arrivalTop">
								<hr class="ar">
								<div class="cir" id="cir">
									&nbsp;
								</div>
								<div>
									<h6 class="cirinfo">${subName}역</h6>
								</div>
							</div>
						</div><br><br><br><br><br><br><br><br>
						<h3 class="temp tm">하행선</h3>
						<div id="floatleft">
							<div class="arrivalInfo" id="arrivalBot">
								<hr class="ar">
								<div class="cir" id="cir">
									&nbsp;
								</div>
								<div>
									<h6 class="cirinfo">${subName}역</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			
			let today = new Date(); 
			let hours = today.getHours(); // 시
			let minutes = today.getMinutes();
			
			var arrivalTopList = [];
			var arrivalBotList = [];
			
			if(hours  < 10) {
				hours = '0' +  hours
			}
			if(minutes < 10) {
				minutes = '0' + minutes
			}
			
			let timeValue = hours +':'+ minutes;
			
			
			$.ajax({
				url : 'subcode',	
				data : {
					subName : '${subName}',
					subLine : '${subLine}'
				},
				success : result => {
					// console.log(result.SearchSTNBySubwayLineInfo.row[0].STATION_CD);
					subCode = result.SearchSTNBySubwayLineInfo.row[0].STATION_CD;
					if(subCode != null){
						$.ajax({
							url : 'subtime',	
							data : {
								subcode : subCode
							},
							success : data => {
								console.log(data.SearchSTNTimeTableByIDService.row)
								subtimerow = data.SearchSTNTimeTableByIDService.row;
								
								let value = '';
								for(let i in subtimerow){
									subtime = subtimerow[i];
									
									value += '<h5 class="fi" id="'+subtime.LEFTTIME.substr(0, 5)+'">'+ subtime.SUBWAYENAME + '행 ' + subtime.LEFTTIME.substr(0, 5) + '</h5>';
								}
								if(subtimerow != null){
									$.ajax({
										url : 'subtime2',
										async : true,
										data : {
											subcode : subCode
										},
										success : data => {
											console.log(data.SearchSTNTimeTableByIDService.row)
											subtimerow = data.SearchSTNTimeTableByIDService.row;
											
											let value = '';
											for(let i in subtimerow){
												subtime = subtimerow[i];
												
												value += '<h5 class="la" id="'+subtime.LEFTTIME.substr(0, 5)+'">'+subtime.SUBWAYENAME + '행 ' + subtime.LEFTTIME.substr(0, 5) + '</h5>';
											}
											$('#subTime2Info').html(value);
										}
									});
								}
								$('#subTimeInfo').html(value);
						    }
						});
					}
				}
			});
			
			$.ajax({
				url: 'subway',
				data: {
					sName : '${subName}'
				},
				success : data => {
					//console.log(data.realtimeArrivalList);
					arrival = data.realtimeArrivalList;
					sLine = '';
						
					switch('${subLine}') {
					
					case "1호선":
					case "경원선":
					case "경인선":
					case "경부선":
					case "장항선":
						sLine = 1001;
						break;
					case "2호선":
						sLine = 1002;
						break;
					case "3호선":
					case "일산선":
						sLine = 1003;
						break;
					case "4호선":
					case "안산선":
					case "과천선":
					case "진접선":
						sLine = 1004;
						break;
					case "5호선":
						sLine = 1005;
						break;
					case "6호선":
						sLine = 1006;
						break;
					case "7호선":
					case "7호선(인천)":
						sLine = 1007;
						break;
					case "8호선":
						sLine = 1008;
						break;
					case "9호선":
					case "9호선(연장)":
						sLine = 1009;
						break;
					case "경의중앙선":
					case "중앙선":
						sLine = 1063;
						break;
					case "공항철도1호선":
						sLine = 1065;
						break;
					case "경춘선":
						sLine = 1067;
						break;
					case "분당선":
						sLine = 1075;
						break;
					case "신분당선":
					case "신분당선(연장)":
					case "신분당선(연장2)":
						sLine = 1077;
						break;
					case "우이신설선":
						sLine = 1092;
						break;
					default:
						sLine = 0000;
						break;
					}
					
					let input = '';
					let arrivalTopresult = '';
					let arrivalBotresult = '';
					if(sLine == "0000"){
						input += '현재 실시간 지하철 정보를 지원하지 않는 역입니다.';
						$('.arr').html(input);
						$('#ar-content').css('display', 'hidden');
					} else {
						for(let i in arrival){
							arrivalData = arrival[i];
							if(arrivalData.subwayId == sLine){
								if(arrivalData.updnLine == "상행"){
									if(arrivalData.barvlDt != 0){
										arrivalTopresult += '<div class="cir" id="cirTop'+ i +'">&nbsp;'
														  + '</div>'
														  + '<div>'
														  + 	'<h6 class="cirinfo" id="cirinfoTop'+ i +'">'
														  +			arrivalData.bstatnNm + '행'
														  + 	'</h6>'
														  + 	'<h6 class="cirinfo" id="cirtimeTop'+ i +'">'
														  +			arrivalData.barvlDt + '초'
														  + 	'</h6>'
														  + '</div>';
														  
										  arrivalTopList.push(i, arrivalData.barvlDt);
									}
								} else {
									if(arrivalData.barvlDt != 0){
										arrivalBotresult += '<div class="cir" id="cirBot'+ i +'">&nbsp;'
														  + '</div>'
														  + '<div>'
														  + 	'<h6 class="cirinfo" id="cirinfoBot'+ i +'">'
														  +			arrivalData.bstatnNm + '행'
														  + 	'</h6>'
														  + 	'<h6 class="cirinfo" id="cirtimeBot'+ i +'">'
														  +			arrivalData.barvlDt + '초'
														  + 	'</h6>'
														  + '</div>'
									}
								}
								// arrivalData.barvlDt,  열차도착예정시간
								// arrivalData.bstatnNm, 종착지하철역명
								// arrivalData.updnLine, 상하행선구분
								// arrivalData.arvlMsg2,  첫번째도착메세지(도착, 출발 , 진입 등)
							}
						}
					}
					$('#arrivalTop').after(arrivalTopresult);
					$('#arrivalBot').after(arrivalBotresult);
					
					console.log(arrivalTopList);
					let countTop = $('[id^="cirTop"]').filter(function() {
					    return !isNaN(this.id.replace('cirTop', ''));
					}).length;
					
					let countBot = $('[id^="cirBot"]').filter(function() {
					    return !isNaN(this.id.replace('cirBot', ''));
					}).length;
					if(countTop == 1){
						$('#cirTop' + arrivalTopList[0]).css({'left': -700 + parseInt(arrivalTopList[1]) + 'px', 'bottom':'-55px'})
						$('#cirinfoTop' + arrivalTopList[0]).css({'left': -700 + parseInt(arrivalTopList[1]) +'px', 'bottom':'-100px'})
						$('#cirtimeTop' + arrivalTopList[0]).css({'left': -700 + parseInt(arrivalTopList[1]) +'px', 'bottom':'-100px'})
					} 
					else {
						$('#cirTop' + arrivalTopList[0]).css({'left': -700 + parseInt(arrivalTopList[1]) +'px', 'bottom':'-55px'})
						$('#cirTop' + arrivalTopList[2]).css({'left': -700 + parseInt(arrivalTopList[3]) +'px', 'bottom':'0px'})
						$('#cirinfoTop' + arrivalTopList[0]).css({'left': -700 + parseInt(arrivalTopList[1]) +'px', 'bottom':'-95px'})
						$('#cirinfoTop' + arrivalTopList[2]).css({'left': -700 + parseInt(arrivalTopList[3]) +'px', 'bottom':'-40px'})
						$('#cirtimeTop' + arrivalTopList[0]).css({'left': -700 + parseInt(arrivalTopList[1]) +'px', 'bottom':'-95px'})
						$('#cirtimeTop' + arrivalTopList[2]).css({'left': -700 + parseInt(arrivalTopList[3]) +'px', 'bottom':'-40px'})
					}
				}
			})
			
			
		});
	</script>
	
</body>
</html>