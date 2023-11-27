<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<style>
	#reviewForm{
		width : 800px;
		height : 300px;
		box-sizing : border-box;
		padding: 0px;
		margin:0px;
	}

	#review-pic{
		width:200px;
		height:170px;
		box-sizing : border-box;
		float:left;
	}
	#review-pic>img{
		width:99%;
		height : 99%;
		opacity:0.6;
	}
	#review-content{
		width:600px;
		height:180px;
		box-sizing : border-box;
		float:left;
	}
	#review-content>input{
		width :488px;
	}
</style>
</head>
<body>

<div id="reviewForm" class="modal">
	<h3>후기 작성하기</h3>
	<button data-dismiss="modal" class="close" type="button">X</button>
	<form action="insert.review" method="post" enctype="multipart/form-data">
		<div id="review-pic">
			<img src="resources/images/christmasChunsik.jpg">
		<input type="file" style="display:none;"/>
		</div>
		
		<div id="review-content">
			<select name="optionNo">
			<option>리뷰 작성할 상품 고르기</option>
			</select>
			<br>
			<input type="text" name = "reviewTitle" placeholder="제목을 입력하세요"/>
			<br>
			<textarea name="reviewContent" cols="70" rows="8">리뷰 내용을 작성하세요.</textarea>
		</div>
		<button type="submit">제출</button>
	</form>

</div>

</body>
</html>