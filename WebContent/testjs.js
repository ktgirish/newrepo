$(document).ready(function() {
	document.getElementById("h20").innerHTML="Portfolio";
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