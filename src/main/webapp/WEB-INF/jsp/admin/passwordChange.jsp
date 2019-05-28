<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>密码修改</title>
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
            <li><a href="${pageContext.request.contextPath }/allUsers.action"><i class="fa fa-user"></i>用户管理</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/toUpdatePassword.action"><i class="fa fa-cog"></i>密码修改</a></li>
            <li><a href="javascript:" data-toggle="modal"
                   data-target="#confirmModal"><i class="fa fa-sign-out"></i>退出登录</a></li>
        </ul>
    </div>
    <!--/.navbar-collapse -->

    <div class="templatemo-content-wrapper">
        <div class="templatemo-content">
            <br>
            <br>
            <br>
            <div class="cover-container" style="margin-left: 0px;">
                <form class="form-horizontal" action="${pageContext.request.contextPath }/updatePassword.action" method="post">
                    <span id="error_username" style="color: #ff5b5b; font-size: 17px">${error_old}</span>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">原密码</label>
                        <div class="col-sm-5">
                            <input name="oldpw" type="password" class="form-control" style="width: 68%">
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">新密码</label>
                        <div class="col-sm-5">
                            <input id="newpw1" name="newpw1" type="password" class="form-control" style="width: 68%">
                        </div>
                    </div>
                    <br>
                    <span id="error_new" style="color: #ff5b5b; font-size: 17px">${error_new}</span>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">再次输入新密码</label>
                        <div class="col-sm-5">
                            <input oninput="javascript:check_password();" name="newpw2" id="newpw2" type="password" class="form-control" style="width: 68%">
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-2">
                            <button type="submit" class="btn btn-lg btn-success" style="padding: 10px 55px;">确认更改</button>
                        </div>
                    </div>
                </form>
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

<script type="text/javascript">
    function check_password(){
        var pw1 = $("#newpw1").val();
        var pw2 = $("#newpw2").val();
        if(pw1 != pw2){
            $("#error_new").text("两次输入的新密码不一致");
        }else{
            $("#error_new").text("");
        }
    }
</script>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/templatemo_script.js"></script>

</body>
</html>
