<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 模态框 --%>
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h3 class="modal-title" id="myModalLabel">
					<em>编辑 Markdown 文件</em>
				</h3>
			</div>
			<%-- 编辑的内容区域 --%>
			<div class="modal-body">
				<div id="summernote"></div>
			</div>
			<div class="modal-footer">
				<input type="hidden" id="article_id">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="button" class="btn btn-success"
					id="article_update_commit">确认修改</button>
			</div>
		</div>
	</div>
</div>