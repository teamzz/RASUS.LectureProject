<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/JavaScript">
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
	
	function closeWindow()
	{
		alert("Kviz je dodan.");
		window.close();
	}
</script>

<title>Dodaj kviz</title>
</head>
<body>
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
			<form:input path="idProfessor" value="${idProfessor }" style="visibility: collapse;"></form:input>
			</div>
			<div>
				<form:input path="idCategory" value="${idCategory}" style="visibility: collapse;"></form:input>
			</div>
			<div>
			Odaberite pitanja za ovaj kviz
			<br>
			</div>
			<div>
			<c:if test="${questions.size() == 0 }"><b>Nemate napravljenih pitanja u ovoj kategoriji</b></c:if>
			<c:if test="${questions.size() > 0 }">
				<form:select path="questionsIdList" multiple="multiple"
						onclick="selectMultiple(this);" size="10">
						<c:forEach items="${ questions }" var="question">
							<option value="${question.idQuestion }">
								${question.textQuestion}</option>
						</c:forEach>

					</form:select>
					</c:if>
			
			</div>
			<div>
				<input type="submit" onclick="closeWindow()" value="Save" />
			</div>
	</form:form>

</body>
</html>