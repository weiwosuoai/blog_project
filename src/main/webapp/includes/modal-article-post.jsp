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
				<h4 class="modal-title" id="myModalLabel">添加博文标题、分类、标签</h4>
			</div>
			<%-- 提交博客表单 --%>
			<div class="modal-body">
				<form id="article_form" action="<%=contextPath%>/articles" method="post">
                    <div style="display: none;">
                        <textarea id="content" name="content"></textarea>
                    </div>
					<div class="form-group">
						<label>文章标题</label> <input class="form-control"
							placeholder="文章标题" name="title">
					</div>
					<div class="form-group">
						<label>所属分类</label> <select class="form-control"
							name="category" id="category">
<!-- 																<option value="5">Java</option> -->
						</select>
					</div>
					<div class="form-group">
						<label>添加标签</label>
						<div class="panel panel-default">
							<div class="panel-body" >
								<div class="checkbox" id="modal-tags" style="margin-top: 0; margin-bottom: 0">
								</div>
<!-- 								<input type="checkbox"> 工具 -->
<!-- 								<a class="label label-info m-label-info">工具</a> -->
							</div>
						</div>
					</div>
					<%--<div class="form-group post-time">--%>
						<%--<label for="post_time">发表时间</label>--%>
						<%--<div class="input-group date form_datetime"--%>
							<%--data-date-format="yyyy-mm-dd hh:ii:ss"--%>
							<%--data-link-field="dtp_input1">--%>
							<%--<input class="form-control" size="16" type="text" value=""--%>
								<%--readonly> <span class="input-group-addon"><span--%>
								<%--class="glyphicon glyphicon-remove"></span></span> <span--%>
								<%--class="input-group-addon"><span--%>
								<%--class="glyphicon glyphicon-th"></span></span>--%>
						<%--</div>--%>
						<%--<input type="hidden" id="dtp_input1" value="" name="createTime" /><br />--%>
					<%--</div>--%>

					<%--<div class="form-group">--%>
						<%--<label for="postFile">上传 Markdown 文件</label> <input type="file"--%>
							<%--id="postFile" name="files">--%>
						<%--<p class="help-block">这里提交 Markdown 文件.</p>--%>
					<%--</div>--%>
					<button type="button"
						class="btn btn-success btn-block sys-login-btn" onclick="publishArticle()">确认发布</button>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
    <%--确认发布博文--%>
	function publishArticle() {
        // 异步发布博文
        $.ajax({
            type: "POST",
            async: true,
            url: "<%=contextPath%>/articles",
            datatype : "text",
            data: $('#article_form').serialize(),
            success : function(data) {
                // step1 : dismiss the modal.
                $('#modal-article-post').modal('hide');
                // step2 : prompt the user that was successed.
                alert('发布成功');
                $('#wmd-input').val('');
                $('#wmd-preview').empty();
            }
        });
	}
</script>