<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/includes/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>

    <%@ include file="/includes/header.jsp" %>
    <link href="<%=contextPath%>/css/user-login-signup.css" rel="stylesheet">

</head>
<body>

<%-- 头部导航栏 --%>
<%@ include file="/includes/nav-top.jsp" %>
<div class="main">
    <input id="topNavType" type="hidden" value="${topNavType}">
    <div class="container">
        <ul class="nav nav-tabs m-nav-tabs">
            <li role="presentation" class="active"><a href="#">Home</a></li>
            <li role="presentation"><a href="#">Profile</a></li>
            <li role="presentation"><a href="#">Messages</a></li>
        </ul>
    </div>
    <%@ include file="/includes/footer.jsp" %>

</div>

<%@ include file="/includes/jquery-bootstrap-js.jsp" %>
<%@ include file="/includes/top-nav-js.jsp" %>
<%@ include file="/includes/datetimepicker-js.jsp" %>
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
</body>
</html>