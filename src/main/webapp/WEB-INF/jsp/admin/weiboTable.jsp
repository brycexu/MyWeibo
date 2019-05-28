<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户管理</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="css/templatemo_main.css">
</head>

<body>

<div class="navbar" role="navigation">
    <div class="navbar-header">
        <div class="logo">
            <h1>微博后台管理</h1>
        </div>
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span> <span
                class="icon-bar"></span> <span class="icon-bar"></span> <span
                class="icon-bar"></span>
        </button>
    </div>
</div>
<div class="template-page-wrapper">
    <div class="navbar-collapse collapse templatemo-sidebar">
        <ul class="templatemo-sidebar-menu">
            <li><a href="${pageContext.request.contextPath}/recapitulation.action"><i class="fa fa-home"></i>概览</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/weiboManagement.action"><i class="fa fa-database"></i>微博管理</a></li>
            <li><a href="${pageContext.request.contextPath}/allUsers.action"><i class="fa fa-users"></i>用户管理</a></li>
            <li><a href="${pageContext.request.contextPath}/toUpdatePassword.action"><i class="fa fa-cog"></i>密码修改</a></li>
            <li><a href="javascript:" data-toggle="modal"
                   data-target="#confirmModal"><i class="fa fa-sign-out"></i>退出登录</a></li>
        </ul>
    </div>
    <!--/.navbar-collapse -->

    <div class="templatemo-content-wrapper">
        <div class="templatemo-content">

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
                        <!-- 删除操作按钮 -->
                        <form action="${pageContext.request.contextPath}/deleteWeiboByAdmin.action" method="get">
                            <input type="hidden" name="weiboId" value="${weibo.weiboId}">
                            <button type="submit">删除</button>
                        </form>
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
                </div>
            </c:forEach>
            <div class="container" style="width: auto; background-color: #fff;">
                <!-- 分页 -->
                <ul class="pagination pagination-lg">
                    <!-- 上一页 -->
                    <li><a href="queryAllWeiboNowByAdmin.action?pageNo=${page.pageNo-1 }">&laquo;</a></li>
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
                            <li><a href="queryAllWeiboNowByAdmin.action?pageNo=${i }">${i}</a></li>
                        </c:if>
                    </c:forEach>
                    <!-- 下一页 -->
                    <c:if test="${page.pageNo>=page.totalPage }">
                        <li><a href="#">&raquo;</a></li>
                    </c:if>
                    <c:if test="${page.pageNo<page.totalPage }">
                        <li><a href="queryAllWeiboNowByAdmin.action?pageNo=${page.pageNo+1 }">&raquo;</a></li>
                    </c:if>
                </ul>
            </div>

        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">你确定要退出登录吗?</h4>
                </div>
                <div class="modal-footer">
                    <a href="${pageContext.request.contextPath}/signin.action" class="btn btn-primary">Yes</a>
                    <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/templatemo_script.js"></script>

</body>
</html>
