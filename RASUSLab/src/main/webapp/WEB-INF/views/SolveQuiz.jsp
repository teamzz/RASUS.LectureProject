<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script type="text/javascript">

function submitAnswer(questionId, quizId) {
	var answer = document.getElementById("userAnswer");
	alert(questionId + " " + quizId + " " + answer.value);
	$.ajax({
	    url: "/ztel/SolveQuiz/jax/submitanswer", 
	    type: 'POST', 
	    dataType: 'json', 
	    data: "{\"idQuestion\":\"" + questionId + "\", \"answer\":\""+ answer.value +"\", \"idQuiz\":\""+ quizId +"\"}", 
	    contentType: 'application/json',
	    mimeType: 'application/json',
	    success: function(data) { 
	    	var state = "";
	    	var btnTxt = "";
	    	if (data.activated)
	    		{
	    		state = "Activated";
	    		btnTxt = "Deactivate";
	    		var code = document.getElementById("send");
	    		code.innerHTML = btnTxt;
	    		}
	    	else{
	    		state = "Deactivated";
	    		btnTxt = "No action";
	    		var y = document.getElementById("send");
		    	y.disabled = 'disabled';
	    	}	
	    
	    },
	    error:function(data,status,er) { 
	        alert("error: "+data+" status: "+status+" er:"+er);
	    }
	});
	}
</script>

<title>Rješavanje kviza</title>
</head>
<body>
	<div class="row">
		<div class="panel">

			<form:input path="idQuiz" style="visibility:collapse;" />

			<div>
				<label>${questionInQuiz.question.textQuestion}</label> <input
					value="${questionInQuiz.question.idQuestion}"
					style="display: none;" />
				<c:if test="${questionInQuiz.question.answers.size() != 1 }">
					<select id="userAnswer">
						<c:forEach items="${questionInQuiz.question.answers }"
							var="answer">

							<option>${answer}</option>

						</c:forEach>
					</select>
				</c:if>
				<c:if test="${questionInQuiz.question.answers.size() == 1 }">
					<form:input path="userAnswer" />
				</c:if>
			</div>

			<input id="send" type="button" class="small button"
				onclick="submitAnswer(${questionInQuiz.question.idQuestion },${idQuiz})"
				value="Save" />

		</div>
	</div>
	<script src="/resources/js/jquery.js"></script>
	<script src="/resources/js/foundation.min.js"></script>
	<script>
		$(document).foundation();
	</script>
</body>
</html>