<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">

            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                    aria-expanded="false">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>

            <a class="navbar-brand m-navbar-brand" href="<%=contextPath%>/index">
                <%-- 				<img alt="江冰的博客" src="<%=contextPath%>/images/logo.png"> --%>
                <span class="logo">Exception</span>
            </a>
            <a class="navbar-brand" href="<%=contextPath%>/index">Allen's Blog</a>

        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse"
             id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" id="navbar">
                <li id="questions"><a href="<%=contextPath%>/questions">问答</a></li>
                <li id="blogs"><a href="<%=contextPath%>/index">博客<span
                        class="sr-only">(current)</span></a></li>
                <li id="all"><a href="<%=contextPath%>/archive/all">存档</a></li>
                <%--<li id="question"><a href="<%=contextPath%>/question">问答</a></li>--%>
                <%--<li id="wiki"><a href="<%=contextPath%>/wiki">Wiki</a></li>--%>
                <li id="users"><a href="<%=contextPath%>/users/login">Users</a></li>
                <!-- 				<li><a href="http://blog.csdn.net/weiwosuoai?viewmode=contents">CSDN</a></li> -->
            </ul>
            <form class="navbar-form navbar-left visible-lg-inline-block" action="<%=contextPath%>/archive">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="文章搜索" name="q">
					<span class="input-group-btn">
						<button type="submit" class="btn btn-default btn-search">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
					</span>
                </div>
            </form>

            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${sessionScope.userid == null}">
                        <!-- 超链接只能是 GET 方式请求 -->
                        <li><a id="modal_login" href="<%=contextPath%>/users/login" style="color: #07C; margin-right: 5px;">登录</a></li>
                        <!-- <li><a href="#">注册</a></li> -->
                    </c:when>
                    <c:otherwise>
                        <%--<a href="#" class="btn btn-success pull-right btn-article-post"--%>
                        <%--data-toggle="modal" data-target="#modal-article-post">写博客</a>--%>
                    </c:otherwise>
                </c:choose>
                <input id="user_id" type="hidden" value="${sessionScope.userid}">
                <%-- 始终显示写博客按钮 --%>
                <a href="#" class="btn btn-success pull-right btn-article-post" onclick="writeArticle()">
                    <i class="glyphicon glyphicon-pencil" style="margin-right: 3px;"></i>写博客</a>

                <%--<a id="modal_login" href="<%=contextPath%>/users/write" data-toggle="modal"--%>
                <%--data-target="#modal-login" class="btn btn-success pull-right btn-article-post">--%>
                <%--<i class="glyphicon glyphicon-pencil" style="margin-right: 3px;"></i>写博客</a>--%>

            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
<%--服务端返回的 navbar 标识，以便动态为 navbar 添加 active 属性--%>
<input id="navbarRef" type="hidden" value="${navbarRef}">
