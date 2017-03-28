<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
