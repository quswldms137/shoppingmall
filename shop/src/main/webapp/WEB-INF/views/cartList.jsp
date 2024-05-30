<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container, h2 {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

h2 {
	padding: 10px;
}

table{
	border-collapse : collapse;
}
</style>
</head>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<session>
	<hr>
	<h2>장바구니 리스트</h2>
	<div class="container">
		<table border="1">
			<tr>
				<th>번호</th>
				<th>상품이름</th>
				<th>수량</th>
				<th>개당 가격</th>
				<th>총 가격</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="cart" items="${cart }">
				<tr>
					<td>${cart.cno }</td>
					<td>${cart.pname }</td>
					<td>${cart.quantity }</td>
					<td>${cart.price }</td>
					<td>${cart.price * cart.quantity }</td>
					<td><a href="cartDelete?cno=${cart.cno }">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</session>

</body>
</html>