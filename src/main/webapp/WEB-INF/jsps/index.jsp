<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/includes/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>

    <%@ include file="/includes/header.jsp" %>
    <link href="<%=contextPath%>/css/index.css" rel="stylesheet">
    <link href="<%=contextPath%>/css/summernote.css" rel="stylesheet">
    <link href="<%=contextPath%>/google-code-prettify/prettify.css" rel="stylesheet">
    <link href="<%=contextPath%>/css/zoomify.css" rel="stylesheet">

</head>
<body>
<%-- 头部导航栏 --%>
<%@ include file="/includes/nav-top.jsp" %>
<div class="main">
    <input id="topNavType" type="hidden" value="${topNavType}">
    <div class="container">
        <div class="row">
            <!-- 				左边栏 -->
            <!-- 				<div class="col-md-2"></div> -->
            <!-- 左边栏 -->
            <div class="col-md-3 left-col-md">
                <div class="col-md-container">

                    <!-- profile -->
                    <div class="panel panel-default m-panel m-panel-margin">
                        <!-- 						<div class="panel-heading">Panel heading without title</div> -->
                        <div class="panel-body avatar-container">
                            <div class="user">
                                <img alt="profile" class="no-border profile-img"
                                     src="/images/avatar.jpg">

                                <div class="user-name">Allen Jiang</div>

                                <p>面朝大海,春暖花开</p>
                            </div>
                        </div>
                    </div>

                    <%-- my favorite music --%>
                    <iframe frameborder="no" border="0" marginwidth="0"
                            marginheight="0" width=245 height=86
                            src="//music.163.com/outchain/player?type=2&id=29567187&auto=2&height=66"
                            style="margin-left: -10px; margin-top: -15px;"></iframe>

                    <div class="panel panel-default m-panel">
                        <div class="panel-heading m-panel-heading">文章存档</div>
                        <div class="panel-body m-panel-body" id="archive-month">
                            <!--<p><a href="#">2017年3月</a></p> -->
                        </div>
                    </div>

                    <div class="panel panel-default m-panel">
                        <div class="panel-heading m-panel-heading">文章分类</div>
                        <div class="panel-body m-panel-body" id="category-num">
                            <ul>
                                <%--<li><a href="<%=contextPath%>/archive/javaweb">Jave Web</a></li> --%>
                            </ul>
                        </div>
                    </div>

                    <div class="panel panel-default m-panel">
                        <div class="panel-heading m-panel-heading">标签</div>
                        <div class="panel-body m-panel-body" id="tags">
                            <!--<a class="label label-info m-label-info">工具</a> -->
                        </div>
                    </div>

                    <%-- weibo --%>
                    <iframe width="100%" height="550" class="share_self" frameborder="0" scrolling="no"
                            src="http://widget.weibo.com/weiboshow/index.php?language=&width=0&height=550&fansRow=2&ptype=1&speed=0&skin=1&isTitle=1&noborder=1&isWeibo=1&isFans=1&uid=3932230692&verifier=9cd40337&dpc=1"></iframe>
                </div>
            </div>
            <!-- 右边栏 -->
            <div class="col-md-9">
                <div id="article-container">
                    <%--博文列表页头--%>
                    <div class="page-header m-page-header">
                        <h3 class="page-header-title">博文列表</h3>
                    </div>
                    <c:forEach var="article" items="${articles}" varStatus="status">
                        <div class="article-priview">
                            <div class="sub-article-header">

                                <!-- 文章标题 -->
                                <div class="article-title">
                                    <span class="article-type">原</span>
                                    <span><a href="<%=contextPath%>/articles/${article.id}">${article.title}</a></span>
                                        <%-- 用户登录后，才会显示编辑超链接 --%>
                                    <c:if test="${sessionScope.userid != null}">
                                        <div class="article-operate-container pull-right"
                                             style=" margin-left: 10px;">
                                                           <span>
                                                       <a href="#" data-toggle="modal" data-target="#modal-delete"
                                                          style="font-size: 13px;"
                                                          data-id="${article.id}">删除</a></span>
                                                       <span>
                                                       <a href="#" data-toggle="modal" data-target="#modal-edit"
                                                          style="font-size: 13px;"
                                                          data-id="${article.id}">编辑</a></span>
                                        </div>
                                    </c:if>
                                </div>
                                <!-- 文章缩略内容-->
                                <div class="sub-article-body">${article.shortHtmlStr}</div>
                                    <%--标签和时间--%>
                                <div style="margin-top: 5px;">
                                    <c:forEach var="tag" items="${article.tags}" varStatus="statusTag">
                                        <a href='<%=contextPath%>/archive/tag/${tag.id}' style="margin-right: 3px;"
                                           class="label label-info m-label-info">${tag.name}</a>
                                    </c:forEach>
                                    <div class="pull-right" style="color: #999; font-size: 12px;">
                                            ${article.createTimeStr}
                                    </div>
                                </div>
                                <!-- 文章发表时间，分类 -->
                                    <%--<%@ include file="/includes/article-meta-index.jsp" %>--%>

                                    <%--<div>--%>
                                    <%--<a class="btn btn-success m-btn-success"--%>
                                    <%--href="<%=contextPath%>/articles/${article.id}"--%>
                                    <%--role="button">阅读全文&nbsp;»</a>--%>
                                    <%--</div>--%>
                            </div>


                        </div>
                    </c:forEach>
                </div>

                <input id="pageSize" type="hidden" name="pageSize" value="10">
                <input id="currentPage" type="hidden" name="currentPage" value="1">
                <input id="isUserLogined" type="hidden" value="${sessionScope.userid}">

                <!-- loading more -->
                <!-- 					<div> -->
                <!-- 						<a class="btn btn-block load-more" -->
                <!-- 							href="#" role="button">点击加载更多</a> -->
                <!-- 					</div> -->
            </div>


            <%-- back to top --%>
            <a class="to-top" data-toggle="tooltip" data-placement="left" title="回到顶部">
                <i class="glyphicon glyphicon-menu-up"></i>
            </a>

            <%-- 引入的 modal（包括文字编辑、删除的 modal） --%>
            <%@ include file="/includes/modal-article-edit.jsp" %>
            <%@ include file="/includes/modal-article-delete.jsp" %>

        </div>
    </div>
    <%@ include file="/includes/footer.jsp" %>

