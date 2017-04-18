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
				<div class="col-md-9" role="main">
					<div id="article-container">
						<c:forEach var="article" items="${articles}" varStatus="status">
						<c:choose>
							<c:when test="${status.first}">
								<!-- 文章缩略图 -->
								<div id="article-priview">
									<div class="sub-article-header">
										<!-- 文章标题 -->
										<h1 class="article-title">
											<a href="<%=contextPath%>/articles/${article.id}">${article.title}</a>
										</h1>
										<!-- 文章发表时间，分类 -->
										<%@ include file="/includes/article-meta.jsp"%>
										<!-- 文章缩略内容-->
										<div class="sub-article-body">${article.shortHtmlStr}</div>

										<div>
											<a class="btn btn-success m-btn-success"
												href="<%=contextPath%>/articles/${article.id}" role="button">阅读全文&nbsp;»</a>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="article-priview-next">
									<div class="sub-article-header">

										<!-- 文章标题 -->
										<h1 class="article-title">
											<a href="<%=contextPath%>/articles/${article.id}">${article.title}</a>
										</h1>
										<!-- 文章发表时间，分类 -->
										<%@ include file="/includes/article-meta.jsp"%>
										<!-- 文章缩略内容-->
										<div class="sub-article-body">${article.shortHtmlStr}</div>

										<div>
											<a class="btn btn-success m-btn-success"
												href="<%=contextPath%>/articles/${article.id}" role="button">阅读全文&nbsp;»</a>
										</div>
									</div>
								</div>
							</c:otherwise>

						</c:choose>
					</c:forEach>
					</div>
					

					<!-- 分页 -->
<!-- 					<nav aria-label="Page navigation" class="nav-pagination"> -->
<!-- 						<ul class="pagination"> -->
<!-- 							<li class="disabled"><a href="#" aria-label="Previous"> -->
<!-- 									<span aria-hidden="true">&laquo;</span> -->
<!-- 							</a></li> -->
<!-- 							<li><a href="#">1</a></li> -->
<!-- 							<li><a href="#">2</a></li> -->
<!-- 							<li><a href="#">3</a></li> -->
<!-- 							<li><a href="#">4</a></li> -->
<!-- 							<li><a href="#">5</a></li> -->
<!-- 							<li><a href="#" aria-label="Next"> <span -->
<!-- 									aria-hidden="true">&raquo;</span> -->
<!-- 							</a></li> -->
<!-- 						</ul> -->
<!-- 					</nav> -->
					
					<input id="pageSize" type="hidden" name="pageSize" value="5">
					<input id="currentPage" type="hidden" name="currentPage" value="1">
					<input id="isUserLogined" type="hidden" value="${sessionScope.userid}">
					
					<!-- loading more -->
<!-- 					<div> -->
<!-- 						<a class="btn btn-block load-more" -->
<!-- 							href="#" role="button">点击加载更多</a> -->
<!-- 					</div> -->
				</div>
				<!-- 右边栏 -->
				<div class="col-md-3 right-col-md">
					<div class="col-md-container">

						<!-- profile -->
						<div class="panel panel-default m-panel m-panel-margin">
							<!-- 						<div class="panel-heading">Panel heading without title</div> -->
							<div class="panel-body">
								<div class="user">
									<img alt="profile" class="no-border profile-img"
										src="/images/profile.jpg">

									<h2>Allen Jiang</h2>

									<p>面朝大海,春暖花开</p>
								</div>
							</div>
						</div>

						<iframe frameborder="no" border="0" marginwidth="0"
							marginheight="0" width=233 height=86
							src="//music.163.com/outchain/player?type=2&id=34923114&auto=2&height=66"
							style="margin-left: -10px; margin-top: -15px;"></iframe>

						<div class="panel panel-default m-panel">
							<div class="panel-heading m-panel-heading">文章存档</div>
							<div class="panel-body m-panel-body" id="archive-month">
<!-- 																<p><a href="#">2017年3月</a></p> -->
							</div>
						</div>

						<div class="panel panel-default m-panel">
							<div class="panel-heading m-panel-heading">文章分类</div>
							<div class="panel-body m-panel-body" id="category-num">
								<ul>
									<%-- 									<li><a href="<%=contextPath%>/archive/javaweb">Jave Web</a></li> --%>
								</ul>
							</div>
						</div>

						<div class="panel panel-default m-panel">
							<div class="panel-heading m-panel-heading">标签</div>
							<div class="panel-body m-panel-body" id="tags">
