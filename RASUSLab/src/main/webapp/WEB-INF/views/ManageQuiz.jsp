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
function activateQuestion(questionId, quizId) {
	var active  = document.getElementById("qActive" + questionId);
	alert(active.value);
	$.ajax({
	    url: "/ztel/ManageQuiz/jax/changeactivequestion", 
	    type: 'POST', 
	    dataType: 'json', 
	    data: "{\"idQuestion\":\"" + questionId + "\", \"activated\":\""+ active.value +"\", \"idQuiz\":\""+ quizId +"\"}", 
	    contentType: 'application/json',
	    mimeType: 'application/json',
	    success: function(data) { 
	    	var state = "";
	    	var btnTxt = "";
	    	if (data.activated)
	    		{
	    		state = "Activated";
	    		btnTxt = "Deactivate";
	    		var code = document.getElementById("quizCode" + data.idQuiz);
	    		code.innerHTML = "" + data.code;
	    		}
	    	else{
	    		state = "Deactivated";
	    		btnTxt = "Activate";
	    		var y = document.getElementById("activateButton");
		    	y.disabled = 'disabled';
	    	}
	    	
    	
	    	var y = document.getElementById("activateButton");
	    	y.innerHTML = btnTxt;
	    	var z = document.getElementById("qActive" + data.idQuiz);
	    	z.innerHTML = data.activated;
	    
	    },
	    error:function(data,status,er) { 
	        alert("error: "+data+" status: "+status+" er:"+er);
	    }
	});
	}
</script>

<title>Upravljanje kvizom</title>
</head>
<body>
	<form:input path="idQuiz" value="${idQuiz}" style="visibility:collapse;"></form:input>

	<div style="background-color: #A0B0C0">
			<c:out value="${questionInQuiz.question.textQuestion}"/>
			
	</div>
	<br>

<div>
			<c:if test="${questionInQuiz.question.answers.size() != 1 }">
				<table>
				
					<c:forEach items="${questionInQuiz.question.answers }" var="answer">
						<tr>
						<td>
						${answer}
						</td>
						</tr>
					</c:forEach>
				
				</table>
			</c:if>
			<c:if test="${questionInQuiz.question.answers.size() == 1 }">
				<input />
			</c:if>
		<input id="qActive${questionInQuiz.question.idQuestion }" value="${questionInQuiz.activated }"/>
		</div>
		<br>
		<div style="background-color: #A0B0C0">
		<button id="activateButton" onclick="activateQuestion(${questionInQuiz.question.idQuestion}, ${idQuiz })">Activate</button>
		<button>Statistika</button>
		<button>Dalje</button>
		</div>
</body>
</html>