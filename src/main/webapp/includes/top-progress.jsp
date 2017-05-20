<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="<%=contextPath%>/js/nprogress.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		// 顶部加载进度条
		NProgress.configure({
			showSpinner: false
		});
		NProgress.start();
	});
	// 页面内容全部加载完成后，设置进度条消失
	$(window).load(function () {
		NProgress.done()
	});
</script>