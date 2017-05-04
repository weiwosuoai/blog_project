<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script type="text/javascript">
    <%-- 模态框触发监听 --%>
    $('#modal-delete').on('show.bs.modal', function (event) {
        var btn = $(event.relatedTarget); // button that triggered the modal
        var article_id = btn.data('id'); // Extract info from data-* attributes

        // 对文章 id 隐藏域负值
        $('#article_id').val(article_id);
        $('#btn-delete').click(function () {
            var id = $('#article_id').val();
            // asynchronous delete the article by Ajax.
            $.ajax({
                type: "DELETE",
                async: true,
                url: "<%=contextPath%>/articles/" + article_id,
                success: function (data) {
                    // step1 : dismiss the modal.
                    $('#modal-delete').modal('hide');
                    // step2 : redirect to the index page.
                    window.location.href = "/index";
                }
            });
        });
    });
</script>