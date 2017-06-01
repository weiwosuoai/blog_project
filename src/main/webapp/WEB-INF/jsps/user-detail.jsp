<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/includes/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>

    <%@ include file="/includes/header.jsp" %>
    <link href="<%=contextPath%>/css/pagination.css" rel="stylesheet">
    <link href="<%=contextPath%>/css/user-detail.css" rel="stylesheet">

</head>
<body>
<%-- 头部导航栏 --%>
<%@ include file="/includes/nav-top.jsp" %>

<input id="pageNum" type="hidden" name="pageNum" value="${pageInfo.pageNum}">
<input id="pageSize" type="hidden" name="pageSize" value="${pageInfo.pageSize}">
<input id="total" type="hidden" name="total" value="${pageInfo.total}">
<input id="isUserLogined" type="hidden" value="${sessionScope.userid}">

<div class="main">
    <div class="container">
        <div class="row">
            <!-- 				左边栏 -->
            <!-- 				<div class="col-md-2"></div> -->
            <!-- 左边栏 -->
            <div class="col-md-3 left-col-md">
                <div class="col-md-container">

                    <!-- profile -->
                    <%--<div class="panel panel-default m-panel m-panel-margin">--%>
                    <%--<!-- 						<div class="panel-heading">Panel heading without title</div> -->--%>
                    <%--<div class="panel-body avatar-container">--%>
                    <%--<div class="user">--%>
                    <%--<img alt="profile" class="no-border profile-img"--%>
                    <%--src="/images/avatar.jpg">--%>

                    <%--<div class="user-name">Allen Jiang</div>--%>

                    <%--&lt;%&ndash;<p>面朝大海,春暖花开</p>&ndash;%&gt;--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <img alt="profile" class="no-border profile-img"
                         src="https://avatars.githubusercontent.com/u/4217102?v=3">

                    <div class="name-introduction-container">
                        <h1>
                            <span class="name">Allen Jiang</span>
                            <%--<span class="introduction">面朝大海,春暖花开</span>--%>
                        </h1>

                    </div>

                    <div class="follow-container">
                        <button class="btn btn-default btn-block" type="submit">
                            Follow
                        </button>
                    </div>

                    <%-- 地址，邮箱 --%>
                    <ul class="other-info-container">

                        <li aria-label="Home location"
                            itemprop="homeLocation" title="上海市，徐汇区">
                            <i class="glyphicon glyphicon-map-marker margin-right5 octicon"></i>
                            上海市，徐汇区
                        </li>
                        <li aria-label="Email" style="margin-top: 3px;"
                            itemprop="email">
                            <i class="glyphicon glyphicon-envelope margin-right5 octicon"></i>
                            <a href="mailto:jakewharton@gmail.com">weiwosuoai1991@gmail.com</a>
                        </li>
                    </ul>

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

                    <%-- my favorite music --%>
                    <%--<iframe frameborder="no" border="0" marginwidth="0"--%>
                    <%--marginheight="0" width=245 height=86--%>
                    <%--src="//music.163.com/outchain/player?type=2&id=29567187&auto=2&height=66"--%>
                    <%--style="margin-left: -10px; margin-top: -15px;"></iframe>--%>

                    <%--<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=245 height=450--%>
                    <%--src="//music.163.com/outchain/player?type=0&id=39734354&auto=1&height=430"--%>
                    <%--style="margin-left: -10px; margin-top: -10px;"></iframe>--%>

                    <%-- weibo --%>
                    <iframe width="100%" height="550" class="share_self" frameborder="0" scrolling="no"
                            src="http://widget.weibo.com/weiboshow/index.php?language=&width=0&height=550&fansRow=2&ptype=1&speed=0&skin=1&isTitle=1&noborder=1&isWeibo=1&isFans=1&uid=3932230692&verifier=9cd40337&dpc=1"></iframe>
                </div>
            </div>
            <!-- 右边栏 -->
            <div class="col-md-9" style="margin-top: 24px;">
                <div id="article-container">
                    <ul id="myTab" class="nav nav-tabs m-nav-tabs">
                        <li class="active">
                            <a href="#">
                                博文
                                <span class="counter">
                                    ${pageInfo.total}
                                </span>
                            </a>
                        </li>
                        <li><a href="#">问答</a></li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <%--博文列表页头--%>
                        <%--<div class="page-header m-page-header">--%>
                        <%--<h3 class="page-header-title">博文列表<span>(${pageInfo.total})</span></h3>--%>
                        <%--</div>--%>
                        <div id="data-container">

                            <c:forEach var="article" items="${pageInfo.list}" varStatus="status">
                                <div class="article-priview">
                                    <div class="sub-article-header">

                                        <!-- 文章标题 -->
                                        <div class="article-title">

                                        <h3>
                                            <span class="article-type">原</span>
                                            <a href="<%=contextPath%>/articles/${article.id}">${article.title}</a></h3>
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
                                        <div style="margin-top: 10px;">
                                            <c:forEach var="tag" items="${article.tags}" varStatus="statusTag">
                                                <a href='<%=contextPath%>/articles/tags/${tag.id}'
                                                   style="margin-right: 3px;"
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
                        <%--分页--%>
                        <div id="pagination-container" style="margin-top: 30px; margin-bottom: 30px;"
                             class="pull-right"> </div>
                    </div>

                </div>
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
<%@ include file="/includes/top-progress.jsp" %>
<script src="<%=contextPath%>/js/jquery.toTop.min.js"></script>
<script src="<%=contextPath%>/js/pagination.js"></script>
<%@ include file="/includes/modal-article-edit-js.jsp" %>
<%@ include file="/includes/modal-article-delete-js.jsp" %>

