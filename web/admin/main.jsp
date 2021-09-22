<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
</head>
<body>

<ul class="layui-nav" lay-filter="">
  <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/admin/main.jsp">首页</a></li>
  <li class="layui-nav-item">
    <a href="javascript:;">博客管理</a>
    <dl class="layui-nav-child"> <!-- 二级菜单 -->
      <dd><a href="${pageContext.request.contextPath}/admin/writeBlog.jsp">写博客</a></dd>
      <dd><a href="${pageContext.request.contextPath}/admin/blogManage.jsp">博客信息管理</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/admin/blogTypeManage.jsp">博客类别管理</a></li>
  <li class="layui-nav-item">
    <a href="javascript:;">评论管理</a>
    <dl class="layui-nav-child"> <!-- 二级菜单 -->
      <dd><a href="">评论审核</a></dd>
      <dd><a href="">评论信息管理</a></dd>
    </dl>
  </li>
  <li class="layui-nav-item"><a href="">个人信息管理</a></li>
  <li class="layui-nav-item"><a href="">系统管理</a></li>
  <li class="layui-nav-item" style="float: right !important;">
    <a href="">个人中心</a>
    <!--<dl class="layui-nav-child"> &lt;!&ndash; 二级菜单 &ndash;&gt;
        <dd><a href=""></a></dd>
        <dd><a href=""></a></dd>
    </dl>-->
  </li>
</ul>


<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.min.js"></script>

<script>

  layui.use('element', function(){
    var element = layui.element;
  });
</script>
</body>
</html>