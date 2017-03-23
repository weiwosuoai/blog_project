<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 文章发表时间，分类 -->
<div class="sub-article-meta">
	<span>发表于&nbsp;</span> <span class="sub-article-post-time"> <fmt:formatDate
			value="${article.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
	</span> <span>&nbsp;|&nbsp;</span> <span>分类于&nbsp;</span> <span
		class="sub-article-category-item"> <c:if
			test="${article.category == 1}">
			<a href="<%=contextPath%>/archive/java">Java</a>
		</c:if> <c:if test="${article.category == 2}">
			<a href="<%=contextPath%>/archive/android">Android</a>
		</c:if> <c:if test="${article.category == 3}">
			<a href="<%=contextPath%>/archive/db">DB</a>
		</c:if> <%-- 											<c:choose> --%> <%-- 												<c:when test="${article.category == 1} "> --%>
		<!-- 													<a href="#">Java</a> --> <%-- 												</c:when> --%>
		<%-- 												<c:when test="${article.category == 2} "> --%> <!-- 													<a href="#">Android</a> -->
		<%-- 												</c:when> --%> <%-- 												<c:otherwise> --%> <!-- 													<a href="#">DB</a> -->
		<%-- 												</c:otherwise> --%> <%-- 											</c:choose> --%>
	</span> <span class="pull-right"><a href="#">编辑</a></span>
</div>