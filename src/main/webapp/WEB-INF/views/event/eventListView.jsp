<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {

        $(function () { // 페이지로드되면 실행됨
	            var request = $.ajax({
	                url: "event", // 변경하기
	                method: "GET",
	                dataType: "json"
	            });// request정의
	            
	            // request가 success되면
            	request.done(function (data) {// Get방식으로 데이터 요청한 값이 불러오기 완료되면(== Promise)
                	console.log(data);

	                    var calendarEl = document.getElementById('calendar');// 캘린더요소선택
	                    var calendar = new FullCalendar.Calendar(calendarEl, {// 캘린더 객체생성 후 Calendar()메서드 호출
			                    initialView: 'dayGridMonth',
			                    editable: true,
			                    droppable: true, // this allows things to be dropped onto the calendar
			                    drop: function (arg) {
			                        // is the "remove after drop" checkbox checked?
			                        if (document.getElementById('drop-remove').checked) {
			                            // if so, remove the element from the "Draggable Events" list
			                            arg.draggedEl.parentNode.removeChild(arg.draggedEl);
			                        }
			                    },//drop
			                    
			                 // data값이 events란 변수에 담김
			                    events: data 
	                     
	                    });
           		});//done
           		
           		
           		// date클릭시
           		    calendar.on('dateClick', function(info) {
	            	  console.log('clicked on ' + info.dateStr);
	            	});
           		
           		
           	// 캘린더렌더링	
            
        });// $(function)
		calendar.render();
    });
    </script>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html> -->
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
		  events: [
				{ title: 'Meeting', start: new Date() }
			]
        });
        calendar.render();
      });

    </script>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>

		
