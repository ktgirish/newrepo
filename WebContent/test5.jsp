<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test5</title>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid"> 
<div class="row">
<div class="col-sm-12 col-md-6 col-lg-6 col-md-offset-3 col-lg-offset-3">
<br>
<div id=test3_chart align="center">Please wait...</div>

</div>
</div>
</div>
<script type="text/javascript">
google.load('visualization', '1.0', {'packages':['corechart']});
google.setOnLoadCallback(drawChart);
var sprintinfo={  
		   "Sample Sprint 2":{  
			      "InProgressIssues":[  
			         {  
			            "issueName":"KT-10",
			            "issueStatus":"In Progress",
			            "issueSummary":"As a developer, I can update story and task status with drag and drop (click the triangle at far left of this story to show sub-tasks)"
			         },
			         {  
			            "issueName":"KT-13",
			            "issueStatus":"In Progress",
			            "issueSummary":"As a developer, I can update details on an item using the Detail View >> Click the \"KT-13\" link at the top of this card to open the detail view"
			         }
			      ],
			      "NotStratedIssues":[  
			         {  
			            "issueName":"KT-14",
			            "issueStatus":"To Do",
			            "issueSummary":"As a user, I can find important items on the board by using the customisable \"Quick Filters\" above >> Try clicking the \"Only My Issues\" Quick Filter above"
			         }
			      ],
			      "completedIssues":[  
			         {  
			            "issueName":"KT-15",
			            "issueStatus":"Done",
			            "issueSummary":"As a scrum master, I can see the progress of a sprint via the Burndown Chart >> Click \"Reports\" to view the Burndown Chart"
			         },
			         {  
			            "issueName":"KT-16",
			            "issueStatus":"Done",
			            "issueSummary":"As a team, we can finish the sprint by clicking the cog icon next to the sprint name above the \"To Do\" column then selecting \"Complete Sprint\" >> Try closing this sprint now"
			         },
			         {  
			            "issueName":"KT-17",
			            "issueStatus":"Done",
			            "issueSummary":"Instructions for deleting this sample board and project are in the description for this issue >> Click the \"KT-17\" link and read the description tab of the detail view for more"
			         }
			      ]
			   },
			   "Sample Sprint 1":{  
			      "InProgressIssues":[  

			      ],
			      "NotStratedIssues":[  
			         {  
			            "issueName":"KT-16",
			            "issueStatus":"To Do",
			            "issueSummary":"As a team, we can finish the sprint by clicking the cog icon next to the sprint name above the \"To Do\" column then selecting \"Complete Sprint\" >> Try closing this sprint now"
			         }
			      ],
			      "completedIssues":[  
			         {  
			            "issueName":"KT-18",
			            "issueStatus":"Done",
			            "issueSummary":"As a user, I'd like a historical story to show in reports"
			         },
			         {  
			            "issueName":"KT-19",
			            "issueStatus":"Done",
			            "issueSummary":"As a user, I'd like a historical story to show in reports"
			         },
			         {  
			            "issueName":"KT-20",
			            "issueStatus":"Done",
			            "issueSummary":"As a user, I'd like a historical story to show in reports"
			         },
			         {  
			            "issueName":"KT-21",
			            "issueStatus":"Done",
			            "issueSummary":"As a user, I'd like a historical story to show in reports"
			         },
			         {  
			            "issueName":"KT-22",
			            "issueStatus":"Done",
			            "issueSummary":"As a user, I'd like a historical story to show in reports"
			         },
			         {  
			            "issueName":"KT-23",
			            "issueStatus":"Done",
			            "issueSummary":"As a user, I'd like a historical story to show in reports"
			         }
			      ]
			   }
			};

var rows=Object.keys(sprintinfo);
var columns={};
for(var i in rows){
	columns[i]=sprintinfo[rows[i]].InProgressIssues.length + sprintinfo[rows[i]].NotStratedIssues.length + sprintinfo[rows[i]].completedIssues.length;
}

var combined=[];
combined[0]=['Sprint Name', 'No. Of Sprints'];
for(var i=0; i<rows.length; i++){
	combined[i+1]=[rows[i],columns[i]];
	  }

function drawChart() {
	 data = google.visualization.arrayToDataTable(combined,false);

	 var options = {
             title: 'Sprint Details',
             'width':'600','height':'400' ,'is3D':'true',
             animation: {duration: 1000,
                 easing: 'out'} 
           }; 
	 chart = new google.visualization.PieChart(document.getElementById('test3_chart'));
	 chart.draw(data, options); 

	 google.visualization.events.addListener(chart, 'select', selectHandler2);
}

function selectHandler2() {
    var selection = chart.getSelection()[0];
    if(selection){
    var row= selection.row;
    var sprint=data.getValue(row,0);

    var rows1=["In Progress", "Not Started", "Completed"];
    var columns1=[sprintinfo[sprint].InProgressIssues.length, sprintinfo[sprint].NotStratedIssues.length, sprintinfo[sprint].completedIssues.length];

    var combined1=[];
    combined1[0]=['Status', 'No. Of Sprints'];
    for(var i=0; i<rows1.length; i++){
    	combined1[i+1]=[rows1[i],columns1[i]];
    	  }

   	 data = google.visualization.arrayToDataTable(combined1,false);

   	 var options = {
                title: 'Status of Sprints - '+sprint,
                'width':'600','height':'400' /* ,'is3D':'true' */ 
              }; 
   	 chart = new google.visualization.ColumnChart(document.getElementById('test3_chart'));
   	 chart.draw(data, options); 

   	 google.visualization.events.addListener(chart, 'select', selectHandler3);

   	function selectHandler3(){
   		var selection1 = chart.getSelection()[0];
   		if(selection1){
   			var row1= selection1.row;
   		    var status=data.getValue(row1,0);
   		    var issues={};

   		    if(status == "In Progress")
   		    	issues=sprintinfo[sprint].InProgressIssues;
   		    else if(status == "Not Started") 
   		    	issues=sprintinfo[sprint].NotStratedIssues;
   		    else if(status == "Completed")
   		    	issues=sprintinfo[sprint].completedIssues;

   			var output = "";
   			output += '<h3>'+sprint+' - '+status+' - Issues</h3>';
   			output += '<br>';
			output +='<table class="table table-bordered" id="issuestable">';
			output += '<thead>';
			output += '<tr>';
			output += '<th>Issue Name</th>';
			output += '<th>Description</th>';
			output += '<th>Status</th>';
			output += '</tr>';
			output += '</thead>';
			output += '<tbody>';
			for(var i in issues){
				output += '<tr>';
				output += '<td>'+ issues[i].issueName +'</td>';
				output += '<td>'+ issues[i].issueSummary +'</td>';
				output += '<td>'+ issues[i].issueStatus +'</td>';
				output += '</tr>';
				}
			output += '</tbody>';
			output += ' </table>';
			document.getElementById("test3_chart").innerHTML = output;
   	   		}
   	   	}
    }
}
</script>
</body>
</html>