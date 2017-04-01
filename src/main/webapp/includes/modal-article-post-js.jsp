<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	<!-- 模态框触发监听 -->
	$('#modal-article-post').on('show.bs.modal', function (event) {
		// ajax 异步获取分类信息
		$.ajax({
			type: "GET",
			async: true,
			url: "<%=contextPath%>/category/",
			datatype : "json",
			success : function(data) {
				// 1.先清除 select 中的数据
				$('#category').empty();
				// 2.动态填充
				$("#category").append("<option value=''>---请选择---</option>");
				$.each(data, function(i, item) {
					$("#category").append("<option value='" + item.id + "'>" + item.name + "</option>");	
				});
			}
		});

	});
</script>