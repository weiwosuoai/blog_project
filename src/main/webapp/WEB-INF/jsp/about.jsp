<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/includes/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/includes/header.jsp"%>
<link href="<%=contextPath%>/css/index.css" rel="stylesheet">
<link href="<%=contextPath%>/css/summernote.css" rel="stylesheet">
<link href="<%=contextPath%>/google-code-prettify/prettify.css"
	rel="stylesheet">

</head>
<body>

	<%-- 头部导航栏 --%>
	<%@ include file="/includes/nav-top.jsp"%>
	<div class="main">
		<input id="topNavType" type="hidden" value="${topNavType}">
		<div class="container">
			<strong>// TODO ...</strong>
		</div>
		<%@ include file="/includes/footer.jsp"%>

	</div>
	
	<%@ include file="/includes/jquery-bootstrap-js.jsp"%>
	<%@ include file="/includes/top-nav-js.jsp"%>

</body>
</html>