<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="<%=contextPath%>/js/summernote.js"></script>
<script type="text/javascript">
	<!-- 模态框触发监听 -->
	$('#myModal').on('show.bs.modal', function (event) {
		var btn = $(event.relatedTarget); // button that triggered the modal
		var article_id = btn.data('id'); // Extract info from data-* attributes
		// 对文章 id 隐藏域负值
		$('#article_id').val(article_id);
		$('.note-editable p').html('');
		// ajax 异步获取文章内容信息
		$.ajax({
			type: "GET",
			async: true,
			url: "<%=contextPath%>/article/" + article_id + "/md_content",
			datatype : "text",
			success : function(data) {
				$('.note-editable p').append(data);
			}
		});

	});
	
	$('#article_update_commit').click(function(){
		var article_html = $('.note-editable').html();
		var article_id = $('#article_id').val();
		// TODO 这里 json 传输出 bug, 后面在解决
		var data = {"content":article_html};
		
		// ajax 异步更新文章内容
		$.ajax({
			type: "POST",
			async: true,
			data: data,
			url: "<%=contextPath%>/article/" + article_id + "/update_md_content",
					success : function(data) {
						// 修改成功，重新加载页面
						location.reload();
					}
				});
			});
</script>