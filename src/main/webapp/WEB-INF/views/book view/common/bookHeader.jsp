<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
    <div class="main_image">
        <img src="https://www.shutterstock.com/ko/blog/wp-content/uploads/sites/17/2021/07/resize-images-banner.jpeg" width="100%" height="200px">
        <h1 class="main_image_text" style="font-size:50px">가운데에 글씨 쓰기</h1>
    </div>
</body>
</html>