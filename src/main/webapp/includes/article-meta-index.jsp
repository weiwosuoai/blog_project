<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%-- 文章发表时间，分类 --%>
<div class="sub-article-meta" style="margin-top: 5px;">
    <span><i class="glyphicon glyphicon-time"></i></span> <span class="sub-article-post-time"> ${article.createTimeStr}
</span> &nbsp;&nbsp;&nbsp;&nbsp; <span style="margin-right: 2px;"><i class="glyphicon glyphicon-th-list"></i></span> <span
        class="sub-article-category-item"> <c:choose>
    <c:when test="${article.category == 1}">
        <a href="<%=contextPath%>/archive/javaweb">Java</a>
    </c:when>
    <c:when test="${article.category == 2}">
        <a href="<%=contextPath%>/archive/android">Android</a>
    </c:when>
    <c:when test="${article.category == 3}">
        <a href="<%=contextPath%>/archive/db">DB</a>
    </c:when>
</c:choose>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span><i class="glyphicon glyphicon-eye-open" style="margin-right: 3px;"></i>${article.beViewdNum}次浏览</span>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span><i class="glyphicon glyphicon-tags"></i>
		<c:forEach var="tag" items="${article.tags}" varStatus="statusTag">
            <a href='<%=contextPath%>/archive/tag/${tag.id}' class="label label-info m-label-info" style="margin-left: 5px;">${tag.name}</a>
        </c:forEach>
            <!-- 		&nbsp;<a class="label label-info m-label-info">android studio</a> -->
		</span>
	</span>

</div>