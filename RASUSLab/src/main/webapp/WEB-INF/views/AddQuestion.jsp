<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>

<head>
<title>Sudjelovanje u nastavi</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/foundation.css" />"
	type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="/resources/js/modernizr.js"></script>
<link href="<c:url value="/resources/css/lookCss.css" />"
	type="text/css" rel="stylesheet">
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
	<div class="row">
		<div class="twelve columns">
			<h2>Sudjelovanje u nastavi #${category.categoryName}</h2>
			<hr>
		</div>
	</div>
	<br>
	<br>

	<div class="row">
		<div class="twelve columns">
			<p>Please enter number of answers to your new question.</p>
			<br> <br>
			<div class="row" id="bouterContainer">
				<div class="twelve columns"></div>
				<form:form method="POST" action="/ztel/questionAdded"
					id="questionForm" modelAttribute="questionHolder">
					<form:input path="" type="hidden" name="question.category.idCategory" value="${category.idCategory}"></form:input>
					<tr>
						<td><form:label path="">Question: </form:label></td>
						<td><form:input path="" name="question.textQuestion" /></td>
						</tr>

						<c:forEach var="i" begin="0" end="0">
							<tr>
								<td><form:label path="" name="correctAnswers[${i}].textAnswer">Correct
										Answer</form:label></td>
								<td><form:input path="" name="correctAnswers[${i}].textAnswer" /></td>
							</tr>
						</c:forEach>
						<c:if test="${question.numberOfIncorrectAnswers>0}">
							<c:forEach var="j" begin="0"
								end="${question.numberOfIncorrectAnswers-1}">
								<tr>
									<td><form:label path="" name="incorrectAnswers[${j}].textAnswer">Incorrect
											Answer</form:label></td>
									<td><form:input path="" name="incorrectAnswers[${j}].textAnswer" /></td>
								</tr>
							</c:forEach>
						</c:if>
						<br>
						<tr>
							<td colspan="2"><form:input path="" class="button" type="submit" value="Next" /></td>
						</tr>
				</form:form>
			</div>
		</div>
	</div>

</body>
</html>
