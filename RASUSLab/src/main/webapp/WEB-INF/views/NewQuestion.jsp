<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta  >
<title>Insert title here</title>



</head>
<body>
	<h1>Please enter number of answers to your new question.</h1><hr>



	<form:form method="POST" action="/ztel/formsubmit" modelAttribute="question" id="inputsForm">
		<table id = "formTable">
			<tr>
				<td><form:label path="questionType">Question Type (A/B)</form:label></td>
				<td><form:input path="questionType" /></td>
				<td><form:label path="numberOfIncorrectAnswers">Number of incorrect answers</form:label></td>
				<td><form:input path="numberOfIncorrectAnswers" /></td>
				<td><form:label path="numberOfCorrectAnswers">Number of correct answers</form:label></td>
				<td><form:input path="numberOfCorrectAnswers" /></td>
				
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="Next"/></td>
			</tr>
		</table>
	</form:form>
</body>
</html>