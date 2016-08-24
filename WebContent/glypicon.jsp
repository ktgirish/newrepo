<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Java Friends</title>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/TableExport/3.2.6/js/tableexport.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/TableExport/3.2.6/js/tableexport.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Base64/1.0.0/base64.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/jspdf/libs/sprintf.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.debug.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/jspdf/libs/base64.js"></script>
</head>
<body>
<div id="toimg">
  <table id="tableID" border="1">
    <thead>
        <tr>
            <th>Name</th>
            <th>Activity on Code Project (%)</th>
            <th>Activity on C# Corner (%)</th>
            <th>Activity on Asp Forum (%)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Sibeesh</td>
            <td>100</td>
            <td>98</td>
            <td>80</td>
        </tr>
        <tr>
            <td>Ajay</td>
            <td>90</td>
            <td>0</td>
            <td>50</td>
        </tr>
        <tr>
            <td>Ansary</td>
            <td>100</td>
            <td>20</td>
            <td>10</td>
        </tr>
        <tr>
            <td>Aghil</td>
            <td>0</td>
            <td>30</td>
            <td>90</td>
        </tr>
        <tr>
            <td>Arya</td>
            <td>0</td>
            <td>0</td>
            <td>95</td>
        </tr>
    </tbody>
</table>
</div>
  	<a href="#" onclick ="func1()">JSON</a>
    <a href="#" onclick ="func2()">XLS</a>
	<a href="#" onclick ="func3()">CSV</a>
	<a href="#" onclick ="func4()">PDF</a> 
<br />
<a id="imageLink" href="data-uri-here" download="myFilename.png">
    Click to download
</a>
<script>
	function func1(){
		$('#tableID').tableExport({type:'json',escape:'false'});
		}
	function func2(){
		$('#tableID').tableExport({type:'excel',escape:'false'});
		}
	function func3(){
		$('#tableID').tableExport({type:'csv',escape:'false'});
		}
	function func4(){
		$('#tableID').tableExport({type:'pdf',escape:'false'});
		}
</script>
<script>
$(document).ready(function() {
	 html2canvas($('#toimg'), {
         onrendered: function (canvas) {
             var img = canvas.toDataURL("image/png")
             $('#imageLink').href=img;
         }
     });

	 alert(img)
});
</script>

</body>

</html>