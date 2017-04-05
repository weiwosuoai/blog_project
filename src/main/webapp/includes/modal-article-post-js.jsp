<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	<!-- 模态框触发监听 -->
	<%-- bug 总结
		show.bs.modal ： show 方法调用之后立即触发该事件。如果是通过点击某个作为触发器的元素，
											则此元素可以通过事件的 relatedTarget 属性进行访问。
		回调时间设置为 show.bs.modal 时，每当点击 modal 中的 datetimepicker 插件时，show.bs.modal
		回调再次被调用，导致已选择的 checkbox, select 元素被置空
		
		shown.bs.modal ： 此事件在模态框已经显示出来（并且同时在 CSS 过渡效果完成）之后被触发。
							如果是通过点击某个作为触发器的元素，则此元素可以通过事件的 relatedTarget 属性进行访问。
							
		换成 shown.bs.modal 后，确保不会再次异步请求后台									
	--%>
	$('#modal-article-post').on('shown.bs.modal', function (event) {
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
				$("#category").append("<option value='' selected='selected'>---请选择---</option>");
				$.each(data, function(i, item) {
					$("#category").append("<option value='" + item.id + "'>" + item.name + "</option>");	
				});
			}
		});
		
		// ajax 异步获取标签选项
		$.ajax({
			type: "GET",
			async: true,
			url: "<%=contextPath%>/tags",
			datatype : "json",
			success : function(data) {
				// 1.先清除 checkbox 数据
				$('#modal-tags').empty();
				$.each(data, function(i, item) {
					$('#modal-tags').append("<label><input type='checkbox' name='postTags' value='" + item.id + "'>" + item.name + "</label>&nbsp;&nbsp;");
				});
			}
		});

	});
</script>