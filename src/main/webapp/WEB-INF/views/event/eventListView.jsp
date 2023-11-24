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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
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

	//DOMContentLoaded Event DOM Tree가 모두 로딩된 이후에 발생하는 이벤트
	document.addEventListener('DOMContentLoaded', function() {
		console.log('현재데이터 내용 : ${list}');
        var calendarEl = document.getElementById('calendar');
        
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          editable : true,
          
  		 <c:if test="not empty ${list}">
  		 	<c:forEach var="e" items="${list}">
  		 	
          events: [
        	    {
        	      id : ${e.eventNo},
        	      title : '${e.eventTitle}',
        	      start : '${e.eventDate}',
        	      extendedProps : {
        	      	place : '${e.eventPlace}',
        	      	participants : ${e.participants},
        	      	category : ${e.categoryNo}
        	      },
        	      imageurl : '${e.changeName}'
        	      
        	    }
        	    // more events ...
        	  ],
        	 </c:forEach>
  		 </c:if>
        	  eventDidMount: function(info) {
        	    console.log(info.event.extendedProps);
        	    // {description: "Lecture", department: "BioChemistry"}
        	  }
        	  
          //eventContent : 
          
        });//calendar정의
        
        
    	 // calendar렌더링
        calendar.render(); 
        
        // 날짜 클릭이벤트
        calendar.on('dateClick', function(info) {
        	
            new Promise( (succ, fail) => {
            	// eventDate를 넘기기 (ajax)
              	console.log(info.dateStr);
              	$.ajax({
              		
              		url : 'enrollForm.ev',
              		data : { startDate : info.dateStr},
              		success : function(data){
              			$('#insertModal').modal('show');
              		},
              		error : function(){
              			console.log('폼 연결 실패');
              		} 	
          
              	});//ajax
            }).then( (arg) => {
            
            	console.log('이제 등록해야지 : ' + arg);
      			$.ajax({
              		
              		url : 'insert.ev',
              		data : { 
              			eventNo : $('#eventNo').val(),
              			eventDate : info.dateStr,
              			eventTitle :  $('#eventTitle').val(),
              			eventContent :  $('#eventContent').val(),
              			eventPlace :  $('#eventPlace').val(),
              			changeName :  $('#upfile').val(),
              			categoryNo :  $('#categoryNo').val()
              		},
              		success : function(data){
              			console.log('등록 성공!!');
              		},
              		error : function(){
              			console.log('등록 실패!!');
              		}
            })//ajax

            })//then
            	
       
        	
        	
        });// 날짜클릭이벤트
        
      });// calendar생성

      

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
				        <button type="submit" class="btn btn-primary" data-dismiss="modal">등록</button>
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

		
