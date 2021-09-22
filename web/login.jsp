<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人博客系统登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">

</head>
<body>

<div style="background-color: #9ce8d4;width: 25%;margin-left: auto;margin-right: auto;margin-top: 15%;padding: 50px;border:transparent solid">
    <form class="layui-form" action="${pageContext.request.contextPath}/blogger/login" method="post" onsubmit="return checkForm()">
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 20px"><i class="layui-icon layui-icon-username"></i></label>
            <div class="layui-input-block" style="margin-left: 75px">
                <input type="text" class="layui-input" id="username" name="username" value="${user}" placeholder="请输入用户名">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 20px"><i class="layui-icon layui-icon-password"></i></label>
            <div class="layui-input-block" style="margin-left: 75px">
                <input type="password" class="layui-input" id="password" name="password" placeholder="请输入密码">
            </div>
        </div>
        <span id="error" style="color: red;margin-left: auto;margin-right: auto;display: table">${errorInfo}</span>
        <hr>
        <span style="float: left">
          <a href="${pageContext.request.contextPath}/index.jsp" style="text-decoration: none;color:inherit">首页</a>
        </span>
        <div class="layui-btn-container" style="float: right !important;">
            <button type="submit" class="layui-btn layui-btn-danger">登录</button>
        </div>
    </form>
</div>


<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.min.js"></script>

<script>
    function checkForm(){
        var username=$("#username").val();
        var password=$("#password").val();
        if (username==null||username===""){
            $("#error").html("用户名不能为空！")
            return false;
        }
        if (password==null||password===""){
            $("#error").html("密码不能为空！")
            return false;
        }
        return true;
    }

</script>
</body>
</html>
