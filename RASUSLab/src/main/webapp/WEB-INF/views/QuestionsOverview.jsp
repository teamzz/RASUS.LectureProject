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

<script>
function deleteQuestion(questionId){
	window.open("/ztel/Questions/overview/delete?id="+questionId,'_self',false);
}
</script>

</head>

<body>

	<div class="row">
		<div class="twelve columns">
			<h1>Sudjelovanje u nastavi #${category.categoryName}</h1>
			<hr>
		</div>
	</div>
	<br>
	<br>

	<div class="row">
		<div class="twelve columns">
			<p>Popis neiskorištenih pitanja kategorije.</p>
			<br> <br>
			<div class="row">
				<div class="twelve columns"></div>
				<c:forEach items="${questions}" var="question" varStatus="status">
				<div class="row" id="souterContainer">
					<div class="large-10 columns">
						<b>Pitanje: ${question.textQuestion}
						</b><br>
						<br>
						<div class="panel">
						Točni odgovori:
						<br>
						<div id="correctAnswers">
						<c:forEach items="${question.correctAnswers}" var="correctAnswer"
							varStatus="status">
								 ${correctAnswer.textAnswer}<br>
						</c:forEach>
						<br>
						</div>
						Netočni odgovori:
						<br>
						<div id="incorrectAnswers">
						<c:forEach items="${question.incorrectAnswers}"
							var="incorrectAnswer" varStatus="status">
								${incorrectAnswer.textAnswer}<br>
						</c:forEach>
						</div>
						</div>
					</div>
					<div class="small-2 columns">
						<input id="questionOverviewBtn" class="small button" type="button" name="idQuestion"
							onclick="deleteQuestion(${question.idQuestion})" value="Obriši" />
					</div>
				</div>
				<hr>
				</c:forEach>
			</div>
		</div>
	</div>


</body>
</html>