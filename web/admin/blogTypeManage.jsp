<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>博客类型信息管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <style>
        .layui-table-cell .layui-form-checkbox[lay-skin="primary"]{top: 50%;transform: translateY(-50%)}
        .layui-table-cell {
            height: 60px;
            line-height: 60px;
        }
        th .layui-table-cell {
            height: 30px;
            line-height: 30px;
        }
        th .laytable-cell-1-0-7 {
            height: 30px;
            line-height: 30px;
        }
    </style>
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

<div style="text-align: center">
<div style="display: inline-block;text-align: left">
    <a type="button" class="layui-btn" id="addBtn" style="margin-top: 20px;">添加</a>
    <table class="layui-hide" id="test" lay-filter="test"></table>
</div>
</div>

<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.min.js"></script>
<script id="bar">
    <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" id="change" lay-event="edit"><i class="layui-icon"></i></button>
    <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" id="delete" lay-event="del"><i class="layui-icon"></i></button>
</script>
<script>
    layui.use('layer', function(){
        var element = layui.element
        var table = layui.table;
        table.render({
            elem: '#test'
            ,url:'${pageContext.request.contextPath}/admin/blogType/list'
            ,cols: [[
                {type:'checkbox'}
                ,{field:'id', name:'id', width:200, title: '编号', sort: true}
                ,{field:'typeName', name:'typeName', width:300, title: '博客类型名称'}
                ,{field:'orderNo', name:'orderNo', width:300, title: '排序序号', sort: true}
                ,{field:'operation', name:'operation', width:300, title: '操作',toolbar:'#bar'}
            ]]
            ,page: {layout: [ 'prev', 'page', 'next', 'count', 'skip']}
            ,width: $(document).width() - $('#test').offset().left - 766
            ,height: $(document).height() - $('#test').offset().top - 167
        });

        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
            if(layEvent === 'edit'){ //编辑
                 $(document).on('click','#change',function() {
                     let id = data.id;
                     let typeName = data.typeName;
                     let orderNo = data.orderNo;
                     layer.open({
                         type: 2,
                         title: '修改数据',
                         shadeClose: true,
                         area: ['600px', '280px'],
                         skin: 'layui-layer-lan',
                         content: '/admin/updateDlg.jsp',
                         zIndex: layer.zIndex, //重点1
                         success: function (layero, index) {
                             var body = layer.getChildFrame('body', index);
                             var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                             body.find('#id').val(id);
                             body.find('#typeName').val(typeName);
                             body.find('#orderNo').val(orderNo);
                         }
                     })
                 })
                //同步更新缓存对应的值
                /*obj.update({});*/
            }else if(layEvent === 'del'){ //删除
                layer.confirm('确定删除？', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    //向服务端发送删除指令
                    window.location.href = "${pageContext.request.contextPath}/admin/blogType/delete?id="+data.id;
                });
            }
        });
    });

    $(document).on('click','#addBtn',function() {
        layer.open({
            type: 2,
            title: '添加页面',
            shadeClose: true,
            area: ['600px', '280px'],
            skin: 'layui-layer-lan',
            content: "/admin/addDlg.jsp",
        })
    })



</script>

</body>
</html>
