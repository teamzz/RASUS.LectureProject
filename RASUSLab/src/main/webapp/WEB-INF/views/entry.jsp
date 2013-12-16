<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js">
<head>
<link href="<c:url value="/resources/css/foundation.css" />"
	type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="/resources/js/modernizr.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

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
		<div id="headerDIV">
			<h2>Sudjelovanje u nastavi</h2>
		</div>

		<div id="coreDIV">
			<h4>Dobrodošli!</h4>
			<br>
			<div id="innerUpperDIV">
				<p>Trenutno se nalazite na stranici: Sudjelovanje u nastavi.
					Stranica je napravljena s namjerom povećanja kvalitete nastave te
					pruža prvu povratnu informaciju nastavniku kolegija. Na stranici
					postoji mogućnost</p>
				<br>
			</div>

			<div id="innerDownerDIV">
				
					Unesi kod: <input type="text" id="quizCode"/>
					<button onclick="startQuiz()" >Generiraj kviz</button>
			
				<br>
				<br>
				<br>
				
				<p>
					Administratorski ulaz
				</p>

				Unesi kod: <input type="text" id="quizCode" />
				<button class="small button" onclick="startQuiz()">Generiraj
					kviz</button>

				<br> <br> <br>

				<p>Administratorski ulaz</p>

				<a href="/ztel/Categories"> <input type="button" value="Ulaz">
				</a>
			</div>
		</div>

		<div id="footerDIV">@ TeamZ</div>
	</div>

	<script src="/resources/js/jquery.js"></script>
	<script src="/resources/js/foundation.min.js"></script>
	<script>
		$(document).foundation();
	</script>
</body>

</html>