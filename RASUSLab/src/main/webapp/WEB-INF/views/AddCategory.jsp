<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/foundation.css" />"
	type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="/resources/js/modernizr.js"></script>
<title>Sudjelovanje u nastavi</title>
<link href="<c:url value="/resources/css/lookCss.css" />"
	type="text/css" rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<!-- dodati provjeru da li username vec postoji -->
</head>

<body>
	<div class="row">
		<div class="twelve columns">
			<h1>Sudjelovanje u nastavi</h1>
			<hr>
		</div>
	</div>
	<br>
	<br>

	<div class="row" id="bouterContainer">
		<div class="twelve columns">
			<p>Unesite podatke o kategoriji:</p>
			<br> <br>
			<div class="row" id="bouterContainer">
				<div class="twelve columns"></div>
				<form:form method="POST" action="/ztel/categoryAdded"
					id="categoryForm" modelAttribute="newCategory">
					<tr>
						<td><form:label path="">Naziv kategorije: </form:label></td>
					</tr>
					<tr>
						<td><form:input name="categoryName" path=""></form:input></td>
					</tr>
					<tr>
						<td><input class="small button" type="submit" value="Dodaj" /></td>
						<td><input class="small button" type="reset" value="Obriši" /></td>
					</tr>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>