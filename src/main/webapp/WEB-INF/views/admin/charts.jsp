<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>

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
		dounutChart();
		
		
	});
	
	function lineChart(){
		Highcharts.setOptions({
			colors: ['#a562d4', '#7d8598']
		});
		
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
	
	function barChart(){
		Highcharts.chart('containerBar', {
		    chart: {
		        type: 'column'
		    },
		    title: {
		        align: 'left',
		        text: 'Browser market shares. January, 2018'
		    },
		    subtitle: {
		        align: 'left',
		        text: 'Click the columns to view versions. Source: <a href="http://statcounter.com" target="_blank">statcounter.com</a>'
		    },
		    accessibility: {
		        announceNewData: {
		            enabled: true
		        }
		    },
		    xAxis: {
		        type: 'category'
		    },
		    yAxis: {
		        title: {
		            text: 'Total percent market share'
		        }

		    },
		    legend: {
		        enabled: false
		    },
		    plotOptions: {
		        series: {
		            borderWidth: 0,
		            dataLabels: {
		                enabled: true,
		                format: '{point.y:.1f}%'
		            }
		        }
		    },

		    tooltip: {
		        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
		        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
		    },

		    series: [
		        {
		            name: "Browsers",
		            colorByPoint: true,
		            data: [
		                {
		                    name: "Chrome",
		                    y: 62.74,
		                    drilldown: "Chrome"
		                },
		                {
		                    name: "Firefox",
		                    y: 10.57,
		                    drilldown: "Firefox"
		                },
		                {
		                    name: "Internet Explorer",
		                    y: 7.23,
		                    drilldown: "Internet Explorer"
		                },
		                {
		                    name: "Safari",
		                    y: 5.58,
		                    drilldown: "Safari"
		                },
		                {
		                    name: "Edge",
		                    y: 4.02,
		                    drilldown: "Edge"
		                },
		                {
		                    name: "Opera",
		                    y: 1.92,
		                    drilldown: "Opera"
		                },
		                {
		                    name: "Other",
		                    y: 7.62,
		                    drilldown: null
		                }
		            ]
		        }
		    ],
		    drilldown: {
		        breadcrumbs: {
		            position: {
		                align: 'right'
		            }
		        },
		        series: [
		            {
		                name: "Chrome",
		                id: "Chrome",
		                data: [
		                    [
		                        "v65.0",
		                        0.1
		                    ],
		                    [
		                        "v64.0",
		                        1.3
		                    ],
		                    [
		                        "v63.0",
		                        53.02
		                    ],
		                    [
		                        "v62.0",
		                        1.4
		                    ],
		                    [
		                        "v61.0",
		                        0.88
		                    ],
		                    [
		                        "v60.0",
		                        0.56
		                    ],
		                    [
		                        "v59.0",
		                        0.45
		                    ],
		                    [
		                        "v58.0",
		                        0.49
		                    ],
		                    [
		                        "v57.0",
		                        0.32
		                    ],
		                    [
		                        "v56.0",
		                        0.29
		                    ],
		                    [
		                        "v55.0",
		                        0.79
		                    ],
		                    [
		                        "v54.0",
		                        0.18
		                    ],
		                    [
		                        "v51.0",
		                        0.13
		                    ],
		                    [
		                        "v49.0",
		                        2.16
		                    ],
		                    [
		                        "v48.0",
		                        0.13
		                    ],
		                    [
		                        "v47.0",
		                        0.11
		                    ],
		                    [
		                        "v43.0",
		                        0.17
		                    ],
		                    [
		                        "v29.0",
		                        0.26
		                    ]
		                ]
		            },
		            {
		                name: "Firefox",
		                id: "Firefox",
		                data: [
		                    [
		                        "v58.0",
		                        1.02
		                    ],
		                    [
		                        "v57.0",
		                        7.36
		                    ],
		                    [
		                        "v56.0",
		                        0.35
		                    ],
		                    [
		                        "v55.0",
		                        0.11
		                    ],
		                    [
		                        "v54.0",
		                        0.1
		                    ],
		                    [
		                        "v52.0",
		                        0.95
		                    ],
		                    [
		                        "v51.0",
		                        0.15
		                    ],
		                    [
		                        "v50.0",
		                        0.1
		                    ],
		                    [
		                        "v48.0",
		                        0.31
		                    ],
		                    [
		                        "v47.0",
		                        0.12
		                    ]
		                ]
		            },
		            {
		                name: "Internet Explorer",
		                id: "Internet Explorer",
		                data: [
		                    [
		                        "v11.0",
		                        6.2
		                    ],
		                    [
		                        "v10.0",
		                        0.29
		                    ],
		                    [
		                        "v9.0",
		                        0.27
		                    ],
		                    [
		                        "v8.0",
		                        0.47
		                    ]
		                ]
		            },
		            {
		                name: "Safari",
		                id: "Safari",
		                data: [
		                    [
		                        "v11.0",
		                        3.39
		                    ],
		                    [
		                        "v10.1",
		                        0.96
		                    ],
		                    [
		                        "v10.0",
		                        0.36
		                    ],
		                    [
		                        "v9.1",
		                        0.54
		                    ],
		                    [
		                        "v9.0",
		                        0.13
		                    ],
		                    [
		                        "v5.1",
		                        0.2
		                    ]
		                ]
		            },
		            {
		                name: "Edge",
		                id: "Edge",
		                data: [
		                    [
		                        "v16",
		                        2.6
		                    ],
		                    [
		                        "v15",
		                        0.92
		                    ],
		                    [
		                        "v14",
		                        0.4
		                    ],
		                    [
		                        "v13",
		                        0.1
		                    ]
		                ]
		            },
		            {
		                name: "Opera",
		                id: "Opera",
		                data: [
		                    [
		                        "v50.0",
		                        0.96
		                    ],
		                    [
		                        "v49.0",
		                        0.82
		                    ],
		                    [
		                        "v12.1",
		                        0.14
		                    ]
		                ]
		            }
		        ]
		    }
		});
	}
	
	function dounutChart(){
		
	}
</script>



<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<div id="layoutSidenav_content">
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
                    월별 총 수입
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
                    카테고리별 매출 	통계
                </div>
                <div class="card-body">
	                <!-- 도넛 차트 -->
	                <div id="containerDounut"></div>
                </div>
             	<div class="card-footer small text-muted">Updated at 22-06-16 08:35 PM</div>
			</div>

	        </div>
	</main>

	<%@ include file="bottom.jsp"%>