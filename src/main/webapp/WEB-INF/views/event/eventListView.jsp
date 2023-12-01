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
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>

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
					       
					        <input class="event" id="eventNo" name="eventNo" type="hidden"/>
					       	<input class="event" id="eventDate" name="eventDate" type="hidden"/>
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
							       	<div></div>
							       	<div></div>
							       	<div></div>
							       	<div></div>
							       	<div></div>
							       	<div></div>
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
		//console.log('현재데이터 내용 : ${list}'); // JAVA + JS는 좋지 않아요 ajax를 자바대신 쓰던지
		//DOMContentLoaded Event DOM Tree가 모두 로딩된 이후에 발생하는 이벤트
	document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });


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

		