<script type="text/javascript">
    $(function () {
        createPagination();
    });

    var container = $('#pagination-container');
    function createPagination() {
        var sources = function () {
            var result = [];

            var total = Number($('#total').val()) + 1;
            for (var i = 1; i < total; i++) {
                result.push(i);
            }

            return result;
        }();

        var options = {
            dataSource: sources,
            pageNumber: $('#pageNum').val(),

//            showGoButton: true,
//            showGoInput: true,
            showPrevious: true,
            showNext: true,
            showNavigator: true,
            formatNavigator: "<span style='color: #000; font-size: 12px;'>&nbsp;共&nbsp;" + $('#total').val() + "&nbsp;篇博文</span>",
            pageSize: $('#pageSize').val(),
            callback: function (response, pagination) {
            }
        };
        container.pagination(options);

        //$.pagination(container, options);
        container.addHook('afterGoButtonOnClick', function () {
            getPageData();
        });
        // 点击上一页
        container.addHook('afterPreviousOnClick', function () {
            getPageData();
        });
        // 点击下一页
        container.addHook('afterNextOnClick', function () {
            getPageData();
        });
        // 点击下一页
        container.addHook('afterPageOnClick', function () {
            getPageData();
        });

        return container;
    }

    function getPageData() {
        // 获取当前选中页码
        var pageNum = container.pagination('getSelectedPageNum');
        var pageSize = $('#pageSize').val();
        location.href = "articles?pageNum=" + pageNum + "&pageSize=" + pageSize;
    }

    $(document).ready(function () {

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
            url: "<%=contextPath%>/articles/category/num",
            datatype: "json",
            success: function (data) {
                var html = '<ul>';
                $.each(data, function (i, item) {
                    html += "<li><a href='<%=contextPath%>/articles/category/" + item.id + "'>" + item.name
                            + "&nbsp;<span style='color:#6a737c'>(" + item.num + ")</span></a></li>";
                });
                html += "</ul>"
                $('#category-num').html(html);
            }
        });

        // ajax 异步获取标签信息
        $.ajax({
            type: "GET",
            async: true,
            url: "<%=contextPath%>/articles/tags",
            datatype: "json",
            success: function (data) {
                $.each(data, function (i, item) {
                    $('#tags').append("<a href='<%=contextPath%>/articles/tags/" + item.id + "' class='label label-info m-label-info' style='margin-right: 4px'>" + item.name + "</a>");
                });
            }
        });

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

    });

</script>
</body>
</html>