<!-- 								<a class="label label-info m-label-info">工具</a> -->
							</div>
						</div>
					</div>
				</div>

				<%@ include file="/includes/modal-article-edit.jsp"%>
				
			</div>
		</div>
		<%@ include file="/includes/footer.jsp"%>

	</div>
	<%@ include file="/includes/jquery-bootstrap-js.jsp"%>
	<%@ include file="/includes/top-nav-js.jsp"%>
	<%@ include file="/includes/datetimepicker-js.jsp"%>
	<script src="<%=contextPath%>/google-code-prettify/prettify.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			
			// 代码高亮
			codeHighlighting();
			
			// ajax 异步获取文章存档信息
			$.ajax({
				type: "GET",
				async: true,
				url: "<%=contextPath%>/archive/monthInfo",
				datatype: "json",
				success: function(data) {
					var html = '<ul>';
					$.each(data, function(i, item){
						html += "<li><a href='<%=contextPath%>/archive/"
										+ item.yearMonth + "'>"
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
				url: "<%=contextPath%>/category_article_num",
				datatype : "json",
				success : function(data) {
					var html = '<ul>';
					$.each(data, function(i, item) {
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
				datatype : "json",
				success : function(data) {
					$.each(data, function(i, item) {
						$('#tags').append("<a href='<%=contextPath%>/archive/tag/" + item.id + "' class='label label-info m-label-info' style='margin-right: 4px'>" + item.name + "</a>");
					});
				}
			});
			
			// 滚动监听,加载更多
			$(window).scroll(function(){
				if ($(document).scrollTop() >= $(document).height() - $(window).height()) {
					// 加载更多 div 隐藏
					// TODO
					var pageSize = $('#pageSize').val();
					var currentPage = parseInt($('#currentPage').val()) + 1;
					
					// ajax 异步获取更多的文章信息
					$.ajax({
						type: "GET",
						async: true,
						url: "<%=contextPath%>/index/more?pageSize=" + pageSize + "&currentPage=" + currentPage,
						datatype : "json",
						success : function(data) {
							$.each(data, function(i, item) {
								var appendHtml = "<div class='article-priview-next'>";
								appendHtml += "<div class='sub-article-header'>";
								appendHtml += "<h1 class='article-title'>";
								appendHtml += "<a href='<%=contextPath%>/article/" + item.id + "'>" + item.title + "</a>";
								appendHtml += "</h1>";
								
								// ========================= meta =========================
								appendHtml += "<div class='sub-article-meta'>";
								appendHtml += "<span>发表于&nbsp;</span>";
								appendHtml += "<span class='sub-article-post-time'>" + item.createTimeStr + "</span>";
								appendHtml += "&nbsp;&nbsp;&nbsp; <span>分类于&nbsp;</span> <span class='sub-article-category-item'>";
								if (item.category == 1) {
									appendHtml += "<a href='<%=contextPath%>/archive/javaweb'>Java</a>";
								} else if (item.category == 2) {
									appendHtml += "<a href='<%=contextPath%>/archive/android'>Android</a>";
								} else if (item.category == 3) {
									appendHtml += "<a href='<%=contextPath%>/archive/db'>DB</a>";
								}
								appendHtml += "&nbsp;&nbsp;&nbsp;<span><i class='glyphicon glyphicon-eye-open'></i>&nbsp;&nbsp;" + item.beViewdNum + "</span>";
								appendHtml += "&nbsp;&nbsp;&nbsp;<span><i class='glyphicon glyphicon-tags'></i>&nbsp;&nbsp;";
								
								var tags = item.tags;
								for (var j = 0; j < tags.length; j++) {
									appendHtml += "&nbsp;&nbsp;<a href='<%=contextPath%>/archive/tag/" + tags[j].id + "' class='label label-info m-label-info'>" + tags[j].name + "</a>";	
								}
								
								var isUserLogined = $('#isUserLogined').val();
								if (isUserLogined.length > 0) {
									appendHtml += "<span class='pull-right'><a href='<%=contextPath%>/article/" + item.id + "/delete'>删除</a></span>";
									appendHtml += "<span class='pull-right m-pull-right'><a href='#' data-toggle='modal' data-target='#modal-edit' data-id='" + item.id + "'>编辑</a></span>";
								}
								
								appendHtml += "</span></span>";
								appendHtml += "</div>";
								// ========================================================
								appendHtml += "<div class='sub-article-body'>" + item.shortHtmlStr + "</div>";
								appendHtml += "<div>";
								appendHtml += "<a class='btn btn-success m-btn-success' href='<%=contextPath%>/article/" + item.id + "' role='button'>阅读全文&nbsp;»</a>";
								appendHtml += "</div>";
								appendHtml += "</div></div>";
								$('#article-container').append(appendHtml);
							});
							
							codeHighlighting();
							// 更新隐藏域当前页码
							$('#currentPage').val(currentPage)
						}
					});
					
					
				}
			});
			
			// 富文本编辑器
			$('#summernote').summernote({
				height : 600, // set editor height
				minHeight : null, // set minimum height of editor
				maxHeight : null, // set maximum height of editor
				focus : true, // set focus to editable area after initializing summernote
				toolbar : [], // 去除工具栏
				keyMap : {}
			});
			
		});
		
		/** 代码高亮 **/
		function codeHighlighting() {
			// 代码高亮
			$("pre").addClass("prettyprint");
			prettyPrint();
		}
		
	</script>
	<%@ include file="/includes/modal-article-edit-js.jsp"%>
</body>
</html>