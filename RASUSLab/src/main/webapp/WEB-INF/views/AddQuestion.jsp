<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Add new question</title>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script type="text/javascript">
	function addFields() {
		var numberOfIncorrect = $
		{
			question.numberOfIncorrectAnswers
		}
		;
		var numberOfCorrect = $
		{
			question.numberOfCorrectAnswers
		}
		numberOfCorrect = 1;
		;
		var form = document.getElementById("questionForm");
		var correctAnswers = "";
		var incorrectAnswers = "";
		var newInner = "";
		var category = "";
		if (numberOfCorrect == "")
			alert("Please insert number of Correct Answers!");
		else if (numberOfIncorrect == "")
			alert("Please insert number of Wrong Answers!");
		else {
			newInner = '<table id="formTable"><tr><td><label name="question.textQuestion">Question:</label></td><td><input name = "question.textQuestion"/></td></tr>';
			for (i = 0; i < numberOfCorrect; i++)
				correctAnswers = correctAnswers
						+ '<tr><td><label name="correctAnswers['+i+'].textAnswer"">Correct Answer</label></td><td><input name="correctAnswers['+i+'].textAnswer"/></td></tr>';
			for (i = 0; i < numberOfIncorrect; i++)
				correctAnswers = correctAnswers
						+ '<tr><td><label name="incorrectAnswers['+i+'].textAnswer"">Incorrect Answer</label></td><td><input name="incorrectAnswers['+i+'].textAnswer"/></td></tr>';

			newInner = newInner
					+ correctAnswers
					+ incorrectAnswers
					+ category
					+ '<tr><td colspan="2"><input type="submit" value="Next"/></td></tr></table>';

			form.innerHTML = newInner;

		}
	}
</script>

</head>
<body>
	<h1>Hello world!</h1>

	<P>The number of IncorrectAnswer is
		${question.numberOfIncorrectAnswers}. The number of CorrectAnswer is
		${question.numberOfCorrectAnswers}.</P>

	
			CategoryID: ${chosenCategory}
	---------------------------------
	<form:form method="POST" action="/ztel/questionAdded" id="questionForm"
		modelAttribute="questionHolder">
		<table id="formTable">
			<input type="hidden" name="question.category.idCategory" value="${chosenCategory}"></input>
			<tr>
				<td><label name="question.textQuestion">Question: </label></td>
				<td><input name="question.textQuestion" /></td>
			</tr>
			
			<c:forEach var="i" begin="0"
				end="0">
				<tr>
					<td><label name="correctAnswers[${i}].textAnswer">Correct
							Answer</label></td>
					<td><input name="correctAnswers[${i}].textAnswer" /></td>
				</tr>
			</c:forEach>
			<c:if test="${question.numberOfIncorrectAnswers>0}">
				<c:forEach var="j" begin="0"
					end="${question.numberOfIncorrectAnswers-1}">
					<tr>
						<td><label name="incorrectAnswers[${j}].textAnswer">Incorrect
								Answer</label></td>
						<td><input name="incorrectAnswers[${j}].textAnswer" /></td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td colspan="2"><input type="submit" value="Next" /></td>
			</tr>



		</table>
	</form:form>

	<script></script>
</body>
</html>
