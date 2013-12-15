<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function endQuiz()
{
	alert("Vaši odgovori su spremljeni.");
}
</script>
<title>Kviz</title>
</head>
<body>


<form:form action="/ztel/SolveSimpleQuiz/formsubmit" method="POST" modelAttribute="ansOfQuestions">
<label>Kviz ${quizCode}</label>
<form:input path="idQuiz" style="visibility:collapse;"/>

	<c:forEach var="i" begin="0" end="${fn:length(questions)-1}">
		<div>
			<label>${questions[i].textQuestion}</label>
			<form:input path="questionsId[${i }]" value="${questions[i].idQuestion}" readonly="true" style="display: none;"/>
			<c:if test="${questions[i].answers.size() != 1 }">
			<form:select path="userAnswers[${i }]">
			<c:forEach items="${questions[i].answers }" var="answer">
			
			<option>${answer} </option>
			
			</c:forEach>
			</form:select>
			</c:if>
			<c:if test="${questions[i].answers.size() == 1 }">
			<form:input path="userAnswers[${i }]"/>
			</c:if>
		</div>
	</c:forEach>
	<input type="submit" onclick="endQuiz()" value="Save" />
</form:form>
</body>
</html>