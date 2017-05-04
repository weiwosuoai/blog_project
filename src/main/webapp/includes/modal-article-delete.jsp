<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 模态框 --%>
<div class="modal fade bs-example-modal-sm" id="modal-delete" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header m-modal-header-login">
				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<p class="content-danger">您确定要删除这篇博文吗?</p>
			<div class="modal-body">
                <input type="hidden" id="article_id">
				<button class="btn btn-block m-btn-danger" id="btn-delete">确认删除</button>
			</div>
		</div>
	</div>
</div>