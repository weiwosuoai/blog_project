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
<link href="<%=contextPath%>/css/zoomify.css" rel="stylesheet">

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
				<!-- <div class="col-md-2"></div> -->
				<!-- 中间栏 -->
				<div class="col-md-9" role="main">
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
				<div class="col-md-3" role="complementary">
					<!-- 文章目录 -->
					<div class="span3">
						<div id="toc"></div>
					</div>
				</div>
				
				<!-- 回到顶部 -->
				<a class="to-top" data-toggle="tooltip" data-placement="left" title="">
					<i class="glyphicon glyphicon-menu-up"></i>
				</a>
			</div>
		</div>

		<%@ include file="/includes/modal-article-edit.jsp"%>
		<%@ include file="/includes/footer.jsp"%>
	</div>

	<%@ include file="/includes/jquery-bootstrap-js.jsp"%>
	<%@ include file="/includes/top-nav-js.jsp"%>
	<%@ include file="/includes/datetimepicker-js.jsp"%>
	<script src="<%=contextPath%>/js/jquery-ui-1.9.1.custom.min.js"></script>
	<script src="<%=contextPath%>/js/jquery.tocify.js"></script>
	<script src="<%=contextPath%>/google-code-prettify/prettify.js"></script>
	<script src="<%=contextPath%>/js/jquery.toTop.min.js"></script>
	<script src="<%=contextPath%>/js/zoomify.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#toc").tocify({
				selectors : "h2, h3, h4",
				// 关闭页面扩展(body下面多余的空白页)
				extendPage : false
			}).data("toc-tocify");

			// 代码高亮
			$("pre").addClass("prettyprint");
			prettyPrint();
			
			// 图片放大
			$('p img').zoomify();
			
			// 回到顶部
			// 可定制选项
	           $('.to-top').toTop({
	               //以下是选项默认参数，您可以根据自己的需求修改
	               autohide: true,  //是否自动隐藏
	               offset: 420,     //距离顶部多少距离时自动隐藏按钮
	               speed: 500,      //滚动持续时间
	               position:true,   //如果设置为 false，则需要手动在 css 中设置“按钮”的位置
	               right: 30,       //右侧距离
	               bottom: 120       //底部距离
	           });
	           $('[data-toggle="tooltip"]').tooltip()
	           
			
			// ajax 为查看的文章，被浏览数增1
			$.ajax({
				type: "POST",
				async: true,
				url: "<%=contextPath%>/articles/${article.id}/viewd_increment",
				success: function(data) {
						}
					});
			
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
	<%@ include file="/includes/modal-article-edit-js.jsp"%>
</body>
</html>