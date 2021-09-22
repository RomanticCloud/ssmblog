<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.css">
</head>
<body>
<div id="addDlg">
    <form id="fm" method="post" target="_parent" action="${pageContext.request.contextPath}/admin/blogType/save">
        <div class="layui-form-item" style="margin-top: 40px">
            <label class="layui-form-label" style="width: 120px">博客类型名称:</label>
            <div class="layui-input-block">
                <input type="text" id="typeName" name="typeName" class="layui-input" style="width: 90%" required>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 120px">博客类型排序:</label>
            <div class="layui-input-block">
                <input type="text" id="orderNo" name="orderNo" class="layui-input" style="width: 90%" required>
            </div>
        </div>
        <input type="submit" class="layui-btn layui-btn-normal" id="save" value="保存" style="margin: auto;display: block"/>
        <span class="layui-layer-resize"></span>
    </form>
</div>


<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.min.js"></script>
<script>

</script>
</body>
</html>
