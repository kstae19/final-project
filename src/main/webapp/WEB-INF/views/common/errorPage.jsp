<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Spring ErrorPage</title> 
</head>
<body>

    <jsp:include page="header.jsp"/>

    <br>
    <div align="center">
    	<br><br>
        <img src="https://cdn2.iconfinder.com/data/icons/oops-404-error/64/208_balloon-bubble-chat-conversation-sorry-speech-256.png">
        <br><br>
        <h1 style="font-weight:bold;">${ errorMsg }</h1>
    </div>
    <br>

</body>
</html>