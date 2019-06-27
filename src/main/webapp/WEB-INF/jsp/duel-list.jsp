<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/6/21
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
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
                        <button class="layui-btn" onclick="xadmin.open('添加对决主题','./duel-add',800,600)">
                            <i class="layui-icon"></i>添加对决主题</button>
                    </div>
                    <table class="layui-table" id="test" lay-filter="test">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" name=""  lay-skin="primary">
                            </th>
                            <th>ID</th>
                            <th>对决项目</th>
                            <th>开始时间</th>
                            <th>投票状态</th>
                            <th>操作</th>
                        </thead>
                        <tbody>
                        <c:forEach  items="${Duel}" var="duel" varStatus="">
                            <tr>
                                <td>
                                    <input type="checkbox" name=""  lay-skin="primary">
                                </td>
                                <td>${duel.d_id}</td>
                                <td>${duel.title}</td>
                                <td>${duel.startime}</td>
                                <td class="td-status">
                                    <c:if test="${duel.status==1}">
                                        <input type='checkbox' onclick="updateStatus(${duel.d_id},${duel.status})"  id='status' lay-filter='stat' checked='checked' name='status' >
                                    </c:if>
                                    <c:if test="${duel.status==0}">
                                        <input type='checkbox' onclick="updateStatus(${duel.d_id},${duel.status})"  id='status' lay-filter='stat' name='status' >
                                    </c:if>
                                </td>
                                <td class="td-manage">
                                    <a class="layui-btn layui-btn layui-btn-xs" title="查看详情" onclick="xadmin.open('查看详情','show-singer?d_id=${duel.d_id}')">
                                        <i class="layui-icon">&#xe601;</i>
                                    </a>
                                    <a class="layui-btn layui-btn-warm layui-btn-xs" title="添加对决歌手" onclick="xadmin.open('添加对决歌手','singer-add?d_id=${duel.d_id}')"   <%--href="singer-add?id=${duel.d_id}"--%>>
                                        <i class="layui-icon">&#xe642;</i>
                                    </a>
                                    <a class="layui-btn layui-btn-danger layui-btn-xs" title="删除" onclick="duel_del(this,'${duel.d_id}')" href="delDuel?d_id=${duel.d_id}">
                                        <i class="layui-icon">&#xe640;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%--<script type="text/html" id="barDemo">
    <button class="layui-btn layui-btn layui-btn-xs"  onclick="xadmin.open('编辑','admin-edit')" ><i class="layui-icon">&#xe642;</i>查看详情</button>
    <button class="layui-btn layui-btn-warm layui-btn-xs" lay-event="add" ><i class="layui-icon">&#xe642;</i>添加对决歌手</button>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>--%>

<script type="text/javascript">
    //setTimeout(hello,1000);
    updateStatus=function(d_id,status){
    if (status==1){
    status=0;
    console.log("+++++++"+status)
    $.ajax({
        url:"duelStatus",
        data:{"d_id":d_id,"status":status}
        ,success:function (e) {
            console.log("changg")
        }
    })
    } else if (status==0){
    status=1;
    console.log("+++++++"+status)
    $.ajax({
        url:"duelStatus",
        data:{"d_id":d_id,"status":status}
        ,success:function (e) {
            console.log("changg")
        }
    })
}
        /*var status=$( "input checkbox:checked" ).val();*/
       }

