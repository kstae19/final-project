<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product Home</title>
<style>
	div{
		border : 1px solid orange;
		box-sizing:border-box;
		margin:0;
		padding : 0;
	}
	
	#content{
		width:1200px;
		height:1000px;
	}
	#searching-area{
		height:50px;
		width:400px;
		margin:auto;
	}
	#searching-area>input[type=text]{
		width:80%;
		border : 0;
	}
</style>
</head>
<body>
	<div id="content">
		<div id="searching-area">
		<input type="text" placeholder="검색어를 입력하세요.">
		</div>
	</div>
</body>  
</html>