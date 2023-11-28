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



   
  </head>
  <body>
  
  <jsp:include page="../common/header.jsp" />
  
 	<div id="wrapper">

		<!-- Modal -->
		
		<div class="modal fade" id="insertModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		 
				
				   <div class="modal-dialog">
				    <div class="modal-content">
				    
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">이벤트 등록하기</h5>
				      </div>
				      
				      <form id="insert-form" enctype="multipart/form-data" action="insert.ev" method="post">
				      	<div class="modal-body">

					       	<label for="eventTitle">이벤트명 : <input id="eventTitle" class="event" name="eventTitle" type="text" required/></label>
					        <label for="eventContent">이벤트 내용 : <input id="eventContent" class="event" name="eventContent" type="text" required/></label>
					        <label for="eventPlace">이벤트 장소 : <input id="eventPlace" class="event" name="eventPlace" type="text" required/></label>
					       
					       	<input class="event" id="eventDate" name="eventDate" type="hidden" value="23-11-11"/>
					       	<label for="upfile">첨부파일 : <input id="upfile" class="event" name="upfile" type="file" accept=".jpg, .jpeg, .png" required/></label>
				       		<label for="categoryNo">카테고리 : <input id="categoryNo" class="event" name="categoryNo" type="number" required/></label>

					      <div class="modal-footer">
					        <button type="submit" class="btn btn-primary">등록</button>
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					      </div>
					      
						</div><!-- body -->
					</form>
					
				</div>   <!-- content -->
			</div><!-- dialog -->
			
		</div><!-- insertModal -->
		
		<div id='calendar'></div>
		
</div><!-- wrapper -->


<script>

	//DOMContentLoaded Event DOM Tree가 모두 로딩된 이후에 발생하는 이벤트
	document.addEventListener('DOMContentLoaded', function() {
		//console.log('현재데이터 내용 : ${list}');
        var calendarEl = document.getElementById('calendar');
        
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
        
          editable : true,
          timeZone : 'local',
          
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
        	  },
        	  eventContent: { html: '<span>title</span>' }
        	  
         
          
        });//calendar정의
        
        
    	 // calendar렌더링
        calendar.render(); 
        
        // step1. 날짜 클릭이벤트 => 클릭한 값을 바로 insert.ev로 넘기기
        calendar.on('dateClick', function(info) {
        	
			$('#insertModal').modal('show');

        	
 			   // step2.등록 클릭이벤트
			    $('button[type=submit]').on('click', function(){
			    	
			    	console.log(info.dateStr);
			    	$('#eventDate').val(info.dateStr);
			    	
						
			    });//버튼 클릭이벤트 
			    
        });// 날짜클릭이벤트
        
	     
	   
    });// calendar생성    
            	

</script>


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

		