setInterval("updateStatus()",1000)


    layui.use('table', function(){
        var table = layui.table;
        //监听表格复选框选择
        table.on('checkbox(test)', function(obj){
            console.log(obj)
        });


        var $ = layui.$, active = {
            getCheckData: function(){ //获取选中数据
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }
            ,getCheckLength: function(){ //获取选中数目
                var checkStatus = table.checkStatus('idTest')
                    ,data = checkStatus.data;
                layer.msg('选中了：'+ data.length + ' 个');
            }
            ,isAll: function(){ //验证是否全选
                var checkStatus = table.checkStatus('idTest');
                layer.msg(checkStatus.isAll ? '全选': '未全选')
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });

    /*用户-删除*/
    function duel_del(obj,d_id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }


</script>


<%--<script>

function startime(v){
    var date = new Date(v);
    var y = date.getFullYear();
    var m = date.getMonth()+1;
    m = m<10?'0'+m:m;
    var d = date.getDate();
    d = d<10?("0"+d):d;
    var h = date.getHours();
    h = h<10?("0"+h):h;
    var M = date.getMinutes();
    M = M<10?("0"+M):M;
    var str = y+"-"+m+"-"+d+" "+h+":"+M;
    return str;
}

layui.use(['table', 'layer', 'form', 'element', 'jquery','tree'],
    function () {
        var table = layui.table, layer = layui.layer, form = layui.form,
            element = layui.element, $ = layui.jquery,
            tree = layui.tree;
        var contextPath = $('#cta').val();

        table.render({
           /* toolbar: '#barDemo',*/ //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            elem: '#test',
            url: 'find_Duel',
            id : 'userReload',
            cols: [[
                {type: 'checkbox', fixed: 'left'},
                {
                    field: 'd_id',
                    width : 80,
                    align: 'center',
                    title: 'ID',
                    sort: true,
                    edit: 'text'
                },
                {
                    field: 'title',
                    align: 'center',
                    title: '对决项目',
                    edit: 'text'
                },
                {
                    field: 'startime',
                    align: 'center',
                    title: '开始时间',
                    sort: true,
                    edit: 'text',
                    templet :function (row){
                        return startime(row.startime);
                    }
                },
                , {
                    field: 'status',
                    title: '投票状态',
                    align: 'center',
                    templet: function (d) {
                        var state = "";
                        if (d.status == "1") {
                            state = "<input type='checkbox' value='" + d.id + "' id='status' lay-filter='stat' checked='checked' name='status' lay-skin='switch' lay-text='开启|关闭' >";
                        }
                        else {
                            state = "<input type='checkbox' value='" + d.id + "' id='status' lay-filter='stat'  name='status'  lay-skin='switch' lay-text='开启|关闭' >";

                        }

                        return state;
                    }
                },
                {fixed: 'right', title:'操作', toolbar: '#barDemo', align: 'center'}
            ]]
        });

        // 查询 数据渲染 重载
        var $ = layui.$, active = {
            reload: function () {
                // 执行重载
                table.reload('userReload', {
                    page: {
                        // 重新从第 1 页开始
                        // curr: 1
                    },
                    where: {}
                });
            }

        };



        //监听开关事件
        form.on('switch(stat)', function (data) {
            var contexts;
            var sta;
            var x = data.elem.checked;//判断开关状态
            if (x==true) {
                contexts = "打开";
                sta=1;
            } else {
                contexts = "关闭";
                sta=0;
            }
            //自定义弹窗
            layer.open({
                content: "你确定要"+contexts+"?"
                , btn: ['确定', '取消']
                , yes: function (index, layero) {
                    //按钮确定【按钮一】的回调
                    data.elem.checked = x;
                    //对商品进行上架或下架处理
                    $.ajax({
                        type: "post",
                        url: contextPath + '/button',
                        data: {
                            //上下架的参数
                            "id": data.value,
                            "status":sta
                        },
                        success: function (data) {
                            if (data == 1) {
                                layer.msg(contexts+'成功',
                                    // 提示的样式
                                    {icon: 1, time: 2000,});

                                // 数据重载
                                active.reload();
                            }
                        }
                    });

                    form.render();
                    layer.close(index);

                }
                , btn2: function (index, layero) {
                    //按钮【按钮二】的回调
                    data.elem.checked = !x;
                    form.render();
                    layer.close(index);
                    //return false 开启该代码可禁止点击该按钮关闭
                }
                , cancel: function () {
                    //右上角关闭回调
                    data.elem.checked = !x;
                    form.render();
                    // return false; //开启该代码可禁止点击该按钮关闭
                }
            });

            return false;

        });
        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    if (index) {
                        $.ajax({
                            url: 'delDuel',
                            data: 'd_id=' + data.d_id,
                            success: function (data) {
                                layer.alert('删除成功！')
                                $("#demo").datagrid("reload");
                            }
                        })
                    }
                    obj.del();
                    layer.close(index);
                });
            }else if (obj.event === 'add'){
                function singer_add(index) {
                    layer.open({
                        type:2,
                        title:"添加对决歌手",
                        maxmin: true, //开启最大化最小化按钮
                        area: ['600px', '300px'],
                        content: 'singer-add.jsp?d_id='+data.d_id //iframe的url

                    });

                }
            }
        });



    });
</script>--%>

</html>
