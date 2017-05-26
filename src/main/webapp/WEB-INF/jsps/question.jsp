<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/includes/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>

    <%@ include file="/includes/header.jsp" %>
    <link href="<%=contextPath%>/css/question.css" rel="stylesheet">
    <link href="<%=contextPath%>/css/pagination.css" rel="stylesheet">

</head>
<body>

<%-- 头部导航栏 --%>
<%@ include file="/includes/nav-top.jsp" %>
<div class="main">
    <div class="container">
        <div class="row">
            <div class="right-container">
                <div class="page-header">
                    <h1>所有问答</h1>
                </div>

                <div class="questions">
                    <div class="question-summary">
                        <div class="question-meta-container">
                            <div class="statsarrow"></div>
                            <div class="stats">
                                <div class="vote">
                                    <div class="votes">

                                        <div class="vote-count-post high-scored-post"><strong>18031</strong>
                                            <span>赞</span></div>
                                    </div>
                                </div>
                                <div class="status answered-accepted">
                                    <strong>14</strong>回答
                                </div>
                            </div>
                            <div class="views supernova" title="994,420 views">
                                <span>994k</span><small>浏览</small>
                            </div>
                        </div>
                        <div class="summary">
                            <div class="bounty-indicator" title="this question has an open bounty worth 250 reputation">校译</div>
                            <h3><a href="#"
                                   class="question-hyperlink">Why is it faster to process a sorted array than an unsorted array?</a></h3>
                            <div class="excerpt">
                                Here is a piece of C++ code that seems very peculiar. For some strange reason, sorting the data miraculously makes the code almost six times faster.

                                #include &lt;algorithm&gt;
                                #include &lt;ctime&gt;
                                #...
                            </div>
                            <div class="tags">
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">java</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">c++</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">performance</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">optimization</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">branch-prediction</a>
                            </div>
                            <div class="user-info-container">
                                <div class="user-info">
                                    <div class="user-action-time">
                                        创建于
                                        <span title="2012-06-27 13:51:36Z" class="relativetime">2017-05-26 10:52</span>
                                    </div>
                                    <div class="user-gravatar">
                                        <a href="#"><div class="gravatar-wrapper-32"><img src="https://i.stack.imgur.com/FkjBe.png?s=32&amp;g=1" alt="" width="32" height="32"></div></a>
                                    </div>
                                    <div class="user-details">
                                        <a href="#">allen</a>
                                        <div class="honor-container">
                                            <span class="reputation-score" title="reputation score 252,355" dir="ltr">252k</span>
                                            <%--<span title="32 gold badges"><span class="badge1"></span><span class="badgecount">32</span></span><span title="372 silver badges"><span class="badge2"></span><span class="badgecount">372</span></span><span title="485 bronze badges"><span class="badge3"></span><span class="badgecount">485</span></span>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="question-summary" id="question-summary-11227809">
                        <div class="question-meta-container">
                            <div class="statsarrow"></div>
                            <div class="stats">
                                <div class="vote">
                                    <div class="votes">

                                        <div class="vote-count-post high-scored-post"><strong>18031</strong>
                                            <span>赞</span></div>
                                    </div>
                                </div>
                                <div class="status answered">
                                    <strong>14</strong>回答
                                </div>
                            </div>
                            <div class="views supernova" title="994,420 views">
                                <span>994k</span><small>浏览</small>
                            </div>
                        </div>
                        <div class="summary">
                            <div class="bounty-indicator" title="this question has an open bounty worth 250 reputation">校译</div>
                            <h3><a href="#"
                                   class="question-hyperlink">Why is it faster to process a sorted array than an unsorted array?</a></h3>
                            <div class="excerpt">
                                Here is a piece of C++ code that seems very peculiar. For some strange reason, sorting the data miraculously makes the code almost six times faster.

                                #include &lt;algorithm&gt;
                                #include &lt;ctime&gt;
                                #...
                            </div>
                            <div class="tags">
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">java</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">c++</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">performance</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">optimization</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">branch-prediction</a>
                            </div>
                            <div class="user-info-container">
                                <div class="user-info">
                                    <div class="user-action-time">
                                        创建于
                                        <span title="2012-06-27 13:51:36Z" class="relativetime">2017-05-26 10:52</span>
                                    </div>
                                    <div class="user-gravatar">
                                        <a href="#"><div class="gravatar-wrapper-32"><img src="https://i.stack.imgur.com/FkjBe.png?s=32&amp;g=1" alt="" width="32" height="32"></div></a>
                                    </div>
                                    <div class="user-details">
                                        <a href="#">allen</a>
                                        <div class="honor-container">
                                            <span class="reputation-score" title="reputation score 252,355" dir="ltr">252k</span>
                                            <%--<span title="32 gold badges"><span class="badge1"></span><span class="badgecount">32</span></span><span title="372 silver badges"><span class="badge2"></span><span class="badgecount">372</span></span><span title="485 bronze badges"><span class="badge3"></span><span class="badgecount">485</span></span>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="question-summary" >
                        <div class="question-meta-container">
                            <div class="statsarrow"></div>
                            <div class="stats">
                                <div class="vote">
                                    <div class="votes">

                                        <div class="vote-count-post high-scored-post"><strong>18031</strong>
                                            <span>赞</span></div>
                                    </div>
                                </div>
                                <div class="status answered-accepted">
                                    <strong>14</strong>回答
                                </div>
                            </div>
                            <div class="views supernova" title="994,420 views">
                                <span>994k</span><small>浏览</small>
                            </div>
                        </div>
                        <div class="summary">
                            <div class="bounty-indicator" title="this question has an open bounty worth 250 reputation">校译</div>
                            <h3><a href="#"
                                   class="question-hyperlink">Why is it faster to process a sorted array than an unsorted array?</a></h3>
                            <div class="excerpt">
                                Here is a piece of C++ code that seems very peculiar. For some strange reason, sorting the data miraculously makes the code almost six times faster.

                                #include &lt;algorithm&gt;
                                #include &lt;ctime&gt;
                                #...
                            </div>
                            <div class="tags">
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">java</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">c++</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">performance</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">optimization</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">branch-prediction</a>
                            </div>
                            <div class="user-info-container">
                                <div class="user-info">
                                    <div class="user-action-time">
                                        创建于
                                        <span title="2012-06-27 13:51:36Z" class="relativetime">2017-05-26 10:52</span>
                                    </div>
                                    <div class="user-gravatar">
                                        <a href="#"><div class="gravatar-wrapper-32"><img src="https://i.stack.imgur.com/FkjBe.png?s=32&amp;g=1" alt="" width="32" height="32"></div></a>
                                    </div>
                                    <div class="user-details">
                                        <a href="#">allen</a>
                                        <div class="honor-container">
                                            <span class="reputation-score" title="reputation score 252,355" dir="ltr">252k</span>
                                            <%--<span title="32 gold badges"><span class="badge1"></span><span class="badgecount">32</span></span><span title="372 silver badges"><span class="badge2"></span><span class="badgecount">372</span></span><span title="485 bronze badges"><span class="badge3"></span><span class="badgecount">485</span></span>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="question-summary" >
                        <div class="question-meta-container">
                            <div class="statsarrow"></div>
                            <div class="stats">
                                <div class="vote">
                                    <div class="votes">

                                        <div class="vote-count-post high-scored-post"><strong>18031</strong>
                                            <span>赞</span></div>
                                    </div>
                                </div>
                                <div class="status answered-accepted">
                                    <strong>14</strong>回答
                                </div>
                            </div>
                            <div class="views supernova" title="994,420 views">
                                <span>994k</span><small>浏览</small>
                            </div>
                        </div>
                        <div class="summary">
                            <div class="bounty-indicator" title="this question has an open bounty worth 250 reputation">校译</div>
                            <h3><a href="#"
                                   class="question-hyperlink">Why is it faster to process a sorted array than an unsorted array?</a></h3>
                            <div class="excerpt">
                                Here is a piece of C++ code that seems very peculiar. For some strange reason, sorting the data miraculously makes the code almost six times faster.

                                #include &lt;algorithm&gt;
                                #include &lt;ctime&gt;
                                #...
                            </div>
                            <div class="tags">
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">java</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">c++</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">performance</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">optimization</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">branch-prediction</a>
                            </div>
                            <div class="user-info-container">
                                <div class="user-info">
                                    <div class="user-action-time">
                                        创建于
                                        <span title="2012-06-27 13:51:36Z" class="relativetime">2017-05-26 10:52</span>
                                    </div>
                                    <div class="user-gravatar">
                                        <a href="#"><div class="gravatar-wrapper-32"><img src="https://i.stack.imgur.com/FkjBe.png?s=32&amp;g=1" alt="" width="32" height="32"></div></a>
                                    </div>
                                    <div class="user-details">
                                        <a href="#">allen</a>
                                        <div class="honor-container">
                                            <span class="reputation-score" title="reputation score 252,355" dir="ltr">252k</span>
                                            <%--<span title="32 gold badges"><span class="badge1"></span><span class="badgecount">32</span></span><span title="372 silver badges"><span class="badge2"></span><span class="badgecount">372</span></span><span title="485 bronze badges"><span class="badge3"></span><span class="badgecount">485</span></span>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="question-summary">
                        <div class="question-meta-container">
                            <div class="statsarrow"></div>
                            <div class="stats">
                                <div class="vote">
                                    <div class="votes">

                                        <div class="vote-count-post high-scored-post"><strong>18031</strong>
                                            <span>赞</span></div>
                                    </div>
                                </div>
                                <div class="status answered-accepted">
                                    <strong>14</strong>回答
                                </div>
                            </div>
                            <div class="views supernova" title="994,420 views">
                                <span>994k</span><small>浏览</small>
                            </div>
                        </div>
                        <div class="summary">
                            <div class="bounty-indicator" title="this question has an open bounty worth 250 reputation">校译</div>
                            <h3><a href="#"
                                   class="question-hyperlink">Why is it faster to process a sorted array than an unsorted array?</a></h3>
                            <div class="excerpt">
                                Here is a piece of C++ code that seems very peculiar. For some strange reason, sorting the data miraculously makes the code almost six times faster.

                                #include &lt;algorithm&gt;
                                #include &lt;ctime&gt;
                                #...
                            </div>
                            <div class="tags">
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">java</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">c++</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">performance</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">optimization</a>
                                <a href='#'
                                   style="margin-right: 3px;"
                                   class="label label-info m-label-info">branch-prediction</a>
                            </div>
                            <div class="user-info-container">
                                <div class="user-info">
                                    <div class="user-action-time">
                                        创建于
                                        <span title="2012-06-27 13:51:36Z" class="relativetime">2017-05-26 10:52</span>
                                    </div>
                                    <div class="user-gravatar">
                                        <a href="#"><div class="gravatar-wrapper-32"><img src="https://i.stack.imgur.com/FkjBe.png?s=32&amp;g=1" alt="" width="32" height="32"></div></a>
                                    </div>
                                    <div class="user-details">
                                        <a href="#">allen</a>
                                        <div class="honor-container">
                                            <span class="reputation-score" title="reputation score 252,355" dir="ltr">252k</span>
                                            <%--<span title="32 gold badges"><span class="badge1"></span><span class="badgecount">32</span></span><span title="372 silver badges"><span class="badge2"></span><span class="badgecount">372</span></span><span title="485 bronze badges"><span class="badge3"></span><span class="badgecount">485</span></span>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%--分页--%>
                <div id="pagination-container" style="margin-top: 30px; margin-bottom: 30px;" class="pull-right">
                    <input id="pageNum" type="hidden" name="pageNum" value="${pageInfo.pageNum}">
                    <input id="pageSize" type="hidden" name="pageSize" value="${pageInfo.pageSize}">
                    <input id="total" type="hidden" name="total" value="${pageInfo.total}">
                </div>
            </div>

            <%--右边栏--%>
            <div class="left-container">

                <div class="module" id="questions-count">
                    <div class="details">
                        <div class="summarycount pull-left">13,934,160</div>
                        <p>校译问题</p>
                    </div>


                    <div class="ask-question-container" role="navigation" aria-label="ask new question">
                        <a class="btn btn-success m-btn-success"
                        href="#"
                        role="button">我要校译</a>
                    </div>
                </div>

                <%--问题标签数量--%>
                <div class="related-tags" id="related-tags">

                    <h4 id="h-related-tags">相关标签</h4>
                    <div>
                        <a href='#'
                           style="margin-right: 3px;"
                           class="label label-info m-label-info">javascript</a>
                        &nbsp;<span class="item-multiplier"><span class="item-multiplier-x">×</span>&nbsp;
                        <span class="item-multiplier-count">1263163</span></span>
                    </div>
                    <div>
                        <a href='#'
                           style="margin-right: 3px;"
                           class="label label-info m-label-info">java</a>
                        &nbsp;<span class="item-multiplier"><span class="item-multiplier-x">×</span>&nbsp;
                        <span class="item-multiplier-count">1263163</span></span>
                    </div>
                    <div>
                        <a href='#'
                           style="margin-right: 3px;"
                           class="label label-info m-label-info">c#</a>
                        &nbsp;<span class="item-multiplier"><span class="item-multiplier-x">×</span>&nbsp;
                        <span class="item-multiplier-count">1263163</span></span>
                    </div>
                    <div>
                        <a href='#'
                           style="margin-right: 3px;"
                           class="label label-info m-label-info">android</a>
                        &nbsp;<span class="item-multiplier"><span class="item-multiplier-x">×</span>&nbsp;
                        <span class="item-multiplier-count">1263163</span></span>
                    </div>



                </div>


            </div>
        </div>



    </div>
    <%@ include file="/includes/footer.jsp" %>

