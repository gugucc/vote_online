<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/6/26
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
    <!-- 引入 echarts.js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/china.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/world.js"></script>
</head>

<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 100%;height:600px;"></div>
<script type="text/javascript">
    setInterval(function(){ $.ajax({
        url:"singer-name?d_id=${d_id}",
        success: function(data) {
            $.ajax({
                url: "singer-vote?d_id=${d_id}",
                success:function (date) {
                    $.ajax({
                        url: "singer-duel",
                        data :{'d_id':${d_id}},
                        type:"post",
                        success:function (title) {
                            // 填入数据
                            // 基于准备好的dom，初始化echarts实例
                            var myChart = echarts.init(document.getElementById('main'));

                            window.onresize = myChart.resize;

                            var colorArray = [{
                                top: '#ffa800', //黄
                                bottom: 'rgba(11,42,84,.3)'
                            }, {
                                top: '#1ace4a', //绿
                                bottom: 'rgba(11,42,84, 0.3)'
                            },
                                {
                                    top: '#4bf3ff', //蓝
                                    bottom: 'rgba(11,42,84,.3)'
                                }, {
                                    top: '#4f9aff', //深蓝
                                    bottom: 'rgba(11,42,84,.3)'
                                },
                                {
                                    top: '#b250ff', //粉
                                    bottom: 'rgba(11,42,84,.3)'
                                }
                            ];
                            option = {
                                title: {
                                    x: 'center',
                                    text: title,
                                    subtext: '数据来着铁five小组',
                                    textStyle: {
                                        fontWeight: 'normal', //标题颜色
                                        color: '#408829',
                                    },
                                },
                                backgroundColor: '#0E2A43',
                                tooltip: {
                                    show: true,
                                    formatter: "{b}:{c}"
                                },
                                grid: {
                                    left: '5%',
                                    top: '12%',
                                    right: '1%',
                                    bottom: '8%',
                                    containLabel: true
                                },

                                xAxis: {
                                    type: 'value',
                                    show: false,
                                    position: 'top',
                                    axisTick: {
                                        show: false
                                    },
                                    axisLine: {
                                        show: false,
                                        lineStyle: {
                                            color: '#fff',
                                        }
                                    },
                                    splitLine: {
                                        show: false
                                    },
                                },
                                yAxis: [{
                                    type: 'category',
                                    axisTick: {
                                        show: false,
                                        alignWithLabel: false,
                                        length: 5,

                                    },
                                    "splitLine": { //网格线
                                        "show": false
                                    },
                                    inverse: 'true', //排序
                                    axisLine: {
                                        show: false,
                                        lineStyle: {
                                            color: '#fff',
                                        }
                                    },
                                    data: data
                                }

                                ],
                                series: [{
                                    name: '能耗值',
                                    type: 'bar',
                                    label: {
                                        normal: {
                                            show: true,
                                            position: 'right',
                                            formatter: '{c}',
                                            textStyle: {
                                                color: 'white' //color of value
                                            }
                                        }
                                    },
                                    itemStyle: {
                                        normal: {
                                            show: true,
                                            color: function (params) {
                                                let num = colorArray.length;
                                                return {
                                                    type: 'linear',
                                                    colorStops: [{
                                                        offset: 0,
                                                        color: colorArray[params.dataIndex % num].bottom
                                                    }, {
                                                        offset: 1,
                                                        color: colorArray[params.dataIndex % num].top
                                                    }, {
                                                        offset: 0,
                                                        color: colorArray[params.dataIndex % num].bottom
                                                    }, {
                                                        offset: 1,
                                                        color: colorArray[params.dataIndex % num].top
                                                    }, {
                                                        offset: 0,
                                                        color: colorArray[params.dataIndex % num].bottom
                                                    }, {
                                                        offset: 1,
                                                        color: colorArray[params.dataIndex % num].top
                                                    }, {
                                                        offset: 0,
                                                        color: colorArray[params.dataIndex % num].bottom
                                                    }, {
                                                        offset: 1,
                                                        color: colorArray[params.dataIndex % num].top
                                                    }, {
                                                        offset: 0,
                                                        color: colorArray[params.dataIndex % num].bottom
                                                    }, {
                                                        offset: 1,
                                                        color: colorArray[params.dataIndex % num].top
                                                    }, {
                                                        offset: 0,
                                                        color: colorArray[params.dataIndex % num].bottom
                                                    }, {
                                                        offset: 1,
                                                        color: colorArray[params.dataIndex % num].top
                                                    }],
                                                    //globalCoord: false
                                                }
                                            },
                                            barBorderRadius: 70,
                                            borderWidth: 0,
                                            borderColor: '#333',
                                        }
                                    },
                                    barGap: '0%',
                                    barCategoryGap: '50%',
                                    data: date
                                }

                                ]
                            };
                            myChart.setOption(option);
                        }
                    })
                }
            })
        }
    })
    }, 1000);


</script>
</body>

</html>