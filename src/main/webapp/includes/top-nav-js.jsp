<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--<%@ include file="/includes/modal-article-post.jsp"%>--%>
<%--<%@ include file="/includes/modal-article-post-js.jsp"%>--%>
<script type="text/javascript">
    <%--动态为 navbar 添加 active 属性--%>
	$(document).ready(function() {
		var navbarRef = $('#navbarRef').val();
		$("#navbar").find("li").removeClass();
		$("#" + navbarRef).addClass("active");
	});

	<%--写博客按钮响应事件--%>
	function writeArticle() {
		var user_id = $('#user_id').val();
		if (user_id.length > 0) { // if the user_id not null
            window.location.href = '<%=contextPath%>/writer'; // jump to writer page
        } else { // otherwise shows the login modal
			window.location.href = '<%=contextPath%>/users/login'; // jump to writer page
        }
	}
</script>