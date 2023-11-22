<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
	
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
	
          initialView: 'dayGridMonth',
		  events: [
			  
			  title: 'BCH237',
		      start: '2019-08-12T10:30:00',
		      end: '2019-08-12T11:30:00',
		      extendedProps: {
		        department: 'BioChemistry'
		      },
		      description: 'Lecture'
			  
		/* 		<c:if test="${ not empty list}">
					<c:forEach var="e" items="${list}">
						{ 
							id : ${e.eventNo},
							title: ${e.eventTitle},
							start: new Date(),
							 extendedProps: {
								 //content : ${e.eventContent},
								 place : ${e.eventPlace},
								 //changeName : ${e.changeName}, // 사진
								 //participant : ${e.participants},
								 categoryNo : ${e.categoryNo}
							 }
						}
					</c:forEach>
				</c:if> */
			]
        });


	  calendar.render();
	})
    </script>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>

		
