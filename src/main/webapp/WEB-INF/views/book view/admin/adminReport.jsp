<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>독후감 게시판 신고</title>
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
    </style>
</head>
<body>

    <div class="outer">
        <h3>신고 게시글 목록</h3>
        <button type="button" class="btn btn-secondary">게시글삭제</button>
        <button type="button" class="btn btn-secondary">목록에서 삭제</button>
        <button type="button" class="btn btn-dark">블랙리스트 추가</button>
        <table class="table table-bordered">
            <thead>
              <tr>
                <th><input type="checkbox"></th>
                <th>게시판번호</th>
                <th>아이디</th>
                <th>제목</th>
                <th>작성일</th>
                <th>삭제여부</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><input type="checkbox"></td>
                <td>★★★★★ 제목</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
              </tr>
              <tr>
                <td><input type="checkbox"></td>
                <td>★★★★★ 제목</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
              </tr>
              <tr>
                <td><input type="checkbox"></td>
                <td>★★★★★ 제목</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
                <td>john@example.com</td>
              </tr>
            </tbody>
          </table>
          <ul class="pagination justify-content-center">
            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
          </ul>
          <br><br>

          <h3>댓글 목록</h3>
          <button type="button" class="btn btn-secondary">댓글삭제</button>
          <button type="button" class="btn btn-dark">블랙리스트 추가</button>
          <table class="table table-bordered">
            <thead>
              <tr>
                <th><input type="checkbox"></th>
                <th>작성일</th>
                <th>작성자</th>
                <th>댓글</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><input type="checkbox"></td>
                <td>댓글</td>
                <td>댓글</td>
                <td>댓글</td>
              </tr>
              <tr>
                <td><input type="checkbox"></td>
                <td>댓글</td>
                <td>댓글</td>
                <td>댓글</td>
              </tr>
              <tr>
                <td><input type="checkbox"></td>
                <td>댓글</td>
                <td>댓글</td>
                <td>댓글</td>
              </tr>
            </tbody>
          </table>
          <ul class="pagination justify-content-center">
            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
          </ul>
    </div>

</body>
</html>