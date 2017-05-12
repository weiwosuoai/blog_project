<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--<%@ include file="/includes/modal-article-post.jsp"%>--%>
<%--<%@ include file="/includes/modal-article-post-js.jsp"%>--%>
<script type="text/javascript">
	$(document).ready(function() {
		var type = $('#topNavType').val();
		$("#navbar").find("li").removeClass();

		if (type == 0) {
			$("#index").addClass("active");
		} else if (type == 1) {
			$("#all").addClass("active");
		} else if (type == 2) {
			$("#java-web").addClass("active");
		} else if (type == 3) {
			$("#android").addClass("active");
		} else if (type == 4) {
			$("#about").addClass("active");
		}
	});

	<%--写博客按钮响应事件--%>
	function writeArticle() {
		var user_id = $('#user_id').val();
		if (user_id.length > 0) { // if the user_id not null
            window.location.href = '<%=contextPath%>/writer'; // jump to writer page
        } else { // otherwise shows the login modal
            $('#modal_login').click();
            // then pop-up a prompt box that prompts the user to login
            $.notify({
                // options
                icon: 'glyphicon glyphicon-warning-sign',
                message: '您还没有登录哦!',
            },{
                // settings
                type: "warning"
            });
        }
	}
</script>