</div>

<%@ include file="/includes/jquery-bootstrap-js.jsp" %>
<%@ include file="/includes/top-nav-js.jsp" %>
<%@ include file="/includes/top-progress.jsp" %>
<script src="<%=contextPath%>/js/pagination.js"></script>
<script type="text/javascript">

    $(function () {
        createPagination();
    });

    var container = $('#pagination-container');
    function createPagination() {
        var sources = function () {
            var result = [];

            var total = Number($('#total').val()) + 1;
            for (var i = 1; i < total; i++) {
                result.push(i);
            }

            return result;
        }();

        var options = {
            dataSource: sources,
            pageNumber: $('#pageNum').val(),

//            showGoButton: true,
//            showGoInput: true,
            showPrevious: true,
            showNext: true,
            pageSize: $('#pageSize').val(),
            callback: function (response, pagination) {
            }
        };
        container.pagination(options);

        //$.pagination(container, options);
        // 点击上一页
        container.addHook('afterPreviousOnClick', function () {
            getPageData();
        });
        // 点击下一页
        container.addHook('afterNextOnClick', function () {
            getPageData();
        });
        // 点击某一页
        container.addHook('afterPageOnClick', function () {
            getPageData();
        });

        return container;
    }

    function getPageData() {
        // 获取当前选中页码
        var pageNum = container.pagination('getSelectedPageNum');
        var pageSize = $('#pageSize').val();
        var search = $('#search').val();
        location.href = "questions?pageNum=" + pageNum + "&pageSize=" + pageSize + "&search=" + search;
    }
</script>
</body>
</html>