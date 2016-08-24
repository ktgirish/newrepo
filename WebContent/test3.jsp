<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test3</title>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
<div id=test3_chart>Please wait...</div>
<button id="button">To Image!!!</button>
<script type="text/javascript">
  google.load('visualization', '1.0', {'packages':['corechart']});
  google.setOnLoadCallback(drawChart);    
  var data; 
  var chart;
  var rows=['Work', 'Eat', 'Commute', 'Watch TV', 'Sleep'];
  var columns=[11, 2, 2, 2, 7]; 
  var combined=[];
  combined[0]=['Task', 'Hours per Day'];
  for(var i=0; i<rows.length; i++){
	combined[i+1]=[rows[i],columns[i]];
	  }
  function drawChart() {
   /* data = new google.visualization.DataTable();  
   data.addColumn('string', 'Where');
   data.addColumn('number', 'What');
   data.addRows([['ABC',87],['ERT',70],['KLJ',38],['UPP',-67],['SSD',27],['UKG',42],['NUS',60],['WEB',96]]);
   var options = {'title':'my chart','width':'600','height':'400','is3D':'true'};
   chart = new google.visualization.ColumnChart(document.getElementById('test3_chart'));
   chart.draw(data, options); */
   data = google.visualization.arrayToDataTable(combined,false
                                                    /*  ['Task', 'Hours per Day'],
                                                     /*['Work',     11],
                                                     ['Eat',      2],
                                                     ['Commute',  2],
                                                     ['Watch TV', 2],
                                                     ['Sleep',    7] 
                                                     [rows , columns] */
                                                   );

                                                  var options = {
                                                     title: 'My Daily Activities',
                                                     'width':'600','height':'400' ,'is3D':'true' 
                                                   }; 
     /* var wrapper=new google.visualization.ChartWrapper({
		chartType: 'PieChart',
		dataTable: [rows , columns],
		options: {'title': 'My Daily Activities','width':'600','height':'400' ,'is3D':'true'},
		containerId: 'test3_chart'
         });
     wrapper.draw(); */                                            

         chart = new google.visualization.PieChart(document.getElementById('test3_chart'));
		 chart.draw(data, options); 
		 
   google.visualization.events.addListener(chart, 'select', selectHandler2);
  }

  function selectHandler2() {
      var selection = chart.getSelection()[0];
      if(selection){
      var row= selection.row;
      var column=selection.column;
      alert(data.getValue(row,1));
      }
  }

  $('#button').click(function(){
		var iU=chart.getImageURI();
		window.open(iU);

	  });
</script>
</body>
</html>