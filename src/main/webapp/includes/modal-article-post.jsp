<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 模态框 --%>
<div class="modal fade" id="modal-article-post" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
					发表博客
				</h4>
			</div>
			<%-- 提交博客表单 --%>
			<div class="modal-body" >
				<form action="<%=contextPath%>/sys/post"
							enctype="multipart/form-data" method="post">
							<div class="form-group">
								<label for="username">文章标题</label> <input class="form-control"
									placeholder="文章标题" name="title">
							</div>
							<div class="form-group">
								<label for="password">所属分类</label> <select class="form-control"
									name="category" id="category">
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