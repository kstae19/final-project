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
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js"></script>

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

		<!-- insertModal -->
		<div class="modal fade" id="insertModal" data-backdrop="static" data-keyboard="false" tabindex="-2" aria-labelledby="staticBackdropLabel" aria-hidden="true">

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
					       
					        <input class="event" id="eventNo" name="eventNo" type="hidden" value=""/>
					       	<input class="event" id="eventDate" name="eventDate" type="hidden" value=""/>
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
		
		
		
		
		<!--detailModal -->
		<div class="modal fade" id="detailModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">

				   <div class="modal-dialog">
				    <div class="modal-content">
				    
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel"></h5>
				      </div>
				      
				      
				      	<div id="modal-body" class="modal-body">
						
					       	<div class="content">
							       	<div>이벤트명 : 	</div>
							       	<div>카테고리 : 	</div>
							       	<div>이벤트 내용 : 	</div>
							       	<div>이벤트 장소 : 	</div>
							       	<div>이벤트 날짜 : 	</div>
							       	<div>첨부파일 : 	</div>
					       	</div>
					       	
					       	<div class="content">
							       	<div>1${ e.eventTitle }</div>
							       	<div>2${ e.categoryNo }</div>
							       	<div>3${ e.eventContent }</div>
							       	<div>4${ e.eventPlace }</div>
							       	<div>5${ e.eventDate }</div>
							       	<div>6${ e.changeName }</div>
					       	</div>

						</div><!-- body -->
						
						<c:if test="${ loginUser.userNo == 1 }">
							 <div class="modal-footer">
						        <button type="submit" class="btn btn-primary">수정</button>
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">삭제</button>
						      </div>
					    </c:if>
					
				</div>   <!-- content -->
			</div><!-- dialog -->
			
		</div><!-- detailModal -->
		<div id="calendar"></div>
		
</div><!-- wrapper -->

<style>
	#modal-body{
		display : flex;
		justify-content : center;
		align-items : center;
	}

</style>

<script>

	//DOMContentLoaded Event DOM Tree가 모두 로딩된 이후에 발생하는 이벤트
	document.addEventListener('DOMContentLoaded', function() {
		//console.log('현재데이터 내용 : ${list}'); // JAVA + JS는 좋지 않아요 ajax를 자바대신 쓰던지
        var calendarEl = document.getElementById('calendar');
       
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          editable : true,
          timeZone : 'local',
          events: [
        	  <c:if test="${not empty list}">        	 
        	  <c:forEach var="e" items="${list}">
						{ 
							id :'${e.eventNo}',
							title: '${e.eventTitle}',
							start: '${e.eventDate}',
							imageurl : '${e.changeName}',
							extendedProps: {
							    place : '${e.eventPlace}',
							    category : '${e.categoryNo}'
							},
						}, 
				</c:forEach>
				</c:if>
			],
		
	/* 		 eventDidMount: function(info) {
				   // console.log(info.event.imageurl);
					
			 }, */
			 
			 eventContent: function (arg) {
					//console.log(arg);
		            var event = arg.event;
		            
		            var customHtml = '';
		            
		            customHtml += "<div class='r10 font-xxs font-bold' style='overflow: hidden;'>" + event.title + "</div>";
		            
		            customHtml += "<div class='r10 highlighted-badge font-xxs font-bold'>" + event.extendedProps.place +  "</div>";
		                        
		            customHtml += "<div class='r10 highlighted-badge font-xxs font-bold'>" + event.extendedProps.category +  "</div>";
		            //customHtml += "<img src='" + 'data:image/jpeg;base64,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' +  "'/>";

				
		           
		            return { html: customHtml }
		        }
		
         
          
        });//calendar정의
        
        
    	 // calendar렌더링
        calendar.render(); 
        
        // step1. 날짜 클릭이벤트 => 클릭한 값을 바로 insert.ev로 넘기기
        calendar.on('dateClick', function(info) {
        	
        	
			$(function(e){

		           if( $(e.target).find('.fc-event') ){
		            	$('#detailModal').modal('show');
	/* 	             	$.ajax({
		            		url : 'detail.ev',
		            		data : { eventNo : $('#eventNo').val() }.
		            		success : function(){
		            			console.log('하하');
		            		},
		            		error : function(){
		            			console.log('ㅠㅠ');
		            		}
		            	}) */
		            } else{
		            	$('#insertModal').modal('show');
		            }

       		})
			
			
			
        	
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
    	


    
  </body>
</html>

		
