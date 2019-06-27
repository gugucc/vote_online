<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/6/27
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <meta content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <title>投票</title>
    <link href="${pageContext.request.contextPath}/css/boilerplate.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/sweet-alert.css" rel="stylesheet" type="text/css">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--[if lt IE 9]>
    <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>

<body style="background:#c30d23; z-index: 1;">
<div id="title1" class="fluid fadeInLeft animated" style="display: block;">
    <div id="div1" class="">
        <img src="${pageContext.request.contextPath}/images/title_1.png" style="width: 58%;">
    </div>
</div>
<div class="gridContainer clearfix">
    <div id="div2" class="fluid bounceInLeft animated">
        <img src="${pageContext.request.contextPath}/images/log_1.png" style="width: 88%;">
    </div>
    <div id="div2_1" class="fluid bounceInRight animated">
        <img src="${pageContext.request.contextPath}/images/log_2.png" style="width: 88%;">
    </div>
</div>
<div class="gridContainer clearfix">
    <div id="div3" class="fluid flipInX animated">
        <img src="${pageContext.request.contextPath}/images/title_3.png" style="width:80%;">
    </div>
</div>
    <div class="gridContainer clearfix" style="z-index:99;">
        <div id="div4" class="fluid bounceIn animated" style="z-index:999;animation-delay:4s;-webkit-animation-delay:4s;-moz-animation-delay:4s;margin-top: 2em;z-index:10;">
            <select class="form-control" style="width: 178px;height: 44.4px;margin: 0 auto;">
                <c:forEach items="${Duel}" var="duel">
                    <c:if test="${duel.status==1}">
                        <option value='${duel.d_id}'>${duel.title}</option>
                    </c:if>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="gridContainer clearfix" style="z-index:99;">
        <div id="div4" class="fluid bounceIn animated" style="z-index:999;">
            <a onclick="toVoting()" class="go btn" style="z-index:9999;">参与投票</a>
        </div>
    </div>

<script src="${pageContext.request.contextPath}/js/respond.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/respond.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/sweet-alert.min.js" type="text/javascript" charset="utf-8"></script>
<script>
    toVoting=function(){
        var vote=$( "select option:selected" ).val();
        window.location.href="${pageContext.request.contextPath}/Tp?d_id="+vote;
    }


    $(function() {
        $("#audio_btn").click(function() {
            var music = document.getElementById("media");
            if(music.paused) {
                music.play();
                $("#yinfu").addClass('rotate');
                $("#audio_btn").addClass('play_yinfu');
                $("#music_btn").attr("src", "play.gif");
            } else {
                music.pause();
                $("#yinfu").removeClass('rotate');
                $("#audio_btn").removeClass('play_yinfu');
                $("#music_btn").attr("src", "pause.gif");
            }
        });
    })

    /*function transfer(obj,d_id) {
        var url = 'Tp?d_id='+ d_id;
        window.location.href = url;
    }*/
   /* $.ajax({
        url:"get-cid?d_id="$,
        success:function(c_id){
           $.ajax({
                url:'Tp?c_id='
            });
        }
    });*/
</script>
</body>

</html>

