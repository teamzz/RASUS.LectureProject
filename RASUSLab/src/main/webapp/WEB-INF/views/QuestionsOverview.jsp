<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>Sudjelovanje u nastavi</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/foundation.css" />"
	type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="<c:url value="/resources/css/lookCss.css" />"
	type="text/css" rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	
<script>
function deleteQuestion(questionId){
	window.open("/ztel/Questions/overview/delete?id="+questionId,'_self',false);
}
</script>
	
</head>
<body>
<c:forEach items="${questions}" var="question" varStatus="status">
	${question.textQuestion}<br>
	<c:forEach items="${question.correctAnswers}" var="correctAnswer" varStatus="status">
		- ${correctAnswer.textAnswer} (correct)<br>
	</c:forEach>
	<c:forEach items="${question.incorrectAnswers}" var="incorrectAnswer" varStatus="status">
		- ${incorrectAnswer.textAnswer} (incorrect)<br>
	</c:forEach> 
	<input type="button" name="idQuestion" onclick="deleteQuestion(${question.idQuestion})" value="Delete"/>
	
	<hr>
</c:forEach>

</body>
</html>