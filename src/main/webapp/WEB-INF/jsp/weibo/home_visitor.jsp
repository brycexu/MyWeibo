<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>发现新鲜事</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/css/login.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/css/comment.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/css/style.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/css/webuploader.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/css/upload.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/css/zoomify.min.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/jquery-1.12.0.min.js "></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/upload.js "></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/longPolling.js "></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#bt0").click(function() {
                $("#com0").toggle();
            });
            $("#bt1").click(function() {
                $("#com1").toggle();
            });
            $("#bt2").click(function() {
                $("#com2").toggle();
            });
            $("#bt3").click(function() {
                $("#com3").toggle();
            });
            $("#bt4").click(function() {
                $("#com4").toggle();
            });
            $("#bt5").click(function() {
                $("#com5").toggle();
            });
            $("#bt6").click(function() {
                $("#com6").toggle();
            });
            $("#bt7").click(function() {
                $("#com7").toggle();
            });
            $("#bt8").click(function() {
                $("#com8").toggle();
            });
            $("#bt9").click(function() {
                $("#com9").toggle();
            });
        })
    </script>
</head>
<body style="padding: 20px">


<!-- 正文 -->
<div class="container">
    <!-- 右侧个人简单信息 -->
    <div style="width: 20%; float: right; background-color: #fff;height: 180px;">
        <!-- 头像 -->
        <img src="/imgUpload/${user.face}" style="margin-top: 20px;"
             height="90px " width="90px" class="img-circle " align="center">
        <!-- 昵称 -->
        <br> <br> <span style="font-size: 20px; padding-left:15px">${user.nickname}&nbsp;&nbsp;</span>
        <br> <br>
    </div>

    <!-- 左侧导航栏 -->
    <div style="width: 8%; float: left; margin-right: 10px; background-color: #fff;">
        <ul class="nav navbar-nav navbar-left">
            <li style="width: 100%"><a href="${pageContext.request.contextPath }/login.action">登录</a></li>
            <li style="width: 100%"><a href="${pageContext.request.contextPath }/goregister.action">注册</a></li>
        </ul>
    </div>

    <!-- 微博内容 -->
    <div style="width: 70%; float: left;">
        <!-- 发送新微博 -->
        <div class="container" style="width: auto; background-color: #fff;">
            <br><br>
            <p style="font-size: 40px; color: black">分享新鲜事</p>
        </div>

        <c:forEach items="${weiboList }" var="weibo" varStatus="status">
            <div id="weiboItem">
                <!-- 头部 -->
                <div class="container"
                     style="width: auto; background-color: white;">
                    <!-- 头像 -->
                    <div
                            style="cursor: pointer; height: 50px; width: 50px; margin: 10px; float: left;">
                        <c:if test="${weibo.user.userId==user.userId}">
                            <img onclick="javascript:clickme();"
                                 src="/imgUpload/${weibo.user.face}" width="50px" height="50px"
                                 class="img-circle">
                        </c:if>
                        <c:if test="${weibo.user.userId!=user.userId}">
                            <img onclick="javascript:clickother(${weibo.user.userId});"
                                 src="/imgUpload/${weibo.user.face}" width="50px" height="50px"
                                 class="img-circle">
                        </c:if>
                    </div>
                    <!-- 昵称+日期 -->
                    <div
                            style="text-align: left; margin: 10px; margin-left: 20px; float: left;">
                        <a style="color: #333; font-size: 20px" href="javascrip:void(0);">${weibo.user.nickname }</a><br>
                        <span style="color: #333; font-size: 15px">${weibo.date }</span>
                    </div>
                </div>
                <!-- 内容 -->
                <div class="container"
                     style="width: auto; background-color: #fff;">
                    <!-- 文字 -->
                    <!-- onclick="javascript:clickWeibo(${weibo.weiboId});" -->
                    <div style="text-align: left; margin-left: 85px">
                        <p style="color: #333; font-size: 17px">${weibo.content }</p>
                    </div>
                    <!-- 原创微博 -->
                    <c:if test="${weibo.original == 1 }">
                        <!-- 图片 -->
                        <div class="example"
                             style="margin-left: 85px; margin-bottom: 20px;">
                            <table>
                                <tr>
                                    <c:if test="${weibo.pic1!=null }">
                                        <td><img src="/imgUpload/${weibo.pic1 }"
                                                 style="width: 130px; height: 130px"></td>
                                    </c:if>
                                    <c:if test="${weibo.pic2!=null }">
                                        <td><img src="/imgUpload/${weibo.pic2 }"
                                                 style="width: 130px; height: 130px"></td>
                                    </c:if>
                                    <c:if test="${weibo.pic3!=null }">
                                        <td><img src="/imgUpload/${weibo.pic3 }"
                                                 style="width: 130px; height: 130px"></td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <c:if test="${weibo.pic4!=null }">
                                        <td><img src="/imgUpload/${weibo.pic4 }"
                                                 style="width: 130px; height: 130px"></td>
                                    </c:if>
                                    <c:if test="${weibo.pic5!=null }">
                                        <td><img src="/imgUpload/${weibo.pic5 }"
                                                 style="width: 130px; height: 130px"></td>
                                    </c:if>
                                    <c:if test="${weibo.pic6!=null }">
                                        <td><img src="/imgUpload/${weibo.pic6 }"
                                                 style="width: 130px; height: 130px"></td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <c:if test="${weibo.pic7!=null }">
                                        <td><img src="/imgUpload/${weibo.pic7 }"
                                                 style="width: 130px; height: 130px"></td>
                                    </c:if>
                                    <c:if test="${weibo.pic8!=null }">
                                        <td><img src="/imgUpload/${weibo.pic8 }"
                                                 style="width: 130px; height: 130px"></td>
                                    </c:if>
                                    <c:if test="${weibo.pic9!=null }">
                                        <td><img src="/imgUpload/${weibo.pic9 }"
                                                 style="width: 130px; height: 130px"></td>
                                    </c:if>
                                </tr>
                            </table>
                        </div>
                    </c:if>
                </div>

                <!-- 非原创 转发微博 -->
                <c:if test="${weibo.original == 0 }">
                    <!-- 头部 -->
                    <div class="container"
                         style="width: auto; background-color: #eaeaec;">
                        <!-- 头像 -->
                        <div
                                style="cursor: pointer; height: 30px; width: 30px; margin: 10px; float: left; margin-left: 100px;">

                            <c:if test="${weibo.repost.user.userId==user.userId }">
                                <img onclick="javascript:clickme();"
                                     src="/imgUpload/${weibo.repost.user.face}" width="40px"
                                     height="40px" class="img-circle">
                            </c:if>
                            <c:if test="${weibo.repost.user.userId!=user.userId }">
                                <img
                                        onclick="javascript:clickother(${weibo.repost.user.userId});"
                                        src="/imgUpload/${weibo.repost.user.face}" width="40px"
                                        height="40px" class="img-circle">
                            </c:if>
                        </div>
                        <!-- 昵称+日期 -->
                        <div
                                style="text-align: left; margin: 10px; margin-left: 20px; float: left;">
                            <a style="color: #333; font-size: 14px" href="javascrip:;">${weibo.repost.user.nickname }</a><br>
                            <span style="color: #333; font-size: 10px">${weibo.repost.date }</span>
                        </div>
                    </div>
                    <div class="container"
                         style="width: auto; background-color: #eaeaec;">
                        <!-- 文字 -->
                        <!-- onclick="javascript:clickWeibo(${weibo.weiboId});" -->
                        <div style="text-align: left; margin-left: 160px">
                            <p style="color: #333; font-size: 17px">${weibo.repost.content }</p>
                        </div>
                        <!-- 图片 -->
                        <div class="example"
                             style="margin-left: 160px; margin-bottom: 20px;">
                            <table>
                                <tr>
                                    <c:if test="${weibo.repost.pic1!=null }">
                                        <td><img src="/imgUpload/${weibo.repost.pic1 }"
                                                 style="width: 90px; height: 90px"></td>
                                    </c:if>
                                    <c:if test="${weibo.repost.pic2!=null }">
                                        <td><img src="/imgUpload/${weibo.repost.pic2 }"
                                                 style="width: 90px; height: 90px"></td>
                                    </c:if>
                                    <c:if test="${weibo.repost.pic3!=null }">
                                        <td><img src="/imgUpload/${weibo.repost.pic3 }"
                                                 style="width: 90px; height: 90px"></td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <c:if test="${weibo.repost.pic4!=null }">
                                        <td><img src="/imgUpload/${weibo.repost.pic4 }"
                                                 style="width: 90px; height: 90px"></td>
                                    </c:if>
                                    <c:if test="${weibo.repost.pic5!=null }">
                                        <td><img src="/imgUpload/${weibo.repost.pic5 }"
                                                 style="width: 90px; height: 90px"></td>
                                    </c:if>
                                    <c:if test="${weibo.repost.pic6!=null }">
                                        <td><img src="/imgUpload/${weibo.repost.pic6 }"
                                                 style="width: 90px; height: 90px"></td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <c:if test="${weibo.repost.pic7!=null }">
                                        <td><img src="/imgUpload/${weibo.repost.pic7 }"
                                                 style="width: 90px; height: 90px"></td>
                                    </c:if>
                                    <c:if test="${weibo.repost.pic8!=null }">
                                        <td><img src="/imgUpload/${weibo.repost.pic8 }"
                                                 style="width: 90px; height: 90px"></td>
                                    </c:if>
                                    <c:if test="${weibo.repost.pic9!=null }">
                                        <td><img src="/imgUpload/${weibo.repost.pic9 }"
                                                 style="width: 90px; height: 90px"></td>
                                    </c:if>
                                </tr>
                            </table>
                        </div>
                    </div>
                </c:if>
                <!-- 底部 -->
                <div class="container"
                     style="width: auto; background-color: #fff;">
                    <br>
                    <div class="alert alert-success" role="alert" style="width: 100%">
                        登录用户才能进行收藏评论点赞,请先
                        <a href="${pageContext.request.contextPath }/login.action" class="alert-link">登录</a>
                        或
                        <a href="${pageContext.request.contextPath }/goregister.action" class="alert-link">注册</a>
                    </div>
                </div>
            </div>
        </c:forEach>
        <div class="container" style="width: auto; background-color: #fff;">
            <!-- 分页 -->
            <ul class="pagination pagination-lg">
                <!-- 上一页 -->
                <li><a href="queryAllWeiboNow.action?pageNo=${page.pageNo-1 }">&laquo;</a></li>
                <c:choose>
                    <%-- 第一条：如果总页数<=5，那么页码列表为1 ~ tp --%>
                    <c:when test="${page.totalPage <= 5 }">
                        <c:set var="begin" value="1" />
                        <c:set var="end" value="${page.totalPage }" />
                    </c:when>
                    <c:otherwise>
                        <%-- 第二条：按公式计算，让列表的头为当前页+2；列表的尾为当前页+2 --%>
                        <c:set var="begin" value="${page.pageNo-2 }" />
                        <c:set var="end" value="${page.pageNo+2 }" />

                        <%-- 第三条：第二条只适合在中间，而两端会出问题。这里处理begin出界！ --%>
                        <%-- 如果begin<1，那么让begin=1，相应end=10 --%>
                        <c:if test="${begin<1 }">
                            <c:set var="begin" value="1" />
                            <c:set var="end" value="5" />
                        </c:if>
                        <%-- 第四条：处理end出界。如果end>tp，那么让end=tp，相应begin=tp-4 --%>
                        <c:if test="${end>page.totalPage }">
                            <c:set var="begin" value="${page.totalPage-4 }" />
                            <c:set var="end" value="${page.totalPage }" />
                        </c:if>
                    </c:otherwise>
                </c:choose>
                <c:forEach begin="${begin}" end="${end}" var="i">
                    <c:if test="${i==page.pageNo }">
                        <li class="active"><a href="#">${i}</a></li>
                    </c:if>
                    <c:if test="${i!=page.pageNo }">
                        <li><a href="queryAllWeiboNow.action?pageNo=${i }">${i}</a></li>
                    </c:if>
                </c:forEach>
                <!-- 下一页 -->
                <c:if test="${page.pageNo>=page.totalPage }">
                    <li><a href="#">&raquo;</a></li>
                </c:if>
                <c:if test="${page.pageNo<page.totalPage }">
                    <li><a href="queryAllWeiboNow.action?pageNo=${page.pageNo+1 }">&raquo;</a></li>
                </c:if>
            </ul>
        </div>

    </div>
</div>

<script type="text/javascript "
        src="${pageContext.request.contextPath }/js/jquery-3.3.1.js "></script>
<script type="text/javascript "
        src="${pageContext.request.contextPath }/js/bootstrap.js "></script>
<script type="text/javascript "
        src="${pageContext.request.contextPath }/js/bootstrap-datetimepicker.js "></script>
<script type="text/javascript "
        src="${pageContext.request.contextPath }/js/bootstrap-datetimepicker.zh-CN.js "></script>
<script type="text/javascript "
        src="${pageContext.request.contextPath }/js/date.js "></script>
<script type="text/javascript "
        src="${pageContext.request.contextPath }/js/jquery.flexText.js "></script>
<script type="text/javascript "
        src="${pageContext.request.contextPath }/js/webuploader.js"></script>
<script type="text/javascript "
        src="${pageContext.request.contextPath }/js/comment.js"></script>
<script type="text/javascript "
        src="${pageContext.request.contextPath }/js/zoomify.js"></script>
<script type="text/javascript">
    $('.example img').zoomify();

    // 长轮询
    $.ajax(getNotice);
</script>
</body>

</html>
