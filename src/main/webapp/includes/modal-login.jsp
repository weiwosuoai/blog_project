<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 模态框 --%>
<div class="modal fade bs-example-modal-sm" id="modal-login" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-sm m-modal-login" role="document">
		<div class="modal-content">
			<div class="modal-header m-modal-header-login">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
<!-- 				<h4 class="modal-title" id="myModalLabel"> -->
<!-- 					登录 Exception -->
<!-- 				</h4> -->
			</div>
			<%-- 登录表单 --%>
			<div class="modal-body m-modal-body-login" >
				<div class="login-title">
					<h2>Exception</h2>
				</div>
				<form action="<%=contextPath%>/sys/login" method="post">
					<div class="form-group">
<!-- 						<label for="username">用户名</label> -->
						<input class="form-control" placeholder="用户名" name="name">
					</div>
					<div class="form-group">
						 <input type="password"
							class="form-control" placeholder="密码" name="password">
					</div>
					<button type="submit" class="btn btn-success btn-block login-btn">登&nbsp;&nbsp;录</button>
				</form>
				<div class="login-footer">
					<a href="#">忘记密码»</a>
					<span class="pull-right">还没有账号?<a href="#">点击注册</a></span>
				</div>
			</div>
		</div>
	</div>
</div>