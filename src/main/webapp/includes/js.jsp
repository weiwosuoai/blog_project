<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=contextPath%>/js/jquery/1.9.1/jquery-1.9.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<%=contextPath%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var type = $('#topNavType').val();
		$("#navbar").find("li").removeClass();

		if (type == 0) {
			$("#index").addClass("active");
		} else if (type == 1) {
			$("#all").addClass("active");
		} else if (type == 2) {
			$("#java-web").addClass("active");
		} else if (type == 3) {
			$("#android").addClass("active");
		}
	});
</script>