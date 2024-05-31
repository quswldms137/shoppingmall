<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
td {
	padding: 15px; /* 셀 내부 패딩 설정 */
	text-align: center; /* 텍스트 가운데 정렬 */
}
</style>
</head>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<session>
	<hr>
	<h2>(${sessionScope.username }_)주문 리스트</h2>
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
			<c:forEach var="order" items="${order }" varStatus="stat">
				<tr>
					<td>${stat.count }</td>
					<td>${order.pname}</td>
					<td>${order.orderquantity }</td>
					<td>${order.price }</td>
					<td>${order.price * order.orderquantity }</td>
					<td><a href="orderDelete?ono=${order.ono }">주문취소</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</session>
</body>
</html>