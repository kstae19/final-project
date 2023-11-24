<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
     <!-- css -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- javascript -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>

<!-- overal -->
<style>
    #wrapper{
		border : 1px solid teal;
        width: 1200px;
        height: 1000px; 
       margin: auto;
        background-color: white;
    }


    #content-area{

       border : 1px solid teal;
        height : 75%; 
        width : 100%;
    }

</style>


 	
 	
    

    <script>
    // DOMContentLoaded Event DOM Tree가 모두 로딩된 이후에 발생하는 이벤트
      document.addEventListener('DOMContentLoaded', function() {



	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
		
		          initialView: 'dayGridMonth',
		          
		          //expandRows: true, // 화면에 맞게 높이 재설정
		          //selectable: true,    // 영역 선택
		          editable: true,      // event(일정) 
		          //dayMaxEventRows: true,  // Row 높이보다 많으면 +숫자 more 링크 보임!
	          
	          
	          
				  events: [
				 		<c:if test="${ not empty list}">
							<c:forEach var="e" items="${list}">
								//console.log(${list});
								{ 
									id : ${e.eventNo},
									title: '${e.eventTitle}', // text는 ''로 감싸줌, 아니면 변수로 인식함
									//start: '${e.eventDate}',// Date는 Date(sql)인데 왜 ''로 감싸야할까
									
									 extendedProps: {
										 //content : ${e.eventContent},
										 place : '${e.eventPlace}',
										 participant : ${e.participants},
										 categoryNo : ${e.categoryNo},
									 },
									 imageurl : 'data:image/jpeg;base64,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'
								}, 
							</c:forEach>
						</c:if> 
					],
					
					 eventDidMount: function(info) {
						    console.log(info.event.imageurl);
							
					 },
					 
					 eventContent: function (arg) {
							console.log(arg);
				            var event = arg.event;
				            
				            var customHtml = '';
				            
				            customHtml += "<div class='r10 font-xxs font-bold' style='overflow: hidden;'>" + event.title + "</div>";
				            
				            customHtml += "<div class='r10 highlighted-badge font-xxs font-bold'>" + event.extendedProps.place +  "</div>";
				                        
				            customHtml += "<div class='r10 highlighted-badge font-xxs font-bold'>" + event.extendedProps.categoryNo +  "</div>";
				            
				            customHtml += "<img  style='width:100px; height : 100px;' src=" + event.imageurl +  "/>";
				            
				            return { html: customHtml }
				        }
				
					/* ver5부터 안 쓰임 
						eventRender: function(event, eventElement) {
						    if (event.imageurl) {
						        eventElement.find("div.fc-content").prepend("<img src='" + event.imageurl +"' width='10' height='10'>");
							}
						}*/

		  
			})// var calendar
			calendar.render();
	        
	        calendar.on('dateClick', function(info){
	        		console.log(info.dateStr);
	        })

     	})//DOMContentLoaded

    </script>
  </head>
  <body>
  
  <jsp:include page="../common/header.jsp" />
  
 	<div id="wrapper">
   		<div id='calendar'></div>
    
    
    
		<!-- Modal -->
		
		<div class="modal fade" id="insertModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <form enctype="multipart/form-data" id="eventEnrollForm" action="insert.ev" method="post">
				
				   <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">이벤트 등록하기</h5>
				      </div>
				      
				      <div class="modal-body">
				       	<input class="event" name="eventNo" type="hidden" />
				       	<input class="event" name="eventDate" type="hidden" value="${ startDate}"/>    
				       
				       	<label for="eventTitle">이벤트명 : <input id="eventTitle" class="event" name="eventTitle" type="text" required/></label>
				        <label for="eventContent">이벤트 내용 : <input id="eventContent" class="event" name="eventContent" type="text" required/></label>
				        <label for="eventPlace">이벤트 장소 : <input id="eventPlace" class="event" name="eventPlace" type="text" required/></label>
				       
				       	<label for="upfile">첨부파일 : <input id="upfile" class="event" name="upfile" type="file" required/></label>
				       	<label for="categoryNo">카테고리 : <input id="categoryNo" class="event" name="categoryNo" type="number" required/></label>
				      </div>
				      
				      <div class="modal-footer">
				        <button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="insertEvent();">등록</button>
				        <button type="button" class="btn btn-secondary" >취소</button>
				      </div>
				</div> 
				</div>    
				
		  </form> 
		</div>
		
</div><!-- wrapper -->
		<style>
		#insertModal{
			width: 50%;
			height :  50%;
			margin : auto;
			background-color : white;
		}
		#eventEnrollForm{
			
		}
		.modal-body{
			display : flex;
			flex-flow : column nowrap;
			/*align-items : center;*/
			justify-content : center;
		}
		.event{
		
		}
			
		</style>
    	<script>
    	/*
    	$(function(){
	        
				 //console.log(event);//undefined
				 //console.log(calendar); // Object
				 
				 // eventDate;를 할 거
					 // 1. 바보같은방법
					 //console.log($('#calendar').children().children().children().children().children().children().children().children().children().children().children().children().eq(8).children());
				
		   
		    	// 날짜 클릭시 insert모달창 뜸 : 클릭한 날짜 가리키는 요소 필요
				$('#calendar').click(function(e){ 
					
					// 2. 현명한 방법
					console.log(  $(e.target).parent().data('date').substring(2,10) );
				
					// 기본이벤트 막고 모달창 띄우기
					e.preventDefault();
					$('#insertModal').modal("show");
				}) // click이벤트
				
				function insertEvent(){
					// ajax로 데이터 넘기기
					$.ajax({
						url : 'enrollForm.ev',
						data : {
							// 날짜만 넘기기
							startDate : $(e.target).parent().data('date').substring(2,10)		
						},
						success : function(data){
							console.log('연결성공');
						},
						error : function(){
							console.log('연결실패');
						},
					})//ajax
		    		
		    	}
					
					
		
 		})//jQuery
		
		*/
	</script>

    
  </body>
</html>

		
