<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%-- 文章发表时间，分类 --%>
<div class="sub-article-meta">
    <span>发表于&nbsp;</span> <span class="sub-article-post-time"> ${article.createTimeStr}
</span> &nbsp;&nbsp;&nbsp; <span>分类于&nbsp;</span> <span
        class="sub-article-category-item">
        <a href="<%=contextPath%>/articles/category/${article.category.id}">${article.category.name}</a>
		&nbsp;&nbsp;&nbsp;
		<span><i class="glyphicon glyphicon-eye-open"></i>&nbsp;&nbsp;${article.beViewdNum}次浏览</span>
		&nbsp;&nbsp;&nbsp;
		<span><i class="glyphicon glyphicon-tags"></i>
		&nbsp;
		<c:forEach var="tag" items="${article.tags}" varStatus="statusTag">
            &nbsp;<a href='<%=contextPath%>/archive/tag/${tag.id}' class="label label-info m-label-info">${tag.name}</a>
        </c:forEach>
            <!-- 		&nbsp;<a class="label label-info m-label-info">android studio</a> -->
		</span>
	</span>
    <%-- 用户登录后，才会显示编辑超链接 --%>
    <c:if test="${sessionScope.userid != null}">
		<span class="pull-right">
            <a href="#" data-toggle="modal" data-target="#modal-delete" data-id="${article.id}">删除</a></span>
		<span class="pull-right m-pull-right">
            <a href="#" data-toggle="modal" data-target="#modal-edit" data-id="${article.id}">编辑</a></span>
    </c:if>
</div>