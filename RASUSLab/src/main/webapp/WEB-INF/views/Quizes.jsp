<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
function changeActiveQuiz(quizId) {
	var active  = document.getElementById("qActive" + quizId); 
	$.ajax({
	    url: "/RASUSLab/Quizes/jax/changeactivequiz", 
	    type: 'POST', 
	    dataType: 'json', 
	    data: "{\"idQuiz\":\"" + quizId + "\", \"activated\":\""+ active.innerHTML +"\"}", 
	    contentType: 'application/json',
	    mimeType: 'application/json',
	    success: function(data) { 
	    	var state = "";
	    	var btnTxt = "";
	    	if (data.activated)
	    		{
	    		state = "Activated";
	    		btnTxt = "Deactivate";
	    		}
	    	else{
	    		state = "Deactivated";
	    		btnTxt = "Activate";
	    	}
	 
	    	var x=document.getElementById("Q" + data.idQuiz);
	    	x.innerHTML = state;
	    	var y = document.getElementById("activateBtn" + data.idQuiz);
	    	y.innerHTML = btnTxt;
	    	var z = document.getElementById("qActive" + data.idQuiz);
	    	z.innerHTML = !data.activated;
	    
	    },
	    error:function(data,status,er) { 
	        alert("error: "+data+" status: "+status+" er:"+er);
	    }
	});
	}
	
function showQuestions(quizId) {
	var active  = document.getElementById("questionsQuizId" + quizId); 
	var display = active.style.display;
	if (display == "table")
		{
		active.style.display = 'none';
		}
	else
		{
		active.style.display = 'table';
		}
	}
	
</script>


<title>Insert title here</title>
</head>
<body>
	<h1>Quizes</h1>
	

			<c:forEach items="${quizes }" var="quiz">
			<table>
		<tr bgcolor="#FFBBBB">
			<td>ID</td>
			<td>Ime</td>
			<td>Kategorija</td>
			<td></td>
		<tr>
				<tr bgcolor="#BB7878" id="quiz${quiz.idQuiz }">
					<td><c:out value="${quiz.idQuiz}" /></td>
					<td><c:out value="${quiz.quizName}" /></td>
					<td><c:out value="${quiz.category.categoryName}" /></td>
					<c:set value="${quiz.activated }" var="active" />
					<td><button id="activateBtn${quiz.idQuiz}" type="button"
							onclick="changeActiveQuiz(${quiz.idQuiz})">
							<c:out value="${active eq false ? 'Activate': 'Deactivate'}" />
						</button>
					<td><div id="Q${quiz.idQuiz }">
							<c:out value="${active eq false ? 'Deactivated': 'Activated'}" />
						</div><div id="qActive${quiz.idQuiz }" style="visibility: collapse;"><c:out value="${!quiz.activated}" /></div></td>
				</tr>
				</table>
				
				<button onclick="showQuestions(${quiz.idQuiz})">+</button>
				
				<table id="questionsQuizId${quiz.idQuiz }" style="display: none;">
				<tr bgcolor="#7070BB">
					<td>Id pitanja</td>
					<td>pitanje</td>
					<td>kategorija</td>
				</tr>
				<tr>
				<c:forEach items="${quiz.questions }" var="question">
						<tr bgcolor="#BBBBFF">
							<td><c:out value="${question.idQuestion}" /></td>
							<td><c:out value="${question.textQuestion}" /></td>
							<td><c:out value="${question.category.categoryName}" /></td>
						</tr>
					</c:forEach>
				<tr height="20dp"></tr>
				</table>
			</c:forEach>
	
</body>
</html>
