<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Sudjelovanje u nastavi</title>

</head>
<body>

	<div>
		<h3>Dobrodošli na stranicu Sudjelovanja u nastavi</h3>
		<h4>Upišite kod za rješvanje kviza ili korisničke podatke za ulaz u sustav.</h4>
	</div>
	
	<br/>
	<br/>
	<form action="/" method="POST">
	Unesi kod: <input type="text" name="quizCode"/>
	<input type="submit" value="Generiraj kviz"/>
	</form>
	
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	
	<a href="Quizes">
		<input type="button" value="Logiraj me">
	</a>
	
	
</body>
</html>