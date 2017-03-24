<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/includes/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/includes/header.jsp"%>
<link href="<%=contextPath%>/css/archive.css" rel="stylesheet">

</head>
<body>

	<%-- 头部导航栏 --%>
	<%@ include file="/includes/nav-top.jsp"%>

	<div class="main">
		<div class="container">
			<input id="topNavType" type="hidden" value="${topNavType}">
			<!-- 面包屑导航 -->
			<ol class="breadcrumb m-breadcrumb">
				<li>共发表&nbsp;<span class="article-total-no">${fn:length(articles)}</span>&nbsp;篇博文
				</li>
				<!--   <li><a href="#">Library</a></li>
          <li class="active">Data</li> -->
			</ol>

			<div class="list-group m-list-group">
				<c:forEach var="article" items="${articles}">
					<button type="button" class="list-group-item">
						<a id="articel-title"
							href="<%=contextPath%>/article/${article.id}">${article.title}</a>
						<span class="article-date"><fmt:formatDate value="${article.createTime}"
								pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;&nbsp;</span>
					</button>
				</c:forEach>
			</div>

		</div>
		<%@ include file="/includes/footer.jsp"%>
	</div>

	<%@ include file="/includes/jquery-bootstrap-js.jsp"%>
	<%@ include file="/includes/top-nav-js.jsp"%>
</body>
</html>