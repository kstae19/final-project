<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제중입니다...</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<jsp:include page="../common/header.jsp"/>
<br><br>
<h1>
결제를 진행함니다.. 카카오 결제 에라모르겠다 릴리리랄라
<script>
	$(()=>{
		location.href='${pcUrl}';
	})
</script>

</h1>
</body>
</html>