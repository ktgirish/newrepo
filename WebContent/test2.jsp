<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test-2</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.min.js"></script> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="icon" type="image/png" href="adopt.png">
 <link href="fonts/font-awesome.css" rel="stylesheet">
 <style>
 #h20{
 	background-color: black;
 	height: 40px;
 	color: white;
 	padding-top: 5px;
 }
 #h20 a{
 	float: right;
 	padding-right: 5px;
 	color: white;
 	
 }
  #h23{
	background-color: black;
 	height: 40px;
	color: white;
 	padding-top: 5px;
 }
  #h24{
 	background-color: black;
 	height: 40px;
 	color: white;
 	padding-top: 5px;
 }
  #h25{
 	background-color: black;
 	height: 40px;
 	color: white;
 	padding-top: 5px;
 }
 #projectburndown{
 	border: 1px solid;
 	margin-top: -10px;
 }
 #projectburndown5{
 	border: 1px solid;
 	margin-top: -10px;
 }
 #projectburndown6{
 	border: 1px solid;
 	margin-top: -10px;
 }
 #projectburndown7{
 	border: 1px solid;
	margin-top: -10px;
 }
 </style>
</head>
<body>
<div class="container-fluid"> 
<div class="row">
<div class="col-sm-12 col-md-5 col-lg-4">
<h3 id="h20" style="text-align: center;">Portfolio<a href="#" id="aid"><span class="glyphicon glyphicon-envelope"></span></a><a href="#"><span class="glyphicon glyphicon-print"></span></a></h3>
	<div id="projectburndown" class="borders">
	<br>
		<canvas id="piechart"></canvas>
	</div>
</div>
<div class="clearfix visible-sm-block"></div>
<div class="col-sm-12 col-md-5 col-lg-4 col-lg-offset-2">
<h3 id="h23" style="text-align: center;">Project Status</h3>
	<div id="projectburndown5" class="borders">
	<br>
		<canvas id="pbarchart"></canvas>
	</div>
</div>
<div class="clearfix visible-sm-block"></div>
<div class="clearfix visible-md-block"></div>
<div class="clearfix visible-lg-block"></div>
<hr id="hrid">
<div class="col-sm-12 col-md-5 col-lg-4">
<h3 id="h24" style="text-align: center;">Release Status of Projects</h3>
	<div id="projectburndown6" class="borders">
	<br>
		<canvas id="hbarchart"></canvas>
	</div>
</div>
<div class="clearfix visible-sm-block"></div>
<div class="col-sm-12 col-md-5 col-lg-4 col-lg-offset-2">
<h3 id="h25" style="text-align: center;">Open Issues in each Project</h3>
	<div id="projectburndown7" class="borders">
	<br>
		<canvas id="polarchart"></canvas>
	</div>
</div>
<div class="clearfix visible-sm-block"></div>
<div class="clearfix visible-md-block"></div>
<div class="clearfix visible-lg-block"></div>
<div class="col-md-6 col-sm-offset-3">
<h3 id="h22" style="text-align: center;"></h3>
<!-- <a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a> -->
	<div id="projectburndown2" class="borders">
		<canvas id="barchart"></canvas>
	</div>
	<div id="projectburndown3" class="borders">
		<canvas id="hrbarchart"></canvas>
	</div>
	<div id="projectburndown4" class="borders">
	</div>
