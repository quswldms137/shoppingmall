<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	margin:0;
	padding:0;
}
header {
	margin:15px;
}
.header-right {
  float: right;
  margin-left:10px;
}
</style>
</head>
<body>
	<header>
			<a class="home_btn" href="/">Home</a>
			
			<a id="regBtn" class="header-right" href="registForm">회원가입</a>
			<a id="loginBtn" class="header-right" href="loginForm">로그인</a>
			
			<a id="logoutBtn" class="header-right" href="logout">로그아웃</a>
			<a href="cartList"><span id="cartBtn" class="header-right">🛒</span></a>
			
		 <c:choose>
            <c:when test="${sessionScope.username == 'admin'}">
                <a href="mypage"><span id="name" class="header-right"></span></a>
            </c:when>
            <c:otherwise>
                <a href="orderList"><span id="name" class="header-right"></span></a>
            </c:otherwise>
        </c:choose>
	</header>
	
	<script>
	
	const loginBtn = document.querySelector("#loginBtn");
	const regBtn = document.querySelector("#regBtn");
	const logoutBtn = document.querySelector("#logoutBtn");
	const cartBtn = document.querySelector("#cartBtn");
	const userName = document.querySelector("#name");
	
		if(${sessionScope.username eq null}){
			logoutBtn.style.display="none";
			cartBtn.style.display="none";
		}else{
			loginBtn.style.display="none";
			regBtn.style.display="none";
			logoutBtn.style.display="block";
			cartBtn.style.display="block";
			userName.innerHTML="${sessionScope.username} 님😀";
		}
	</script>
</body>
</html>