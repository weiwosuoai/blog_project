<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/includes/modal-article-post.jsp"%>
<%@ include file="/includes/modal-article-post-js.jsp"%>
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
</script>