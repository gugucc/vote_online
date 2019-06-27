<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/echarts.min.js"></script>
	</head>

	<body>
		<div id="main" style="width: 960px;height:500px;position: absolute;top:15%;left: 15%;"></div>
		<div id="weather"></div>
	</body>
	<script>
		var xA = [];
		var yA = [];

		function myData() {
			var myChart = echarts.init(document.getElementById('main'));
			window.onresize=myChart.resize;
			var option = {
				
				tooltip: {},
				legend: {
					data: ['分数']
				},
				xAxis: {
					data: xA,
					axisLabel: {
				       show: true,
				        textStyle: {
				          fontSize : 12      //更改坐标轴文字大小
				        }
				     },	
				},
				yAxis: {
					show: false,
					splitLine: {
						show: false
					}
				},
				series: [{
					type: 'bar',
					data: yA,
					itemStyle: {
						normal: {
							color: function(params) {
								var colorList = ['rgb(205,85,85)', 'rgb(210,105,30)', 'rgb(0,139,0)', 'rgb(178,58,238)', 'rgb(54,100,139)'];
								return colorList[params.dataIndex];
							},
							label: {
								show: true, //开启显示
								position: 'top', //在上方显示
								textStyle: { //数值样式
									color: 'black',
									fontSize: 20
								}
							}
						}
					},
					barWidth: 50,
					barGap: '100%'
				}],
				
			};
			myChart.setOption(option);
		};
		$(function() {
			$.ajax({
				type: "post",
				url: "https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b",
				dataType: "jsonp",
				success: function(data) {
					$.each(data.subjects, function(i, v) {
						xA.push(v.title);
						yA.push(v.rating.average);
						if(i == 4) {
							return false;
						}
					})
					myData();
				}
			});
		});
	</script>

</html>