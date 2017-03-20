<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/includes/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/includes/header.jsp"%>
<link href="<%=contextPath%>/css/sys-login-view.css" rel="stylesheet">
</head>
<body>

	<div class="main">
		<div class="container">
			<div class="sys-login-title">
				<h1>登录 Exception</h1>
			</div>
			<!-- 登录表单 -->
			<div class="sys-login-form">
				<form action="<%=contextPath%>/sys/login" method="post">
					<div class="form-group">
						<label for="username">用户名</label>
						<input class="form-control" placeholder="用户名" name="name">
					</div>
					<div class="form-group">
						<label for="password">密码</label> <input type="password"
							class="form-control" placeholder="密码" name="password">
					</div>
					<button type="submit" class="btn btn-success btn-block sys-login-btn">登录</button>
				</form>
			</div>

		</div>
		<%@ include file="/includes/footer.jsp"%>
	</div>
	<%@ include file="/includes/js.jsp"%>
</body>
</html>