<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Kviz</title>
</head>
<body>

<form:form action="/ztel/SolveSimpleQuiz/formsubmit" method="POST" modelAttribute="ansOfQuestions">
<label>Kviz br. </label><form:input path="idQuiz" value="6"/>

	<c:forEach var="i" begin="0" end="${fn:length(questions)-1}">
		<div>
			<label>${questions[i].textQuestion}</label>
			<form:input path="questionsId[${i }]" value="${questions[i].idQuestion}" />
			<form:select path="userAnswers[${i }]">
			<c:forEach items="${questions[i].answers }" var="answer">
			
			<option>${answer} </option>
			
			</c:forEach>
			</form:select>
			
		</div>
	</c:forEach>
	<input type="submit" value="Save" />
</form:form>
</body>
</html>