<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Sudjelovanje u nastavi</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="<c:url value="/resources/css/foundation.css" />"
	type="text/css" rel="stylesheet">
<link href="<c:url value="/resources/css/lookCss.css" />"
	type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="/resources/js/modernizr.js"></script>
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
	<div class="row">
		<div class="twelve columns">
			<div class="panel">Unesite korisničke podatke.</div>
		</div>
	</div>
	<div class="row">
		<div class="twelve column">
			<c:if test="${not empty error}">
				<div class="alert-box warning">
					Your login attempt was not successful, try again.<br /> Caused :
					${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} <a
						href="#" class="close">&times;</a>
				</div>
			</c:if>
		</div>
	</div>
	<div class="row" id = "bouterContainer">
		<div class="twelve column">
			<form id="loginForm" name='f'
				action="<c:url value='j_spring_security_check' />" method='POST'>

				<label>User:</label> <input type='text' name='j_username' value=''>

				<label>Password:</label> <input type='password' name='j_password' />

				<input  name="submit" class="small button" type="submit"
					value="Pošalji" /> <input  name="reset" class="small button"
					type="reset" value="Obriši" />


			</form>
		</div>
	</div>

	<script src="/resources/js/jquery.js"></script>
	<script src="/resources/js/foundation.min.js"></script>
	<script>
		$(document).foundation();
	</script>
</body>

</html>
