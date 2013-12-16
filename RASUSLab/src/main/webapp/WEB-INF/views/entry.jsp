<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js">
<head>
<link href="<c:url value="/resources/css/foundation.css" />"type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="<c:url value="/resources/css/lookCss.css" />" type="text/css" rel="stylesheet">
<script src="/resources/js/modernizr.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script type="text/javascript">
	function startQuiz() {
		var code = document.getElementById("quizCode").value;
		if (code != "") {
			$.ajax({
				type : 'GET',
				url : "/ztel/SolveSimpleQuiz/" + code,
				success : function() {
					window.open("/ztel/SolveSimpleQuiz/" + code, "_self");
				},
				error : function() {
					alert("Wrong quiz code!");
				}
			});
		}
	}
</script>
<title>Sudjelovanje u nastavi</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/lookCsss.css" />"
	type="text/css" rel="stylesheet">
</head>
<body>
	<div class="row">
		<div class="twelve columns">
		<h1>Sudjelovanje u nastavi</h1>
		<hr>
		</div>
	</div>

	
	<div class="row">
		<div class="twelve columns">
		<div class="panel">
		Dobrodošli na stranicu za rješavanje kvizova.</div>
	</div>	
	</div>
	
	<div class="row" id="bouterContainer">
		<div class="twelve column">
		
				<p>Unesi kod:</p> <input type="text" id="quizCode" />
				<button class="small button" onclick="startQuiz()">Generiraj kviz</button>

		</div>
	</div>
	


	<div class="row" id="bouterContainer">
		<div class="twelve column">
		
<hr>
		<a href="/ztel/Categories"> <input class="small button" type="button" value="Admin login"></a></div>
		</div>
		

	<script src="/resources/js/jquery.js"></script>
	<script src="/resources/js/foundation.min.js"></script>
	<script>
		$(document).foundation();
	</script>
</body>

</html>