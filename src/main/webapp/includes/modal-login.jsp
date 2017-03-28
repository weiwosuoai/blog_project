<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 模态框 --%>
<div class="modal fade bs-example-modal-sm" id="modal-login" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-sm m-modal-login" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
					登录 Exception
				</h4>
			</div>
			<%-- 登录表单 --%>
			<div class="modal-body" >
				<form action="<%=contextPath%>/sys/login" method="post">
					<div class="form-group">
						<label for="username">用户名</label>
						<input class="form-control" placeholder="用户名" name="name">
					</div>
					<div class="form-group">
						<label for="password">密码</label> <input type="password"
							class="form-control" placeholder="密码" name="password">
					</div>
					<button type="submit" class="btn btn-success btn-block sys-login-btn">登录</button>
				</form>
			</div>
		</div>
	</div>
</div>