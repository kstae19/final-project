<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    <!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	<!-- Bootstrap theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>
    <style>
        .main_image {
          position: relative;
          margin-bottom: 10px;
        }
        .main_image_text {
          position: absolute;
          top: 50%;
          left: 50%;
          transform: translate( -50%, -100% );
          color: white;
        }
    </style>
</head>
<body>

	<c:if test="${ not empty successBookAlert }">
		<script>
			alertify.alert("성공", '${successBookAlert}', function(){alertify.success('띠용')});
		</script>
		<c:remove var="successBookAlert" scope="session"/>
	</c:if>
	<c:if test="${ not empty failBookAlert }">
		<script>
			alertify.alert("실패", '${failBookAlert}', function(){alertify.success('띠용')});
		</script>
		<c:remove var="failBookAlert" scope="session"/>
	</c:if>

    <div class="main_image">
        <img src="https://www.shutterstock.com/ko/blog/wp-content/uploads/sites/17/2021/07/resize-images-banner.jpeg" width="100%" height="200px">
        <h1 class="main_image_text" style="font-size:50px"><c:out value="${ middelLetter }" /></h1>
    </div>
    <br><br>
</body>
</html>