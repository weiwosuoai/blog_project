<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/includes/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>

    <%@ include file="/includes/header.jsp" %>
    <link href="<%=contextPath%>/css/validate/validate-head.css" rel="stylesheet">
    <link href="<%=contextPath%>/css/user.css" rel="stylesheet">

</head>
<body>

<%-- 头部导航栏 --%>
<%@ include file="/includes/nav-top.jsp" %>
<div class="main">
    <input id="topNavType" type="hidden" value="${topNavType}">
    <div class="container">
        <ul id="myTab" class="nav nav-tabs m-nav-tabs">
            <li>
                <a href="<%=contextPath%>/users/login">
                    登录
                </a>
            </li>
            <li class="active"><a href="<%=contextPath%>/users/signup">注册</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <%--描述--%>
            <div id="login-title-container">创建属于你的 exception 社区账号吧</div>
            <%--登录视图--%>
            <div id="login-form-container">
                <div class="login-with">
                    <a href="#">
                        <svg aria-hidden="true" class="octicon octicon-mark-github" height="32" version="1.1" viewBox="0 0 16 16" width="32"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"></path></svg>
                    </a>
                    <div class="or-container">
                        <hr class="or-hr">
                        <div id="or">使用 GitHub 注册 <br>或者</div>
                    </div>
                </div>
                <form id="form" action="<%=contextPath%>/users/signup" method="post">
                    <div class="form-group">
                        <label>昵称</label>
                        <input id="name" class="form-control m-form-control" placeholder="取一个专属于你个人的社区昵称吧"
                               name="name" style="font-size: 13px;">
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input id="email" type="email" class="form-control m-form-control" placeholder="you@example.com"
                               name="email">
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input id="password" type="password"
                               class="form-control m-form-control" placeholder="*******" name="password">
                    </div>

                    <button type="submit" class="btn btn-success login-btn">注&nbsp;册</button>
                </form>
            </div>

            <div class="login-footer">
                <span>已经有&nbsp;exception&nbsp;社区账号?&nbsp;<a href="<%=contextPath%>/users/login">立即登录</a>&nbsp;</span>
            </div>
        </div>
    </div>
    <%@ include file="/includes/footer.jsp" %>

</div>

<%@ include file="/includes/jquery-bootstrap-js.jsp" %>
<%@ include file="/includes/top-nav-js.jsp" %>
<%@ include file="/includes/datetimepicker-js.jsp" %>
<%@ include file="/includes/top-progress.jsp" %>
<script src="<%=contextPath%>/js/jquery/validate/jquery.validate.js"></script>
<script src="<%=contextPath%>/js/jquery/validate/messages_zh.js"></script>
<script type="text/javascript">
    $(function(){
        $("#form").validate({
            rules: {
                name: "required",
                email: {
                    required: true,
                    email: true
                },
                password: "required"
            },
            messages: {
            },
            submitHandler: function () {
                alert('注册功能暂时不开放！');
            }

        });
    });
</script>

</body>
</html>