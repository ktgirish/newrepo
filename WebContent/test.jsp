<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test</title>
<style type="text/css">
.row.content {height: 1500px}
 .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
</style>
<!-- <script type="text/javascript" src="js/testjs.js"></script> -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.min.js"></script> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container-fluid">
<div class="row content">
<div class="col-sm-3 sidenav">
<h4>Chart</h4>
<ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#section1">Pie Chart</a></li>
        <li><a href="#section2">Bar Chart</a></li>
        <li><a href="#section3">Line Chart</a></li>
      </ul>
</div>
<div class="col-sm-9">
<h2>Charts</h2>
	<div id="projectburndown" class="borders">
		<canvas id="piechart"></canvas>
	</div>
	<div id="projectburndown2" class="borders">
	<canvas id="barchart"></canvas>
	</div>
	<div id="projectburndown3" class="borders">
	<canvas id="linechart"></canvas>
	</div>
</div>
</div>
</div>
<script>
$(document).ready(function() {
	var ctx = document.getElementById("piechart").getContext("2d");
	var data = {
		    labels: [
		        "Red",
		        "Blue",
		        "Yellow"
		    ],
		    datasets: [
				        {
				            data: [300, 50, 100],
				            backgroundColor: [
				                "#FF6384",
				                "#36A2EB",
				                "#FFCE56"
				            ],
				            hoverBackgroundColor: [
				                "#FF6384",
				                "#36A2EB",
				                "#FFCE56"
				            ]
				        }]
		};
	
	var myPieChart = new Chart(ctx,{
	    type: 'pie',
	    data: data,
	    options: {
	        responsive: true
	    }
	});

	$("#piechart").click( 
		    function(evt){
		        var activePoints = myPieChart.getElementsAtEvent(evt);           
		        /* var date=datearray[activePoints[0]["_index"]]; */
		        var clr=data.labels[activePoints[0]["_index"]];
		        //alert(data.datasets[0].data[activePoints[0]["_index"]]);
				call(clr);
				function call(cc){
					$('#projectburndown').hide(1000);
					var data2={
						labels: ["Label1","Label2","Label3"],
						datasets: [
								{
									label: cc,
									data: [20, 30, 40],
									backgroundColor: [
											cc,cc,cc
														]
									}]	
							};
					var ctx2 = document.getElementById("barchart").getContext("2d");
					
					var myBarChart = new Chart(ctx2, {
					    type: 'bar',
					    data: data2,
					    options: {
					        responsive: true,
					        legend: {
		                        position: 'bottom',
		                    },
		                    scales: {
		                        yAxes: [{
		                            display: true,
		                            ticks: {
		                                //suggestedMin: 0,   
		                                beginAtZero: true   
		                            }
		                        }]
		                    }
					    }
					});

					$("#barchart").click( 
						    function(evt){
						    	 var activePoints2 = myBarChart.getElementsAtEvent(evt); 
								 var lbl=data2.labels[activePoints2[0]["_index"]];
								 call2(lbl);
								 function call2(cc2){
									$('#projectburndown2').hide(1000);
									var data3= {
										labels: ["L1", "L2", "L3", "L4", "L5"],
										datasets: [
													{
														label: cc2,
														data: [5, 10, 15, 13, 4],
														backgroundColor: cc,
														}]
											};
									var ctx3 = document.getElementById("linechart").getContext("2d");

									var myLineChart = new Chart(ctx3, {
									    type: 'line',
									    data: data3,
									    options: {
									        responsive: true,
									        legend: {
						                        position: 'bottom',
						                    },
						                    scales: {
						                        yAxes: [{
						                            display: true,
						                            ticks: {
						                                //suggestedMin: 0,   
						                                beginAtZero: true   
						                            }
						                        }]
						                    }
									    }
									});
									 }
							    });					
				}		        
		    }
		); 
});

</script>
</body>
</html>