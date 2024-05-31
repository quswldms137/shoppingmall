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

table {
	border-collapse: collapse;
}

th, td {
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
	<h2>(${sessionScope.username }_)장바구니 리스트</h2>
	<div class="container">
		<table border="1">
			<tr>
				<th>번호</th>
				<th>상품이름</th>
				<th>수량</th>
				<th>개당 가격</th>
				<th>총 가격</th>
				<th>저장</th>
				<th>주문</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="cart" items="${cart}" varStatus="stat">
			<form action="cartSave" method="post">
				<tr>
					<td>${stat.count }</td>
					<td>${cart.pname }</td>
					<td>
						<div class="quantity-input">
           				 	<input type="number" class="quantity" id="quantity-${cart.cno}" name="quantity" value="${cart.quantity }" min="1">
        				</div>
					</td>
					<td>${cart.price }</td>
					<td>${cart.price * cart.quantity }</td>
					<td>
						<input type="hidden" name="cno" value="${cart.cno }">
						<button type="submit">저장</button>
					</td>
					<td><a href="cartOrderDo?cno=${cart.cno }">주문</a></td>
					<td><a href="cartDelete?cno=${cart.cno }">삭제</a></td>
				</tr>
				</form>
			</c:forEach>
		</table>
	</div>
	</session>
	
<script>
function increaseQuantity(cno) {
    var quantityInput = document.getElementById("quantity-" + cno);
    var formQuantityInput = document.getElementById("form-quantity-" + cno);
    var quantity = parseInt(quantityInput.value);
    quantityInput.value = quantity + 1;
    formQuantityInput.value = quantity + 1;
}

function decreaseQuantity(cno) {
    var quantityInput = document.getElementById("quantity-" + cno);
    var formQuantityInput = document.getElementById("form-quantity-" + cno);
    var quantity = parseInt(quantityInput.value);
    if (quantity > 1) {
        quantityInput.value = quantity - 1;
        formQuantityInput.value = quantity - 1;
    }
}
</script>
</body>
</html>