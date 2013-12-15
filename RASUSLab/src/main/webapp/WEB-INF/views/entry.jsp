<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>Sudjelovanje u nastavi</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="<c:url value="/resources/css/lookCss.css" />" type="text/css" rel="stylesheet">
</head>

<body>
	<div id="outerDIV">
		<div id="headerDIV">
			<h2>Sudjelovanje u nastavi</h2>
		</div>

		<div id="coreDIV">
			<h4>Dobrodošli!</h4>
			<br>
			<div id="innerUpperDIV">
				<p>
					Trenutno se nalazite na stranici: Sudjelovanje u nastavi. Stranica je napravljena
					s namjerom povećanja kvalitete nastave te pruža prvu povratnu informaciju nastavniku
					kolegija. Na stranici postoji mogućnost 
				</p>
				<br>
			</div>

			<div id="innerDownerDIV">
				<form action="/" method="POST">
					Unesi kod: <input type="text" name="quizCode"/>
					<input type="submit" value="Generiraj kviz"/>
				</form>
				<br>
				<br>
				<br>
				
				<p>
					Administratorski ulaz
				</p>

				<a href="Categories">
					<input type="button" value="Ulaz">
				</a>
			</div>
		</div>

		<div id="footerDIV">
			@ TeamZ
		</div>
	</div>
</body>

</html>