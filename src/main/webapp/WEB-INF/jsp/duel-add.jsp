<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/6/24
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">
                    主題
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="title" name="title" placeholder="请输入投票主題" required="" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red"></span>状态</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="1" title="开启">
                    <input type="radio" name="status" value="0" title="关闭" checked>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                </label>
                <button  class="layui-btn" lay-filter="add" lay-submit="">
                    增加
                </button>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use(['form', 'layer'],
    function() {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;

        //监听提交
        form.on('submit(add)',function(){
            $.ajax({
                url:'addDuel',
                type:'post',
                data:{title:$('#title').val(),
                    /*status:$("input:checkbox[name='open']:checked").val(),*/
                    status:$("input:radio[name='status']:checked").val(),
                },
                //判断注册状态
                success:function(res){
                    console.log(res);
                    if(res==1){
                        layer.msg('上传成功！');
                        //关闭当前frame
                        xadmin.close();
                        // 可以对父窗口进行刷新
                        xadmin.father_reload();
                    }
                    else{
                        layer.msg("上传失败！");

                    }
                }
                /*success:function (data) {
                    if (data.code==200){
                        layer.msg('添加成功！');
                        //关闭当前frame
                        xadmin.close();
                        // 可以对父窗口进行刷新
                        xadmin.father_reload();
                    }else{
                        layer.msg('添加失败！')
                    }
                }*/
            })
        });
                return false;
            });

</script>
</body>

</html>