</div>
<%@ include file="/includes/jquery-bootstrap-js.jsp" %>
<script src="<%=contextPath%>/js/bootstrap-notify.js"></script>
<%@ include file="/includes/top-nav-js.jsp" %>
<%@ include file="/includes/datetimepicker-js.jsp" %>
<script src="<%=contextPath%>/google-code-prettify/prettify.js"></script>
<script src="<%=contextPath%>/js/jquery.toTop.min.js"></script>
<script src="<%=contextPath%>/js/zoomify.js"></script>
<script src="<%=contextPath%>/js/nprogress.js"></script>
<%@ include file="/includes/modal-article-edit-js.jsp" %>
<%@ include file="/includes/modal-article-delete-js.jsp" %>

<script type="text/javascript">
    $(document).ready(function () {
        // 顶部加载进度条
        NProgress.configure({
            showSpinner: false
        });
        NProgress.start();
        // 代码高亮
//        codeHighlighting();

        // ajax 异步获取文章存档信息
        $.ajax({
            type: "GET",
            async: true,
            url: "<%=contextPath%>/articles/month",
            datatype: "json",
            success: function (data) {
                var html = '<ul>';
                $.each(data, function (i, item) {
                    html += "<li><a href='<%=contextPath%>/articles/"
                            + item.year + "/" + item.month + "'>"
                            + item.yearMonth
                            + "&nbsp;<span style='color:#6a737c'>("
                            + item.nums + ")</span></a></li>";
                });

                html += "</ul>"
                $('#archive-month').html(html);
            }
        });

        // ajax 异步获取分类信息
        $.ajax({
            type: "GET",
            async: true,
            url: "<%=contextPath%>/category/_article_num",
            datatype: "json",
            success: function (data) {
                var html = '<ul>';
                $.each(data, function (i, item) {
                    html += "<li><a href='<%=contextPath%>/archive/category/" + item.id + "'>" + item.name
                            + "&nbsp;<span style='color:#6a737c'>(" + item.nums + ")</span></a></li>";
                });
                html += "</ul>"
                $('#category-num').html(html);
            }
        });

        // ajax 异步获取标签信息
        $.ajax({
            type: "GET",
            async: true,
            url: "<%=contextPath%>/tags",
            datatype: "json",
            success: function (data) {
                $.each(data, function (i, item) {
                    $('#tags').append("<a href='<%=contextPath%>/archive/tag/" + item.id + "' class='label label-info m-label-info' style='margin-right: 4px'>" + item.name + "</a>");
                });
            }
        });

        // 图片放大
//        $('p img').zoomify();

        // 回到顶部
        // 可定制选项
        $('.to-top').toTop({
            //以下是选项默认参数，您可以根据自己的需求修改
            autohide: true,  //是否自动隐藏
            offset: 420,     //距离顶部多少距离时自动隐藏按钮
            speed: 500,      //滚动持续时间
            position: true,   //如果设置为 false，则需要手动在 css 中设置“按钮”的位置
            right: 30,       //右侧距离
            bottom: 120       //底部距离
        });
        $('[data-toggle="tooltip"]').tooltip()

        // 滚动监听,加载更多
        <%--$(window).scroll(function () {--%>

        <%--if ($(document).scrollTop() >= $(document).height() - $(window).height()) {--%>
        <%--// 加载更多 div 隐藏--%>
        <%--// TODO--%>
        <%--var pageSize = $('#pageSize').val();--%>
        <%--var currentPage = parseInt($('#currentPage').val()) + 1;--%>

        <%--// ajax 异步获取更多的文章信息--%>
        <%--$.ajax({--%>
        <%--type: "GET",--%>
        <%--async: true,--%>
        <%--url: "<%=contextPath%>/index/more?pageSize=" + pageSize + "&currentPage=" + currentPage,--%>
        <%--datatype: "json",--%>
        <%--success: function (data) {--%>
        <%--$.each(data, function (i, item) {--%>
        <%--var appendHtml = "<div class='article-priview'>";--%>
        <%--appendHtml += "<div class='sub-article-header'>";--%>
        <%--appendHtml += "<span class='article-title'>";--%>
        <%--appendHtml += "<a href='<%=contextPath%>/articles/" + item.id + "'>" + item.title + "</a>";--%>
        <%--appendHtml += "</span>";--%>

        <%--appendHtml += "<div class='sub-article-body'>" + item.shortHtmlStr + "</div>";--%>
        <%--appendHtml += "</div>";--%>

        <%--// ========================= meta =========================--%>
        <%--appendHtml += "<div class='sub-article-meta' style='margin-top: 5px;'>";--%>
        <%--appendHtml += "<span style='margin-right: 2px;'><i class='glyphicon glyphicon-time'></i></span>";--%>
        <%--appendHtml += "<span class='sub-article-post-time'>" + item.createTimeStr + "</span>";--%>
        <%--appendHtml += "&nbsp;&nbsp;&nbsp;&nbsp; <span style='margin-right: 2px;'><i class='glyphicon glyphicon-th-list'></i></span> <span class='sub-article-category-item'>";--%>
        <%--if (item.category == 1) {--%>
        <%--appendHtml += "<a href='<%=contextPath%>/archive/javaweb'>Java</a>";--%>
        <%--} else if (item.category == 2) {--%>
        <%--appendHtml += "<a href='<%=contextPath%>/archive/android'>Android</a>";--%>
        <%--} else if (item.category == 3) {--%>
        <%--appendHtml += "<a href='<%=contextPath%>/archive/db'>DB</a>";--%>
        <%--}--%>
        <%--appendHtml += "&nbsp;&nbsp;&nbsp;&nbsp;<span><i class='glyphicon glyphicon-eye-open' style='margin-right: 3px;'></i>&nbsp;&nbsp;" + item.beViewdNum + "人浏览</span>";--%>
        <%--appendHtml += "&nbsp;&nbsp;&nbsp;&nbsp;<span><i class='glyphicon glyphicon-tags'></i>&nbsp;&nbsp;";--%>

        <%--var tags = item.tags;--%>
        <%--for (var j = 0; j < tags.length; j++) {--%>
        <%--appendHtml += "<a href='<%=contextPath%>/archive/tag/" + tags[j].id + "' class='label label-info m-label-info' style='margin-left: 4px;'>" + tags[j].name + "</a>";--%>
        <%--}--%>

        <%--//                            var isUserLogined = $('#isUserLogined').val();--%>
        <%--//                            if (isUserLogined.length > 0) {--%>
        <%--//                                appendHtml += "<span class='pull-right'><a href='#' data-toggle='modal' data-target='#modal-delete' data-id='" + item.id + "'>删除</a></span>";--%>
        <%--//                                appendHtml += "<span class='pull-right m-pull-right'><a href='#' data-toggle='modal' data-target='#modal-edit' data-id='" + item.id + "'>编辑</a></span>";--%>
        <%--//                            }--%>

        <%--appendHtml += "</span></span>";--%>
        <%--appendHtml += "</div>";--%>
        <%--// ========================================================--%>

        <%--appendHtml += "</div>"--%>

        <%--$('#article-container').append(appendHtml);--%>
        <%--});--%>

        <%--//                        codeHighlighting();--%>
        <%--//                        // 图片放大--%>
        <%--//                        $('p img').zoomify();--%>
        <%--// 更新隐藏域当前页码--%>
        <%--$('#currentPage').val(currentPage)--%>
        <%--}--%>
        <%--});--%>


        <%--}--%>
        <%--});--%>

//        // 富文本编辑器
//        $('#summernote').summernote({
//            height: 600, // set editor height
//            minHeight: null, // set minimum height of editor
//            maxHeight: null, // set maximum height of editor
//            focus: true, // set focus to editable area after initializing summernote
//            toolbar: [], // 去除工具栏
//            keyMap: {}
//        });

    });

    /** 代码高亮 **/
    function codeHighlighting() {
        // 代码高亮
        $("pre").addClass("prettyprint");
        prettyPrint();
    }

    // 页面内容全部加载完成后，设置进度条消失
    $(window).load(function () {
        NProgress.done()
    });

</script>
</body>
</html>