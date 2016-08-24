<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h4>JSON Parsing</h4>
<script>
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
/* for (var key in sprintinfo) {
	if (sprintinfo.hasOwnProperty(key)) {
	  //alert(sprintinfo[key].InProgressIssues[0].issueName);
	  for(var i in sprintinfo[key].completedIssues)
	  alert(sprintinfo[key].completedIssues[i].issueName);
	}
	}  */
//alert(Object.keys(sprintinfo))
var key=Object.keys(sprintinfo);
	for(var i in key){
		alert(sprintinfo[key[i].InProgressIssues])
	}
</script>
</body>
</html>