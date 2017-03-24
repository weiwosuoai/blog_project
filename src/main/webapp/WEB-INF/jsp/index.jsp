<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/includes/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/includes/header.jsp"%>
<link href="<%=contextPath%>/css/index.css" rel="stylesheet">
<link href="<%=contextPath%>/css/summernote.css" rel="stylesheet">
<link href="<%=contextPath%>/google-code-prettify/prettify.css"
	rel="stylesheet">

</head>
<body>

	<%-- 头部导航栏 --%>
	<%@ include file="/includes/nav-top.jsp"%>
	<div class="main">
		<input id="topNavType" type="hidden" value="${topNavType}">
		<div class="container">
			<div class="row">
				<!-- 				左边栏 -->
				<!-- 				<div class="col-md-2"></div> -->
				<!-- 中间栏 -->
				<div class="col-md-8" role="main">

					<c:forEach var="article" items="${articles}" varStatus="status">
						<c:choose>
							<c:when test="${status.first}">
								<!-- 文章缩略图 -->
								<div id="article-priview">
									<div class="sub-article-header">
										<!-- 文章标题 -->
										<h1 class="article-title">
											<a href="<%=contextPath%>/article/${article.id}">${article.title}</a>
										</h1>
										<!-- 文章发表时间，分类 -->
										<%@ include file="/includes/article-meta.jsp"%>
										<!-- 文章缩略内容-->
										<div class="sub-article-body">${article.shortHtmlStr}</div>

										<div>
											<a class="btn btn-success m-btn-success"
												href="<%=contextPath%>/article/${article.id}" role="button">阅读全文&nbsp;»</a>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="article-priview-next">
									<div class="sub-article-header">

										<!-- 文章标题 -->
										<h1 class="article-title">
											<a href="<%=contextPath%>/article/${article.id}">${article.title}</a>
										</h1>
										<!-- 文章发表时间，分类 -->
										<%@ include file="/includes/article-meta.jsp"%>
										<!-- 文章缩略内容-->
										<div class="sub-article-body">${article.shortHtmlStr}</div>

										<div>
											<a class="btn btn-success m-btn-success"
												href="<%=contextPath%>/article/${article.id}" role="button">阅读全文&nbsp;»</a>
										</div>
									</div>
								</div>
							</c:otherwise>

						</c:choose>
					</c:forEach>

					<!-- 分页 -->
					<nav aria-label="Page navigation" class="nav-pagination">
						<ul class="pagination">
							<li class="disabled"><a href="#" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
							</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>


					</nav>
				</div>
				<!-- 右边栏 -->
				<div class="col-md-4">
					<div class="col-md-container">

						<!-- profile -->
						<div class="panel panel-default m-panel m-panel-margin">
							<!-- 						<div class="panel-heading">Panel heading without title</div> -->
							<div class="panel-body">
								<div class="user">
									<img alt="profile" class="no-border profile-img"
										src="http://img.hb.aicdn.com/2a949ef8e18e2555bba0f6dc78659c80cb5b7fea28def-24SgFL_fw658">

									<h2>Allen Jiang</h2>

									<p>面朝大海,春暖花开</p>
								</div>
							</div>
						</div>

						<iframe frameborder="no" border="0" marginwidth="0"
							marginheight="0" width=240 height=86
							src="//music.163.com/outchain/player?type=2&id=29750167&auto=2&height=66"
							style="margin-left: -10px; margin-top: -15px;"></iframe>

						<div class="panel panel-default m-panel">
							<div class="panel-heading m-panel-heading">文章存档</div>
							<div class="panel-body m-panel-body" id="archive-month">
								<!-- 								<p><a href="#">2017年3月</a></p> -->
							</div>
						</div>

						<div class="panel panel-default m-panel">
							<div class="panel-heading m-panel-heading">文章分类</div>
							<div class="panel-body m-panel-body">
								<p>
									<a href="<%=contextPath%>/archive/javaweb">Jave Web</a>
								</p>
								<p>
									<a href="<%=contextPath%>/archive/android">Android</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				
			<%@ include file="/includes/edit-modal.jsp"%>
			</div>

		</div>
		<%@ include file="/includes/footer.jsp"%>

	</div>
	<%@ include file="/includes/jquery-bootstrap-js.jsp"%>
	<%@ include file="/includes/top-nav-js.jsp"%>
	<script src="<%=contextPath%>/google-code-prettify/prettify.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			// ajax 异步获取文章存档信息
			$.ajax({
				type: "GET",
				async: true,
				url: "<%=contextPath%>/archive/monthInfo",
				datatype: "json",
				success : function(data) {
					$('#archive-month').html('');
					
					var html = '';
					$.each(data, function(i, item){
						html += "<p><a href='<%=contextPath%>/archive/"
										+ item.yearMonth + "'>"
										+ item.yearMonth
										+ "&nbsp;<span style='color:#999'>("
										+ item.nums + ")</span></a></p>";
							});

							$('#archive-month').html(html);
						}
					});

					// 代码高亮
					$("pre").addClass("prettyprint");
					prettyPrint();
					
					// 富文本编辑器
					$('#summernote').summernote({
						 height: 600,                 // set editor height
						 minHeight: null,             // set minimum height of editor
						 maxHeight: null,             // set maximum height of editor
						 focus: true,                 // set focus to editable area after initializing summernote
						 toolbar: [],                 // 去除工具栏
						 keyMap: {}
					});
				});
	</script>
	<%@ include file="/includes/edit-modal-js.jsp"%>
</body>
</html>