</div>
</div>
</div>
<script>
$(document).ready(function() {
	/* document.getElementById("h20").innerHTML="Portfolio"; */
	/* var dat=document.getElementById("piechart");
	var data=dat.toDataURL("image/png");
	alert(data)
	$('#aid').attr({
		"href" : "mailto:x@y.com?body=" + data,
		"title": "Mail To"
		}) */
		/* $('#aid'). */
	var ctx = document.getElementById("piechart").getContext("2d");
	var projects=[50, 0, 75, 100, 0, 100, 22];
	var cmp=0, inp=0, nst=0;
	var cmpv=[]; var inpv=[]; var nsv=[];
	var cmpp=[]; var inpp=[]; var nsp=[];
	var barclr=[];
	for(i=0; i<projects.length; i++){
		if(projects[i]==0){
			nst++;
			nsv.push(projects[i]);
			nsp.push("Project "+(i+1));
			barclr[i]="#ff704d";
			}
		else if(projects[i]<100 && projects[i]>0){
			inp++;
			inpv.push(projects[i]);
			inpp.push("Project "+(i+1));
			barclr[i]="#ffff80";
			}
		else if(projects[i]==100){
			cmp++;
			cmpv.push(projects[i]);
			cmpp.push("Project "+(i+1));
			barclr[i]="#33cc33";
			}
		}
	
	var data = {
		    labels: [
		        "Completed",
		        "In Progress",
		        "Not Started"
		    ],
		    datasets: [
				        {
				            data: [cmp, inp, nst],
				            backgroundColor: [
				                "#33cc33",
				                "#ffff80",
				                "#ff704d"
				            ],
				            hoverBackgroundColor: [
				                "#248f24",
				                "#ffff33",
				                "#ff471a"
				            ]
				        }]
		};

	var myPieChart = new Chart(ctx,{
	    type: 'pie',
	    data: data,
	    options: {
	        responsive: true,
	        legend: {
                position: 'bottom',
            }
	    }
	});

	$("#piechart").click( 
		function(evt){
			var activePoints = myPieChart.getElementsAtEvent(evt);	
			var status=data.labels[activePoints[0]["_index"]];
			var bgc=data.datasets[0].backgroundColor[activePoints[0]["_index"]];
			call();
			function call(){
				document.getElementById("h22").innerHTML=status+" - Projects";
				$('#projectburndown').hide(1000);
				$('#projectburndown5').hide(1000);
				$('#projectburndown6').hide(1000);
				$('#projectburndown7').hide(1000);
				$('#h20').hide();
				$('#h23').hide();
				$('#h24').hide();
				$('#h25').hide();$('#hrid').hide();
				if(status=="Completed"){
					var data2={
						labels: cmpp,
						datasets: [
							{
								label: "Completion Percentage",
								data: cmpv,
								backgroundColor: bgc
							}]	
								};
					}
				else if(status=="In Progress"){
					var data2={
							labels: inpp,
							datasets: [
								{
									label: "Completion Percentage",
									data: inpv,
									backgroundColor: bgc
								}]	
									};
					}
				else if(status=="Not Started"){
					var data2={
							labels: nsp,
							datasets: [
								{
									label: "Completion Percentage",
									data: nsv,
									backgroundColor: bgc
								}]	
									};
					}
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
						//alert(data2.datasets[0].data[activePoints2[0]["_index"]])
						var prj=data2.labels[activePoints2[0]["_index"]];
						call2();
						function call2(){
							document.getElementById("h22").innerHTML=prj+"'s Sprints";
							$('#projectburndown2').hide(1000);
							if(status=="Completed"){
								var data3= {
										labels: ["Sprint1", "Sprint2", "Sprint3", "Sprint4", "Sprint5", "Sprint6"],
										datasets: [
													{
														label: prj,
														data: [100, 100, 100, 100, 100, 100],
														backgroundColor: bgc,
														}]
											};
							}
							else if(status=="In Progress"){
								var data3= {
										labels: ["Sprint1", "Sprint2", "Sprint3", "Sprint4", "Sprint5", "Sprint6"],
										datasets: [
													{
														label: prj,
														data: [100, 100, 65, 0, 0, 0],
														backgroundColor: ["#33cc33", "#33cc33", "#ffff80", "#ff704d", "#ff704d", "#ff704d"],
														}]
											};
							}
							var ctx3 = document.getElementById("hrbarchart").getContext("2d");
							var myHBarChart = new Chart(ctx3, {
							    type: 'horizontalBar',
							    data: data3,
							    options: {
							        responsive: true,
							        legend: {
				                        position: 'bottom',
				                    },
				                    scales: {
				                        xAxes: [{
				                            display: true,
				                            ticks: {
				                                //suggestedMin: 0,   
				                                beginAtZero: true,
				                                suggestedMax: 100   
				                            }
				                        }]
				                    }
							    }
							});
							$("#hrbarchart").click( 
								function(evt){
									var activePoints3 = myHBarChart.getElementsAtEvent(evt); 
									var sprints=data3.labels[activePoints3[0]["_index"]];
									call3();
									function call3(){
										document.getElementById("h22").innerHTML=prj+" - "+sprints+"'s Details";
										$('#projectburndown3').hide(1000);
										var output = "";
										output +='<table class="table table-bordered" id="issuestable">';
										output += '<thead>';
										output += '<tr>';
										output += '<th>Issue Name</th>';
										output += '<th>Description</th>';
										output += '<th>Status</th>';
										output += '<th>Created Date</th>';
										output += '<th>Blocks(if any)</th>';
										output += '<th>Assigned To</th>';
										output += '</tr>';
										output += '</thead>';
										output += '<tbody>';
										output += '<tr>';
										output += '<td>Bank Name Introduction</td><td>Introduce Bank Name on home page</td><td>Done</td><td>2016-05-11 10:42:01</td><td></td><td>Avinash</td>';
										output += '</tr>';
										output += '<tr>';
										output += '<td>Add Features</td><td>As a product owner, I want to add the features to the address module so that I can use the features in the web application</td><td>In Progress</td><td>2016-07-11 10:42:01</td><td></td><td>Bharath</td>';
										output += '</tr>';
										output += '<tr>';
										output += '<td>Test Full functionality of the application</td><td>Test Full functionality of the application</td><td>To Do</td><td>2016-06-11 10:42:01</td><td></td><td>Arun</td>';
										output += '</tr>';
										output += '</tbody>';
										output += ' </table>';
										document.getElementById("projectburndown4").innerHTML = output;
										}									    
								    });
							
							}

							    });				
				}
			    });
	var data4={
			labels: ["Project1", "Project2", "Project3", "Project4", "Project5", "Project6", "Project7"],
			datasets: [
				{
					label: "Completion Percentage",
					data: projects,
					backgroundColor: barclr
				}]	
					};
	var ctx4 = document.getElementById("pbarchart").getContext("2d");
	var myBarChart2 = new Chart(ctx4, {
	    type: 'bar',
	    data: data4,
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

	var data5= {
			labels: ["Project1", "Project2", "Project3", "Project4", "Project5", "Project6", "Project7"],
			datasets: [
						{
							label: "Sprints Completed",
							data: [3,0,5,6,0,6,1],
							backgroundColor: ["#ffff80", "#ff704d", "#ffff80", "#33cc33", "#ff704d", "#33cc33", "#ffff80"],
							}]
				};
	var ctx5 = document.getElementById("hbarchart").getContext("2d");
	var myHBarChart2 = new Chart(ctx5, {
	    type: 'horizontalBar',
	    data: data5,
	    options: {
	        responsive: true,
	        legend: {
                position: 'bottom',
            },
            scales: {
                xAxes: [{
                    display: true,
                    ticks: {
                        //suggestedMin: 0,   
                        beginAtZero: true,
                        suggestedMax: 6   
                    }
                }]
            }
	    }
	});

	var data6= {
			labels: ["Project1", "Project2", "Project3", "Project4", "Project5", "Project6", "Project7"],
			datasets: [
						{
							label: "Open Issues",
							data: [15,30,8,0,30,0,26],
							backgroundColor: ["#ffff80", "#ff704d", "#ffff80", "#33cc33", "#ff704d", "#33cc33", "#ffff80"],
							}]
				};
	var ctx6 = document.getElementById("polarchart").getContext("2d");
	var myPolarChart = new Chart(ctx6,{
	    type: 'polarArea',
	    data: data6,
	    options: {
	        responsive: true,
	        legend: {
                position: 'bottom',
            }
	    }
	});
	
	
});

</script>
</body>
</html>