<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reaktivacija kviza</title>
</head>
<body>

Stari kod: ${quiz.code }

<form:form action="/ztel/ReactivateQuiz/formsubmit" modelAttribute="quiz">
Novi kod <form:input name="code" path="" value="" />
<form:input path="idQuiz" style="visibility:collapse;"/>
<input type="submit" value="Spremi kviz" />
</form:form>

</body>
</html>