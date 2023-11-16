<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <title>도서상세</title>
    <style>
        /* 겉을 감싸는 div */
        .outer{
            margin: auto;
            width: 1200px;
            overflow:visible;
        }

        /* 그리드영역 */
        #bookform-grid{
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-template-rows: 100px 1fr;
        }
        #bookform-grid>img:nth-child(1){
            grid-column: 1 / 2;
	        grid-row: 1 / 3;
            height: 97%;
            width: 95%;
        }
        #bookform-grid>span:nth-child(2){
            grid-column: 2 / 3;
	        grid-row: 1 / 2;
        }
        #bookform-grid>table:nth-child(3){
            grid-column: 2 / 3;
	        grid-row: 2 / 3;
        }
        
        .bookmark{
        	content: url(http://localhost:8001/eco/resources/images/book/book-empty.png);
        }
        img[class$=abled]{
        	content: url(http://localhost:8001/eco/resources/images/book/book-full.png);
        }
    </style>
    <script>
    	function bookList(){
    		location.href="book";
    	}
    	
    	function bookmark(){
    		$.ajax({
    			url : 'bookmark.bk',
    			type : 'get',
    			data : {
    				className: $('.bookmark').attr('class')
    			},
    			success : result => {
    				console.log(result);
    			},
    			error : () => {
    				console.log("북마크 통신 실패");
    			}
    		})
    	}
    </script>
</head>
<body>
	
	<jsp:include page="../../common/header.jsp" />
	<jsp:include page="../common/bookHeader.jsp" />

    <div class="outer">
        <div>
            <button type="button" class="btn btn-secondary" onclick="bookList();">목록</button>
            <span>${ b.bookCategory }</span>
            <!-- 로그인유저처리 -->
            <span id="" style="float: right;">내 서재에 담기</span>
            <img class="bookmark" src="" style="height: 30px; width: 30px; float: right;" onclick="bookmark();">
        </div>
        <br>
        <div id="bookform-grid">
            <img src="${ b.bookImg }">
            <span style="font-size: 50px;">${ b.bookTitle }</span>
            <table class="table table-bordered">
                <tr>
                    <th>작가</th>
                    <td>${ b.bookWriter }</td>
                </tr>
                <tr>
                    <th>출판사</th>
                    <td>${ b.bookPublisher }</td>
                </tr>
                <tr>
                    <th>조회수</th>
                    <td>${ b.bookCount }</td>
                </tr>
                <tr>
                    <th>ISBN</th>
                    <td>${ b.ISBN13 }</td>
                </tr>
              </table>
        </div>
        <p>
            ${ b.bookContent }
        </p>

        <p><a href="${ b.bookLink }">알라딘 구매 링크</a></p>

        <hr>

        <div>
            <div>
                <span>한 줄 평</span>
                <span>123개</span>
                <button type="button" class="btn btn-secondary">삭제</button>
            </div>
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
                <input type="text" placeholder="다양한 생각을 남겨주세요" name="" style="height: 50px; width: 90%;">
                <button type="submit" style="height: 50px; width: 9%;">등록</button>
                <p>0/50</p>
            </form>
        </div>
    </div>
    <br>
</body>
</html>