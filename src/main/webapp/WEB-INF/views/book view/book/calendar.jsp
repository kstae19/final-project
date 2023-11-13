<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>독서기록캘린더</title>
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

        .outer>p{
            padding: 10px 10px 10px 10px;
        }
        .outer>img{
            display: block;
            margin: auto;
            height: 500px;
            width: 500px;
        }
        .outer>button{
            display: block;
            margin: auto;
        }
    </style>
</head>
<body>

    <div class="outer">
        <p style="background-color: lightgrey;">
            실제 달력, 디지털 스프레드시트, 전문 독서 앱 또는 이러한 도구의 조합을 선호하든 독서 달력을 만들고 사용하는 것은 독서 목표를 달성하고 독서 시간을 최대한 활용하는 효과적인 방법이 될 수 있습니다. 이는 독서 노력을 체계적으로 유지하고 동기를 부여하는 데 유용한 도구입니다.
        </p>
        <br>

        <img src="https://www.urbanbrush.net/web/wp-content/uploads/edd/2022/12/urbanbrush-20221214144619159434.jpg">
        <br>
        <button type="button" class="btn btn-secondary">마이페이지에서 작성하기</button>
    </div>
</body>
</html>