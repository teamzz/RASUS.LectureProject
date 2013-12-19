<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<script src="/resources/js/modernizr.js"></script>
<link href="<c:url value="/resources/css/lookCss.css" />"
	type="text/css" rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script type="text/javascript">
function nextQuestion()
{
	location.reload();
}

function activateQuestion(questionId, quizId) {
	var active  = document.getElementById("qActive" + questionId);
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
	    		state = "Aktivirano";
	    		btnTxt = "Deaktivirano";
	    		var code = document.getElementById("activateButton");
	    		code.innerHTML = btnTxt;
	    		}
	    	else{
	    		state = "Deactivated";
	    		btnTxt = "No action";
	    		var y = document.getElementById("activateButton");
		    	y.disabled = 'disabled';
		    	var statBut = document.getElementById("statisticButton");
		    	statBut.disabled = false;
		    	var nextBut = document.getElementById("nextButton");
		    	nextBut.disabled = false;
	    	}
	    	
    	
	    	
	    
	    },
	    error:function(data,status,er) { 
	        alert("error: "+data+" status: "+status+" er:"+er);
	    }
	});
	}
	
	function showStat(questionId, quizId)
	{
		window.open("/ztel/Question/stats/"+quizId + "/" +  questionId , "_blank", 'width=800 height=500');
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
			<p>Upravljanje kvizom:</p>
			<br> <br>
			<div class="row" id="bouterContainer">
				<div class="twelve columns"></div>
				<h4>Kod kviza: ${quizCode }</h4>

				<form:input path="idQuiz" value="${idQuiz}"
					style="visibility:collapse;"></form:input>

				<div>
					<b><c:out value="${questionInQuiz.question.textQuestion}" /></b>
				</div>
				<br>

				<div class="panel" style="text-align: center">
					<div style="text-align: left">
					<c:if test="${questionInQuiz.question.answers.size() != 1 }">
							<c:forEach items="${questionInQuiz.question.answers }"
								var="answer">
								<li>
									${answer}
								</li>
							</c:forEach>
					</c:if>
					</div>
					<c:if test="${questionInQuiz.question.answers.size() == 1 }">
						<input value="Nadopunite!" disabled="disabled" />
					</c:if>
					<input id="qActive${questionInQuiz.question.idQuestion }"
						value="${questionInQuiz.activated }" style="visibility: collapse;" />
				</div>
				<br>
				<br>
				<br>
				<div>
					<button class="small button" id="activateButton"
						onclick="activateQuestion(${questionInQuiz.question.idQuestion}, ${idQuiz })">
						<c:out
							value="${questionInQuiz.activated eq false ? 'Aktiviraj': 'Deaktiviraj'}" />
					</button>
					<button class="small button" onclick="showStat(${questionInQuiz.question.idQuestion}, ${idQuiz})">Statistika</button>
					<button class="small button" onclick="nextQuestion()">Dalje</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
