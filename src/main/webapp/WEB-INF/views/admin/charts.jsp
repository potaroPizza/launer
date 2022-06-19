<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/admin" %>

<t:head>
</t:head>
<t:wrapper>

<!--
총 방문자수 : 바?
월별 총수입 : 막대
회원수 : 바?
매출통계 : 원형 파이그래프
juqery가 hicharts보다 위에 선언되어야함
-->

<style type="text/css">
.sb-sidenav-footer {
	position: absolute;
	bottom: 0;
	width: 225px;
}

#orders th, #orders td {
	text-align: center;
}

/* 차트관련 css */
#container{
	min-width: 90%; 
	height: 400px; 
	margin: 0 auto;
}
.highcharts-figure,
.highcharts-data-table table {
    min-width: 360px;
    max-width: 700px;
    margin: 1em auto;
}

.highcharts-data-table table {
    font-family: Verdana, sans-serif;
    border-collapse: collapse;
    border: 1px solid #ebebeb;
    margin: 10px auto;
    text-align: center;
    width: 100%;
    max-width: 500px;
}

.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}

.highcharts-data-table th {
    font-weight: 600;
    padding: 0.5em;
}

.highcharts-data-table td,
.highcharts-data-table th,
.highcharts-data-table caption {
    padding: 0.5em;
}

.highcharts-data-table thead tr,
.highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}

.highcharts-data-table tr:hover {
    background: #f1f7ff;
}
</style>

<script type="text/javascript">
	$(function () {
		lineChart();
		barChart();
		pieChart();
		
		
	});
	
	function lineChart(){
		/* Highcharts.setOptions({
			colors: ['#a562d4', '#7d8598']
		}); */
		
	    Highcharts.chart('containerLine', {
	        title: {
	            text: '신규가입자 및 총 방문자 수',
	            x: -20 //center
	        },
	        subtitle: {
	            text: 'Launer Admin Service 제공',
	            x: -20
	        },
	        xAxis: {
	            categories: ['1월', '2월', '3월', '4월', '5월', '6월',
	                '7월', '8월', '9월', '10월', '11월', '12월']
	        },
	        yAxis: {
	            title: {
	                text: 'Headcount'
	            },
	            plotLines: [{
	                value: 0,
	                width: 1,
	                color: '#808080'
	            }]
	        },
	        tooltip: {
	            valueSuffix: '명'
	        },
	        legend: {
	            layout: 'vertical',
	            align: 'right',
	            verticalAlign: 'middle',
	            borderWidth: 0
	        },
	        series: [{
	            name: '신규가입자',
	            data: [3, 62, 157, 233, 580, 1049, null, null, null, null, null, null]
	        }, {
	            name: '사이트 방문자',
	            data: [42, 168, 580, 1024, 3303, 5237, null, null, null, null, null, null]
	        }]
	    });
	}
	

	function barChart() {
		Highcharts.chart('containerBar',{
			chart : {
				type : 'column'
			},
			title : {
				text: '월별 총 수입',
	            x: -20 //center
			},
			subtitle : {
				text: 'Launer Admin Service 제공',	
	            x: -20 //center
			},
			accessibility : {
				announceNewData : {
					enabled : true
				}
			},
			xAxis : {
				type : 'category'
			},
			yAxis : {
				title : {
					text : 'Revenue(million Won)'
				}

			},
			legend : {
				enabled : false
			},
			series : [ {
				name : "매출액(백만원)",
				colorByPoint : true,
				data : [ {
					name : "1월",
					y : 2.3,
				}, {
					name : "2월",
					y : 10.52,
				}, {
					name : "3월",
					y : 15.61,
				}, {
					name : "4월",
					y : 26.9,
				}, {
					name : "5월",
					y : 48.23,
				}, {
					name : "6월",
					y : 108.74,
				}, {
					name : "7월",
					y : null,
				}, {
					name : "8월",
					y : null,
				}, {
					name : "9월",
					y : null,
				}, {
					name : "10월",
					y : null,
				}, {
					name : "11월",
					y : null,
				}, {
					name : "12월",
					y : null,
				} ]
			} ]
			
			});
	}

	function pieChart() {
		Highcharts.chart('containerPie', {
		    chart: {
		        plotBackgroundColor: null,
		        plotBorderWidth: null,
		        plotShadow: false,
		        type: 'pie'
		    },
		    title: {
		        text: '카테고리별 매출 통계',
		        x: -20 //center
		    },
		    subtitle : {
				text: 'Launer Admin Service 제공',	
	            x: -20 //center
			},
		    tooltip: {
		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		    },
		    accessibility: {
		        point: {
		            valueSuffix: '%'
		        }
		    },
		    plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            dataLabels: {
		                enabled: true,
		                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
		            }
		        }
		    },
		    series: [{
		        name: 'Brands',
		        colorByPoint: true,
		        data: [{
		            name: 'Chrome',
		            y: 61.41,
		            sliced: true,
		            selected: true
		        }, {
		            name: 'Internet Explorer',
		            y: 11.84
		        }, {
		            name: 'Firefox',
		            y: 10.85
		        }, {
		            name: 'Edge',
		            y: 4.67
		        }, {
		            name: 'Safari',
		            y: 4.18
		        }, {
		            name: 'Sogou Explorer',
		            y: 1.64
		        }, {
		            name: 'Opera',
		            y: 1.6
		        }, {
		            name: 'QQ',
		            y: 1.2
		        }, {
		            name: 'Other',
		            y: 2.61
		        }]
		    }]
		});
	}
</script>



<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

	<main>
		<div class="container-fluid px-4">
	        <h1 class="mt-4">서비스통계</h1>
	        <ol class="breadcrumb mb-4">
	            <!-- <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
	            <li class="breadcrumb-item active">Charts</li> -->
	        </ol>
	        <div class="card mb-4">
	            <!-- <div class="card-body">
	                Chart.js is a third party plugin that is used to generate the charts in this template. The charts below have been customized - for further customization options, please visit the official
	                <a target="_blank" href="https://www.chartjs.org/docs/latest/">Chart.js documentation</a>
	                .
	            </div> -->
	        </div>
	        
	        <div class="card mb-4">
	            <div class="card-header">
	                <i class="fas fa-chart-area me-1"></i>
	               사용자 통계
	            </div>
	            <div class="card-body">
		            <!-- 라인 차트 -->
					<div id="containerLine"></div>
				</div>
	            <div class="card-footer small text-muted">Updated at 22-06-16 08:35 PM</div>
	        </div>

            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-chart-bar me-1"></i>
                    매출 통계
                </div>
                <div class="card-body">
	                <!-- 바 차트 -->
	                <div id="containerBar"></div>
                </div>
                <div class="card-footer small text-muted">Updated at 22-06-16 08:35 PM</div>
            </div>
            
             <div class="card mb-4">
                <div class="card-header">
                	<i class="fas fa-chart-pie me-1"></i>
                    카테고리별 매출 통계
                </div>
                <div class="card-body">
	                <!-- 도넛 차트 -->
	                <div id="containerPie"></div>
                </div>
             	<div class="card-footer small text-muted">Updated at 22-06-16 08:35 PM</div>
			</div>

	        </div>
	</main>

</t:wrapper>
