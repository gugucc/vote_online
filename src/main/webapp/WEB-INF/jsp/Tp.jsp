<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/6/27
  Time: 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<!--[if lt IE 7]> <html class="ie6 oldie"> <![endif]-->
<!--[if IE 7]>    <html class="ie7 oldie"> <![endif]-->
<!--[if IE 8]>    <html class="ie8 oldie"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="">
<!--<![endif]-->

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>投票</title>
    <link href="${pageContext.request.contextPath}/css/boilerplate.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/sweet-alert.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]>
    <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/respond.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sweet-alert.min.js"></script>
</head>

<body style="background:#c30d23">
<div id="audio_btn" class="video_exist off play_yinfu" style="display: block;">
    <div id="yinfu" class="rotate"></div>
    <audio loop src="${pageContext.request.contextPath}/music/bg_2.mp3" id="media" autoplay preload="preload"></audio>
</div>
<div id="content_title1" class="fluid clearfix">
    <div class="content_title">
        参与投票
    </div>
</div>
<div class="clearfix"></div>
<c:forEach items="${Candidate}" var="candidate">
<div id="content_list" class="gridContainer clearfix bounceInDown animated">
    <div class="content_list_li">
        <div class="content_list_li_left">
            <span><img src="${pageContext.request.contextPath}${candidate.image}"></span>
        </div>
        <div class="content_list_li_right">
            <div class="content_list_li_right_li"><strong>编号：</strong>${candidate.c_id}</div>
            <div class="content_list_li_right_li"><strong>姓名：</strong>${candidate.username}</div>
            <div class="content_list_li_right_li"><strong>作品：</strong>${candidate.project}</div>
            <div class="content_list_li_right_li_a">
                <a name="tp1" id="tp1" class="btn to t1" onClick="updateVote1(${candidate.c_id})">投我吧</a>
                <a href="show-singer?d_id=${d_id}" name="tp2" id="tp2" class="btn to on"  style="display: none;">查看票数</a>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
</c:forEach>
<div class="clearfix" style="height:2em;"></div>
</body>

<script type="text/javascript">
    $(function () {
        updateVote1=function (c_id) {
               <%
               String sIP=request.getLocalAddr();
               %>
                   $.ajax({
                       url:"selectIP?sIP="+"<%=sIP%>",
                       success:function (i) {
                           if (i==1){
                               alert("已经投过票不能投票了！")
                               $("a[name=tp1]").css({"display":"none"}),
                                   $("a[name=tp2]").css({"display":"block"})
                           }else{
                               $.ajax({
                                   url:"updateVote",
                                   data:{"c_id":c_id,"d_id":${d_id}},
                                   success:function (data) {
                                       alert("投票成功")
                                       $.ajax({
                                           url: "getIP",
                                           type:"POST",
                                           success:function (e) {
                                               $("a[name=tp1]").css({"display":"none"}),
                                               $("a[name=tp2]").css({"display":"block"})
                                               /*$.ajax({
                                                   url:"",
                                                   type:"post",
                                                   success:function (a) {

                                                   }
                                               })*/
                                           }
                                       })
                                   }
                               })
                           }
                       }
           })
        }
    })
</script>
</html>
