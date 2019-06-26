<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/6/21
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>歌手表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首页</a>
                <a href="">演示</a>
                <a>
                    <cite>导航元素</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5">
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="username" placeholder="请输入用户名" autocomplete="off" class="layui-input"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="" lay-filter="sreach">
                                <i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-body ">
                    <div class = "layui-btn-container" >
                        <button class="layui-btn" onclick="xadmin.open('添加歌手','./candidate-add',800,600)">
                            <i class="layui-icon"></i>添加歌手</button>
                    </div>
                    <table class="layui-table" id="test" lay-filter="test">
                        <thead>
                        <tr>

                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    layui.use('laydate',
        function() {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#start' //指定元素
            });

            //执行一个laydate实例
            laydate.render({
                elem: '#end' //指定元素
            });

        });</script>
<script>
    layui.use('table',
        function() {
            var table = layui.table;

            //监听单元格编辑
            table.on('edit(test)',
                function(obj) {
                    var value = obj.value //得到修改后的值
                        ,
                        data = obj.data //得到所在行所有键值
                        ,
                        field = obj.field; //得到字段
                    layer.msg('[ID: ' + data.id + '] ' + field + ' 字段更改为：' + value);
                });

            //头工具栏事件
            table.on('toolbar(test)',
                function(obj) {
                    var checkStatus = table.checkStatus(obj.config.id);
                    switch (obj.event) {
                        case 'getCheckData':
                            var data = checkStatus.data;
                            layer.alert(JSON.stringify(data));
                            break;
                        case 'getCheckLength':
                            var data = checkStatus.data;
                            layer.msg('选中了：' + data.length + ' 个');
                            break;
                        case 'isAll':
                            layer.msg(checkStatus.isAll ? '全选': '未全选');
                            break;
                    };
                });
        });



</script>

<script type="text/javascript">
    layui.use('table', function() {
        var table = layui.table;

        table.render({
            elem: '#test',
            url: 'find_Candidate',
            title: '用户数据表',
            cols:  [[
                {type: 'checkbox', fixed: 'left'},
                {
                    field: 'c_id',
                    width: 100,
                    title: 'ID',
                    sort: true,
                    edit: 'text'
                },
                    {
                        field: 'username',
                        width: 250,
                        title: '用户名',
                        edit: 'text'
                    },
                    {
                        field: 'sex',
                        width: 100,
                        title: '性别',
                        sort: true,
                        edit: 'text'
                    },
                    {
                        field: 'project',
                        width: 250,
                        title: '作品',
                        edit: 'text'
                    },
                {fixed: 'right', title:'操作', toolbar: '#barDemo', width:250}
                ]
            ],
            page: true,
            response: {
                statusName:'code', //规定返回的状态码字段为code
            },
            parseData: function(res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "data": res.data //解析数据列表
                };
            }
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    if (index) {
                        $.ajax({
                            url: 'del?c_id='+data.c_id,
                            success: function (data) {
                                layer.alert('删除成功！')
                                $("#demo").datagrid("reload");
                            }
                        })
                    }
                    obj.del();
                    layer.close(index);
                });
            }
        });
    });
</script>
</html>
