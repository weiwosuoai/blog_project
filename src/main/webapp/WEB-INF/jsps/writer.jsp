<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/includes/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>

    <%@ include file="/includes/header.jsp" %>
    <link href="<%=contextPath%>/css/writer.css" rel="stylesheet">

</head>
<body>

<%--&lt;%&ndash; 头部导航栏 &ndash;%&gt;--%>
<%--<%@ include file="/includes/nav-top.jsp" %>--%>
<div class="main" style="padding-top: 0;">

    <div class="container-fluid">

        <div class="row">

            <%--markdown 编辑区--%>
            <div class="col-md-6 writer-left-container">

                <div class="pull-right">
                    <a class="back-to-home" href="<%=contextPath%>/index">
                        回到首页
                    </a>
                    <button class="btn btn-success m-btn-upload" data-toggle="modal" data-target="#modal-article-post"
                            type="button">
                        <span>
                            <i class="glyphicon glyphicon-share-alt" style="margin-right: 2px;"></i>
                            发步博文
                        </span>
                    </button>
                </div>
                <div id="wmd-button-bar" class="wmd-button-bar">
                </div>

                <textarea id="wmd-input" class="wmd-input"></textarea>
            </div>
            <%--markdown 展示区--%>
            <div class="col-md-6 writer-right-container">
                <div class="preview-header">
                    <h4>预览区</h4>
                </div>
                <div id="wmd-preview" class="wmd-panel wmd-preview m-wmd-preview">
                </div>
            </div>
        </div>

    </div>
</div>

<%@ include file="/includes/jquery-bootstrap-js.jsp" %>
<script src="<%=contextPath%>/js/Markdown.Converter.js"></script>
<script src="<%=contextPath%>/js/Markdown.Editor.js"></script>
<script src="<%=contextPath%>/js/Markdown.Sanitizer.js"></script>
<%@ include file="/includes/top-nav-js.jsp" %>
<script src="<%=contextPath%>/js/bootstrap-notify.js"></script>
<%@ include file="/includes/modal-article-post.jsp" %>
<%@ include file="/includes/modal-article-post-js.jsp" %>
<%@ include file="/includes/top-progress.jsp" %>
<script type="text/javascript">
    var converter = Markdown.getSanitizingConverter();
    var editor = new Markdown.Editor(converter);
    editor.run();
</script>
</body>
</html>