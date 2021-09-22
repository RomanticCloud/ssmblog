<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>博客信息管理</title>
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
    </li>
</ul>

<div class="layui-container">
    <div style="margin-top: 10px">
            <label for="search" class="layui-form-label" style="text-align: left;"><i class="layui-icon layui-icon-search"></i></label>
            <input class="layui-input-block" type="text" id="search" name="search" style="margin-left: -58px;width: 350px">
            <button type="button" data-type="reload" id="searchBtn" class="layui-btn layui-btn-checked" style="margin-left: 20px">搜索</button>
    </div>
    <div style="display: inline-block">
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
            ,url:'${pageContext.request.contextPath}/admin/blog/list'
            ,id:'tbReload'
            ,cols: [[
                {type:'checkbox'}
                ,{field:'id', name:'id', width:100, title: '编号', sort: true}
                ,{field:'title', name:'title', width:400, title: '标题'}
                ,{field:'releaseDate', name:'releaseDate', width:300, title: '发表时间', sort: true,
                        templet:function (row){
                            return DateFormat(row.releaseDate);
                        } }
                ,{field:'blogType', name:'blogType', width:150, title: '所属类别',
                        templet:function (row){
                            return ObjectProperty(row.blogType).typeName;
                        }}
                ,{field:'operation', name:'operation', width:148, title: '操作',toolbar:'#bar', align:'center'}
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
                    var index = layer.open({
                        id:'blogEdit',
                        type: 2,
                        content: '${pageContext.request.contextPath}/admin/blogEdit.jsp',
                        resize: false
                    });
                    layer.full(index);
                })
            }else if(layEvent === 'del'){ //删除
                layer.confirm('确定删除？', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    //向服务端发送删除指令
                    window.location.href = "${pageContext.request.contextPath}/admin/blog/delete?id="+data.id;
                });
            }
        });

        var active = {
            reload: function(){
                var search = $('#search');

                //执行重载
                table.reload('tbReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                            title: search.val()
                    }
                }, 'data');
            }
        };

        $('#searchBtn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

    });

    $(window).keydown(function(event){
        if(event.keyCode==13){
            $('#searchBtn').click();
        }
    });


    function ObjectProperty(prop){
        return prop;
    }

    function DateFormat(sjc){
        var date = new Date(sjc);
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        m = m<10?'0'+m:m;
        var d = date.getDate();
        d = d<10?("0"+d):d;
        var h = date.getHours();
        h = h<10?("0"+h):h;
        var min = date.getMinutes();
        min = min<10?("0"+min):min;
        var s = date.getSeconds();
        s = s<10?("0"+s):s;
        var str = y+"-"+m+"-"+d+" "+h+":"+min+":"+s;
        return str;
    }

</script>

</body>
</html>
