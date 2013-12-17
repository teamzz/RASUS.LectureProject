<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/foundation.css" />"
	type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="/resources/js/modernizr.js"></script>
<link href="<c:url value="/resources/css/lookCss.css" />"
	type="text/css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
	var currentOptions = new Array();
	var current;
	function selectMultiple(s) {
		current = s.selectedIndex;
		var topush = true;
		for (var i = 0; i < currentOptions.length; i++) {
			if (current == currentOptions[i]) {
				currentOptions.splice(i, 1);
				topush = false;
				break;
			}
		}

		if (i >= currentOptions.length && topush)
			currentOptions.push(current);
		for (var i = 0; i < s.options.length; i++)
			s.options[i].selected = false;
		for (var i = 0; i < currentOptions.length; i++)
			s.options[currentOptions[i]].selected = true;
	}

	function saveQuestion() {
		var questionId = document.getElementById("questionId").value;
		$.ajax({
			url : "/ztel/AddQuiz/jax/addquestion",
			type : 'POST',
			dataType : 'json',
			data : "{\"idQuestion\":\"" + questionId + "\"}",
			contentType : 'application/json',
			mimeType : 'application/json',
			success : function(data) {
				alert("saved");

			},

		});

		document.getElementById("selectQuestion" + questionId).disabled = true;

		var table = document.getElementById("selectedQuestionsTable");
		{
			var row = table.insertRow(-1);
			var cell1 = row.insertCell(0);
			cell1.innerHTML = questionId;
		}

	}

	function closeWindow() {
		alert("Kviz je dodan.");
		window.close();
	}
</script>

<title>Sudjelovanje u nastavi</title>
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

	<div class="row" id="bouterContainer">
		<div class="twelve columns">
			<form:form method="POST" modelAttribute="quizholder"
				action="/ztel/AddQuiz/formsubmit">
				<div>
					<form:label path="quiz.quizName">Ime kviza</form:label>
					<form:input path="quiz.quizName" />
				</div>
				<div>
					<form:label path="quiz.quizName">Kod</form:label>
					<form:input path="quiz.code" />
				</div>
				<div>
					<form:input path="idProfessor" value="${idProfessor }"
						style="visibility: collapse;"></form:input>
				</div>
				<div>
					<form:input path="idCategory" value="${idCategory}"
						style="visibility: collapse;"></form:input>
				</div>
				<p>
					Odaberite pitanja za ovaj kviz <br>
				</p>
				<div>
					<c:if test="${questions.size() == 0 }">
						<b>Nemate napravljenih pitanja u ovoj kategoriji</b>
					</c:if>
					<c:if test="${questions.size() > 0 }">
						<select id="questionId">
							<c:forEach items="${ questions }" var="question">
								<option id="selectQuestion${question.idQuestion}"
									value="${question.idQuestion }">
									${question.textQuestion}</option>
							</c:forEach>
						</select>
						<button class="small button" type="button" onclick="saveQuestion()">Postavi
							pitanje u kviz</button>
					</c:if>
				
				<br>
				<br>	
				</div>
					<div>
						<input class="small button" type="submit" onclick="closeWindow()" value="Spremi kviz" />
					</div>
			</form:form>
		</div>
	</div>
</body>
</html>