<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/includes/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/includes/header.jsp"%>
<link href="<%=contextPath%>/css/sys-post-view.css" rel="stylesheet">
<link href="<%=contextPath%>/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
</head>
<body>

	<div class="main">
		<div class="container">
			<div class="row">
				<!-- 左边栏 -->
				<div class="col-md-2 sidebar">
<!-- 					<ul class="nav nav-sidebar"> -->
<!-- 						<li class="active"><a href="#">Overview <span -->
<!-- 								class="sr-only">(current)</span></a></li> -->
<!-- 						<li><a href="#">Reports</a></li> -->
<!-- 						<li><a href="#">Analytics</a></li> -->
<!-- 						<li><a href="#">Export</a></li> -->
<!-- 					</ul> -->
<!-- 					<ul class="nav nav-sidebar"> -->
<!-- 						<li><a href="">Nav item</a></li> -->
<!-- 						<li><a href="">Nav item again</a></li> -->
<!-- 						<li><a href="">One more nav</a></li> -->
<!-- 						<li><a href="">Another nav item</a></li> -->
<!-- 						<li><a href="">More navigation</a></li> -->
<!-- 					</ul> -->
<!-- 					<ul class="nav nav-sidebar"> -->
<!-- 						<li><a href="">Nav item again</a></li> -->
<!-- 						<li><a href="">One more nav</a></li> -->
<!-- 						<li><a href="">Another nav item</a></li> -->
<!-- 					</ul> -->
				</div>

				<!-- 右边栏 -->
				<div class="col-md-9">
					<div class="sys-login-title">
						<h1>发表文章</h1>
					</div>
					<!-- 登录表单 -->
					<div class="sys-login-form">
						<form action="<%=contextPath%>/sys/post"
							enctype="multipart/form-data" method="post">
							<div class="form-group">
								<label for="username">文章标题</label> <input class="form-control"
									placeholder="文章标题" name="title">
							</div>
							<div class="form-group">
								<label for="password">所属分类</label> <select class="form-control"
									name="category">
									<option value="1">Java</option>
									<option value="2">Android</option>
									<option value="3">DB</option>
								</select>
							</div>
							<div class="form-group post-time">
								<label for="post_time">发表时间</label>
								<div class="input-group date form_datetime"
									data-date-format="yyyy-mm-dd hh:ii:ss"
									data-link-field="dtp_input1">
									<input class="form-control" size="16" type="text" value=""
										readonly> <span class="input-group-addon"><span
										class="glyphicon glyphicon-remove"></span></span> <span
										class="input-group-addon"><span
										class="glyphicon glyphicon-th"></span></span>
								</div>
								<input type="hidden" id="dtp_input1" value="" name="createTime" /><br />
							</div>

							<div class="form-group">
								<label for="postFile">上传 Markdown 文件</label> <input type="file"
									id="postFile" name="files">
								<p class="help-block">这里提交 Markdown 文件.</p>
							</div>
							<button type="submit"
								class="btn btn-success btn-block sys-login-btn">确认发表</button>
						</form>
					</div>
				</div>
			</div>



		</div>
		<%@ include file="/includes/footer.jsp"%>

	</div>
	<!-- 日期选择器 -->
	<script src="<%=contextPath%>/js/bootstrap-datetimepicker.min.js"
		charset="UTF-8"></script>
	<script src="<%=contextPath%>/js/bootstrap-datetimepicker.zh-CN.js"
		charset="UTF-8"></script>
	<script type="text/javascript">
		$('.form_datetime').datetimepicker({
			language : 'zh-CN',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			forceParse : 0,
			showMeridian : 1
		});
	</script>
</body>
</html>