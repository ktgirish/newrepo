<!DOCTYPE html>
<html>
<head>
<style>
.democlass {
    color: red;
}
</style>
</head>
<body>

<h1>Hello World</h1>

<p>Click the button to add a class attribute with the value of "democlass" to the h1 element.</p>

<button onclick="myFunction()">Try it</button>
<button onclick="myFunction2()">Try it1</button>
<button onclick="myFunction3()">Try it2</button>

<script>
function myFunction() {
    document.getElementsByTagName("H1")[0].setAttribute("class", "democlass"); 
}
function myFunction2() {
    document.getElementsByClassName("democlass")[0].setAttribute("id", "demoid");
}
function myFunction3() {
	document.getElementsByClassName("democlass")[0].setAttribute("id", "demoid");
    document.getElementById("demoid").innerHTML="Thats It!";
}
</script>

</body>
</html>
