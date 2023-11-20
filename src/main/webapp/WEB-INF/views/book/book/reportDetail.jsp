<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>독후감 게시판 상세조회</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <style>
        /* 겉을 감싸는 div */
        .outer{
            margin: auto;
            width: 1200px;
            overflow:visible;
        }

        .outer>button{
            float: right;
            margin-left: 10px;
        }
    </style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	<jsp:include page="../common/bookHeader.jsp" />
	<jsp:include page="../common/bookLeftBanner.jsp" />

    <div class="outer">
        <button type="button" class="btn btn-secondary" onclick="location.href='bookreport'">목록</button>
        <hr>

        <h3>
			 <c:forEach var="i" begin="1" end="${ br.bookReportStar }">
         		★
         	</c:forEach>
			${ br.bookReportTitle }
		</h3>
        <p style="margin-bottom: 0px;">${ br.userId }</p>
        <span>${ br.bookReportDate }</span>
        <c:if test="${ not empty sessionScope.loginUser }">
	        <button type="button" class="btn btn-dark" onclick="reportBlack();">신고하기</button>
	        <c:if test="${ loginUser.userId eq br.userId }">
		        <button type="button" class="btn btn-danger" onclick="reportDelete();">삭제</button>
		        <button type="button" class="btn btn-secondary" onclick="location.href='reportUpdate.bk?reportNo=${br.bookReportNo}'">수정</button>
	        </c:if>
        </c:if>
        <hr>

        <p>
        	${ br.bookReportContent }
        </p>
        <hr>

        <div>
            <div>
                <span>댓글</span>
                <span>123개</span>
                <button type="button" class="btn btn-secondary" style="float: right;">삭제</button>
            </div>
            <br>
            <div>
                <p style="margin-bottom: 0px;">아이디</p>
                <p style="margin-bottom: 0px;">작성날짜</p>
                <p>리뷰글행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도</p>
            </div>
            <ul class="pagination justify-content-center">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
            <form>
                <input type="text" placeholder="댓글을 남겨보세요" name="" style="height: 50px; width: 90%;">
                <button type="submit" class="btn btn-secondary" style="height: 50px; width: 9%;">등록</button>
                <p>0/50</p>
            </form>
        </div>




    </div>

</body>
</html>