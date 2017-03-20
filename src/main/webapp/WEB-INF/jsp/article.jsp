<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/includes/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/includes/header.jsp"%>
<link href="<%=contextPath%>/css/article.css" rel="stylesheet">
<link href="<%=contextPath%>/css/jquery.tocify.css" rel="stylesheet">
<link href="<%=contextPath%>/google-code-prettify/prettify.css"
	rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->

<!--       <script> -->

<!--       </script> -->
</head>
<body>

	<%-- 头部导航栏 --%>
	<%@ include file="/includes/nav-top.jsp"%>

	<div class="main">
		<div class="container">
			
			<div class="row">
				<!-- 左边栏 -->
				<!-- 				<div class="col-md-2"></div> -->
				<!-- 中间栏 -->
				<div class="col-md-8" role="main">
					<!-- 文章缩略图 -->
					<div id="article-priview">

						<div class="sub-article-header">

							<!-- 文章标题 -->
							<h1>${article.title}</h1>
							<!-- 文章发表时间，分类 -->
							<div class="sub-article-meta">
								<span>发表于&nbsp;</span> <span class="sub-article-post-time">
									<fmt:formatDate value="${article.createTime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</span> <span>&nbsp;|&nbsp;</span> <span>分类于&nbsp;</span><span
									class="sub-article-category-item"> <c:if
										test="${article.category == 1}">
										<a href="<%=contextPath%>/archive/java">Java</a>
									</c:if> <c:if test="${article.category == 2}">
										<a href="<%=contextPath%>/archive/android">Android</a>
									</c:if> <c:if test="${article.category == 3}">
										<a href="<%=contextPath%>/archive/db">DB</a>
									</c:if>
								</span>
							</div>
							<!-- 文章具体内容 -->
							<div class="sub-article-body">${article.htmlStr}</div>
						</div>
					</div>
				</div>

				<!-- 右边栏 -->
				<div class="col-md-4" role="complementary">
					<!-- 文章目录 -->
					<div class="span3">
						<div id="toc"></div>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="/includes/footer.jsp"%>
	</div>

	<%@ include file="/includes/js.jsp"%>
	<script src="<%=contextPath%>/js/jquery-ui-1.9.1.custom.min.js"></script>
	<script src="<%=contextPath%>/js/jquery.tocify.js""></script>
	<script src="<%=contextPath%>/google-code-prettify/prettify.js"></script>

	<script type="text/javascript">
		$(function() {
			$("#toc").tocify({
				selectors : "h2, h3, h4",
				// 关闭页面扩展(body下面多余的空白页)
				extendPage : false
			}).data("toc-tocify");

			// 代码高亮
			$("pre").addClass("prettyprint");
			prettyPrint();
			// 			        $(".optionName").popover({ trigger: "hover" });
		});

		// 		$(document).ready(function() {
		// 			//Calls the tocify method on your HTML div.
		// 			$("#toc").tocify();

		// 			$("pre").addClass("prettyprint");
		// 			prettyPrint();

		// 		})
	</script>
</body>
</html>