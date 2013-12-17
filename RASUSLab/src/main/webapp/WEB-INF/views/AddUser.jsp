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
<link href="<c:url value="/resources/css/lookCss.css" />"
	type="text/css" rel="stylesheet">
<title>Sudjelovanje u nastavi</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<!-- dodati provjeru da li username vec postoji -->
</head>

<body>
	<div class="row">
		<div class="twelve columns">
			<h2>Sudjelovanje u nastavi #${category.categoryName}</h2>
			<hr>
		</div>
	</div>
	<br>
	<br>

	<div class="row">
		<div class="twelve columns">
			<p>Unesite tražene podatke:</p>
			<br> <br>
			<div class="row" id="bouterContainer">
				<div class="twelve columns"></div>
				<form:form method="POST" action="/ztel/userAdded" id="userForm"
					modelAttribute="newProfessor">
						<tr>
							<td><form:label path="">Ime: </form:label></td>
						</tr>
						<tr>
							<td><form:input path="" name="name" /></td>
						</tr>
						<tr>
							<td><form:label path="">Prezime: </form:label></td>
						</tr>
						<tr>
							<td><form:input path="" name="surname" /></td>
						</tr>
						<tr>
							<td><form:label path="">Odijeljenje: </form:label></td>
						</tr>
						<tr>
							<td><form:input path="" name="department" /></td>
						</tr>
						<tr>
							<td><form:label path="">Korisničko ime: </form:label></td>
						</tr>
						<tr>
							<td><form:input path="" name="username" /></td>
						</tr>
						<tr>
							<td><form:label path="">Lozinka: </form:label></td>
						</tr>
						<tr>
							<td><form:input path="" name="password" /></td>
						</tr>

						<tr>
							<td><form:input path="" class="button" type="submit" value="Pošalji" /></td>
						</tr>
						<tr>
							<td><form:input path="" class="button" type="reset" value="Resetiraj" /></td>
						</tr>

				</form:form>
			</div>
		</div>
	</div>

</body>
</html>