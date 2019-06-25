<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/6/21
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>投票添加</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
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
                    width: 80,
                    title: 'ID',
                    sort: true,
                    edit: 'text'
                },
                {
                    field: 'username',
                    width: 150,
                    title: '用户名',
                    edit: 'text'
                },
                {
                    field: 'sex',
                    width: 80,
                    title: '性别',
                    sort: true,
                    edit: 'text'
                },
                {
                    field: 'project',
                    width: 150,
                    title: '作品',
                    edit: 'text'
                }
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

    });
</script>
</html>