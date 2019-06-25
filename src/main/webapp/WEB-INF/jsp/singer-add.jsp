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
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<div class="layui-fluid">
    <div class="layui-row">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>上传歌手头像</legend>
        </fieldset>
        <form <%--enctype="multipart/form-data"--%> class="layui-form" <%--action="${pageContext.request.contextPath}/upload_submit" method="post"--%>>
            <div class="layui-upload">
                <button type="button" class="layui-btn layui-btn-normal" id="chose">选择文件</button>
                <div class="layui-form-item">
                    <label for="username" class="layui-form-label">
                        <span class="x-red">*</span>歌手名</label>
                    <div class="layui-input-inline">
                        <input type="text" id="name" name="username" required="" lay-verify="required" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <button type="button" lay-filter="submit" class="layui-btn" id="upload">开始上传</button>
            </div>
        </form>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>添加基本信息</legend>
        </fieldset>
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>歌手名</label>
                <div class="layui-input-inline">
                    <input type="text" id="username" name="username" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="songName" class="layui-form-label">
                    <span class="x-red">*</span>歌名</label>
                <div class="layui-input-inline">
                    <input type="text" id="songName" name="songName" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="男" title="男">
                    <input type="radio" name="sex" value="女" title="女" checked>
                </div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <button class="layui-btn" lay-filter="add" lay-submit="">增加</button></div>
        </form>
    </div>
</div>
<%--<script type="text/javascript">
    layui.use(['form', 'layer'],
        function() {
            $ = layui.jquery;
            var form = layui.form,
                layer = layui.layer;

            //添加表单监听事件
            form.on('submit(submit)',function () {
                $.ajax({
                    url:'upload_submit',
                    type:'post',
                    data:{username:$('#name').val(),
                    },
                    dataType:'text',
                    //判断注册状态
                    success:function (data) {
                        if (data.flag==1){
                            layer.msg('添加失败')
                        }else{
                            layer.msg('添加成功')
                        }
                    }
                })
                //防止页面跳转
                return false;
            });


        });
</script>--%>
<script>
    layui.use('upload', function() {
        var $ = layui.jquery,
            upload = layui.upload;

        //选完文件后不自动上传
        upload.render({
            elem: '#chose',
            url: 'upload_submit',
            auto: false,
            multiple: true,
            bindAction: '#upload',
            before:function(obj){
                this.data={username:$('#name').val()}
            },
            done: function(res){
                if(res.code==200){
                    layer.msg('上传成功！');
                }
                else{
                    layer.msg("上传失败！");

                }
            }
        });
    });
</script>

<script>
    layui.use(['form', 'layer'],
        function() {
            $ = layui.jquery;
            var form = layui.form,
                layer = layui.layer;

            //添加表单监听事件
            form.on('submit(add)',function () {
                $.ajax({
                    url:'add_submit',
                    type:'post',
                    data:{username:$('#username').val(),
                        project:$('#songName').val(),
                        sex:$("input:radio[name='sex']:checked").val(),
                    },
                    dataType:'text',
                    //判断注册状态
                    success:function (data) {
                        if (data.flag==1){
                            layer.msg('添加失败')
                        }else{
                            layer.msg('添加成功')
                        }
                    }
                })
                //防止页面跳转
                return false;
            });


        });
</script>
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</body>
</html>
