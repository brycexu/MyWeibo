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
            <li><a href="${pageContext.request.contextPath}/weiboManagement.action"><i class="fa fa-database"></i>微博管理</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/allUsers.action"><i class="fa fa-user"></i>用户管理</a></li>
            <li><a href="${pageContext.request.contextPath}/toUpdatePassword.action"><i class="fa fa-cog"></i>密码修改</a></li>
            <li><a href="javascript:" data-toggle="modal"
                   data-target="#confirmModal"><i class="fa fa-sign-out"></i>退出登录</a></li>
        </ul>
    </div>
    <!--/.navbar-collapse -->

    <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
            <table class="table">
                <thead>
                    <tr>
                        <th>用户名</th>
                        <th>密码</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>籍贯</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                        <c:forEach items="${userList }" var="user" varStatus="status">
                            <tr>
                                <th> ${user.getUsername()} </th>
                                <th> ${user.getPassword()} </th>
                                <c:if test="${user.sex==0 }">
                                    <th>女</th>
                                </c:if>
                                <c:if test="${user.sex==1 }">
                                    <th>男</th>
                                </c:if>
                                <th> ${user.age} </th>
                                <th> ${user.p}${user.c} </th>
                                <th>
                                    <form action="${pageContext.request.contextPath}/deleteUser.action" method="post">
                                        <input type="hidden" name="username" value="${user.getUsername()}">
                                        <button type="submit">删除</button>
                                    </form>
                                </th>
                            </tr>
                        </c:forEach>
                </tbody>
            </table>
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
