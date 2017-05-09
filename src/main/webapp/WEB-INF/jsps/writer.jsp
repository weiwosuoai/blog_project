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

                <div id="wmd-button-bar" class="wmd-button-bar">
                    <div class="pull-right">

                        <button class="btn btn-success m-btn-upload" type="button">
                            <span><i class="glyphicon glyphicon-upload"></i></span>
                            发表博文
                        </button>
                    </div>
                </div>

                <textarea id="wmd-input" class="wmd-input"></textarea>
            </div>
            <%--markdown 展示区--%>
            <div class="col-md-6 writer-right-container">
                <div class="preview-header"><h4>预览区</h4></div>
                <div id="wmd-preview" class="wmd-panel wmd-preview m-wmd-preview"></div>
            </div>
        </div>

    </div>
    <%--<%@ include file="/includes/footer.jsp" %>--%>

</div>

<%@ include file="/includes/jquery-bootstrap-js.jsp" %>
<%@ include file="/includes/top-nav-js.jsp" %>
<%--<%@ include file="/includes/datetimepicker-js.jsp" %>--%>
<script src="<%=contextPath%>/js/nprogress.js"></script>
<script src="<%=contextPath%>/js/Markdown.Converter.js"></script>
<script src="<%=contextPath%>/js/Markdown.Editor.js"></script>
<script src="<%=contextPath%>/js/Markdown.Sanitizer.js"></script>


<script type="text/javascript">
    $(document).ready(function () {
        // 顶部加载进度条
        NProgress.configure({
            showSpinner: false
        });
        NProgress.start();

        var converter = Markdown.getSanitizingConverter();
        var editor = new Markdown.Editor(converter);
        editor.run();

    });
    // 页面内容全部加载完成后，设置进度条消失
    $(window).load(function () {
        NProgress.done()
    });
</script>
</body>
</html>