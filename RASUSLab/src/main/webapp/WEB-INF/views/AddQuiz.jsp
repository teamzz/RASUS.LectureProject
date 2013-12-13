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
</script>

<title>Add new quiz</title>
</head>
<body>
	<form:form method="POST" modelAttribute="quizholder"
		action="/ztel/AddQuiz/formsubmit">
		<table>

			<tr>
				<td><form:label path="quiz.quizName">Name</form:label></td>
				<td><form:input path="quiz.quizName" /></td>
			</tr>

			<tr>
				<td><label>Kategorija</label></td>
				
				<td><form:input path="idCategory" value="${idCategory}"></form:input></td>
			
			</tr>

			<tr>
				<td><form:label path="idProfessor">Proff id</form:label></td>
				<td><form:input path="idProfessor" value="26" /></td>
			</tr>
			<tr>
				<td>Pitanja</td>
				<td><form:select path="questionsIdList" multiple="multiple"
						onclick="selectMultiple(this);" size="10">
						<c:forEach items="${ questions }" var="question">
							<option value="${question.idQuestion }">
								${question.textQuestion}</option>
						</c:forEach>

					</form:select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Save" /></td>
			</tr>
		</table>
	</form:form>

</body>
</html>