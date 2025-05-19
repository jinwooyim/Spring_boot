<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>카드 결제</p>
	<form action="buy_ticket_card">
		고객 아이디 : <input type="text" name="consumerId">
		티켓 구매수 : <input type="text" name="amount">
		<input type="submit" value="구매">
	</form>
</body>
</html>
