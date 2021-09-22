<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>写博客</title>
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
<div class="layui-container" style="padding: 20px">
    <form class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <label class="layui-form-label">博客标题</label>
            <div class="layui-input-inline">
                <input type="text" id="title" name="title" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">博客类型</label>
            <div class="layui-input-inline">
                <input type="text" id="type" name="type" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div>
            <label class="layui-form-label" style="float: none">博客内容</label>
            <textarea id="content" name="content" style="display: none;"></textarea>
        </div>

        <div class="layui-form-item" style="margin-top: 30px">
            <label class="layui-form-label">关键字</label>
            <div class="layui-input-inline">
                <input type="text" id="keywords" name="keywords" placeholder="请输入" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <button type="button" class="layui-btn layui-btn-normal layui-btn-lg" onclick="submitData()" lay-filter="" style="margin-left: auto;margin-right: auto;display: block">发表</button>
        </div>
    </form>
</div>

<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.min.js"></script>
<script>
    var layedit = layui.layedit
        ,$ = layui.jquery;

    layui.use('layedit', function(){

        layedit.set({
            uploadImage: {
                url: '' //接口url
                ,type: 'post'
            }
        });
    });

        var index1 = layedit.build('content');


        function submitData() {
            var title = $('#title').val();
            var type = $('#type').val();
            var content = layedit.getText(index1);
            console.log(content)
            var keywords = $('#keywords').val();

            if (title == null || title === "") {
                layer.msg('请输入标题')
            } else if (type == null || type === "") {
                layer.msg('请输入博客类型')
            } else if (content == null || content === "") {
                layer.msg('请输入内容')
            } else {
                $.post('${pageContext.request.contextPath}/admin/blog/save',{'title':title,'summary':content.substr(0,50),'content':content,'blogType.id':type,'keyWord':keywords},
                    function (result) {
                        if (result.success){
                            layer.msg("博客发布成功")
                        }else {
                            layer.msg("博客发布失败")
                        }
                    },'json')
            }
        }


</script>

</body>
</html>
