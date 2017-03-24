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
<link href="<%=contextPath%>/css/summernote.css" rel="stylesheet">

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
							<%@ include file="/includes/article-meta.jsp"%>
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

		<%@ include file="/includes/edit-modal.jsp"%>
		<%@ include file="/includes/footer.jsp"%>
	</div>

	<%@ include file="/includes/top-nav-js.jsp"%>
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