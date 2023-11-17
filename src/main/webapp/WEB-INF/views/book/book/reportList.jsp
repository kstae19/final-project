<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>독후감 게시판 목록</title>
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

        /* 검색 form태그 */
        .search-form{
            float: right;
        }

        /* 게시글 목록 테이블 */
        #report-table{
            table-layout: fixed;
        }
        #report-table td{
            white-space:nowrap; 
            text-overflow:ellipsis; 
            overflow:hidden;
        }
    </style>
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	<jsp:include page="../common/bookHeader.jsp" />
	<jsp:include page="../common/bookLeftBanner.jsp" />
    
    <div class="outer">
        <div>
          <h3 style="display: inline-block;">독후감 게시판</h3>
          <form class="search-form" action="reportsearch.bk">
              <select name="reportcondition">
                  <option value="title">제목</option>
                  <option value="writer">작성자</option>
              </select>
              <input type="text" name="reportsearch">
              <button type="submit">검색</button>
          </form>
        </div>
        <hr>
        <button type="button">작성</button>
        <br><br>
        <table class="table table-bordered" id="report-table">
          <thead>
            <tr>
              <th style="width: 5%;">게시판번호</th>
              <th style="width: 10%;">별점</th>
              <th style="width: 45%;">제목</th>
              <th style="width: 10%;">작성자</th>
              <th style="width: 10%;">작성일</th>
              <th style="width: 10%;">조회수</th>
            </tr>
          </thead>
          <tbody>
          	<c:forEach items="${ list }" var="r">
          		<c:choose>
          			<c:when test="${ r.bookReportStar eq 0 }">
          				<tr  style="color:red;">
				          <td>${ r.bookReportNo }</td>
				          <td>공지</td>
				          <td>${ r.bookReportTitle }</td>
				          <td>${ r.userId }</td>
				          <td>${ r.bookReportDate }</td>
				          <td>${ r.bookReportCount }</td>
				        </tr>
          			</c:when>
          			<c:otherwise>
          				<tr>
				          <td>${ r.bookReportNo }</td>
				          <td>${ r.bookReportStar }</td>
				          <td>${ r.bookReportTitle }</td>
				          <td>${ r.userId }</td>
				          <td>${ r.bookReportDate }</td>
				          <td>${ r.bookReportCount }</td>
				        </tr>
          			</c:otherwise>
          		</c:choose>
          	</c:forEach>
          </tbody>
        </table>
          
        <c:choose>
			<c:when test="${ empty reportcondition }">
				<ul class="pagination justify-content-center">
		        	<c:choose>
			       		<c:when test="${ pi.currentPage eq 1 }">
			             	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
			       		</c:when>
			       		<c:otherwise>
			       		 	<li class="page-item"><a class="page-link" href="book?cPage=${ pi.currentPage - 1 }">Previous</a></li>
			       		</c:otherwise>
			       	</c:choose>
			           <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			           		<li class="page-item"><a class="page-link" href="book?cPage=${p}">${p}</a></li>
			           </c:forEach>
			           <c:choose>
			       		<c:when test="${ pi.currentPage eq pi.maxPage }">
			       			<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
			       		</c:when>
			       		<c:otherwise>
			       		 	<li class="page-item"><a class="page-link" href="book?cPage=${ pi.currentPage + 1 }">Next</a></li>
			       		</c:otherwise>
			       	</c:choose>
        		</ul>
			</c:when>
			<c:otherwise>
				<ul class="pagination justify-content-center">
		        	<c:choose>
			       		<c:when test="${ pi.currentPage eq 1 }">
			             	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
			       		</c:when>
			       		<c:otherwise>
			       		 	<li class="page-item"><a class="page-link" href="searchbook.bk?cPage=${ pi.currentPage - 1 }&searchBook=${searchBook}&selectBook=${selectBook}">Previous</a></li>
			       		</c:otherwise>
			       	</c:choose>
			           <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			           		<li class="page-item"><a class="page-link" href="searchbook.bk?cPage=${p}&searchBook=${searchBook}&selectBook=${selectBook}">${p}</a></li>
			           </c:forEach>
			           <c:choose>
			       		<c:when test="${ pi.currentPage eq pi.maxPage }">
			       			<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
			       		</c:when>
			       		<c:otherwise>
			       		 	<li class="page-item"><a class="page-link" href="searchbook.bk?cPage=${ pi.currentPage + 1 }&searchBook=${searchBook}&selectBook=${selectBook}">Next</a></li>
			       		</c:otherwise>
			       	</c:choose>
	        	</ul>
			</c:otherwise>
		</c:choose>
    </div>
</body>
</html>