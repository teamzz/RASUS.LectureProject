<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sudjelovanje u nastavi</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link href="<c:url value="/resources/css/foundation.css" />"
	type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="/resources/js/modernizr.js"></script>
<link href="<c:url value="/resources/css/lookCss.css" />"
	type="text/css" rel="stylesheet">



<script type="text/javascript">

function startQuiz(quizId)
{
	window.open("/ztel/ManageQuiz/" + quizId, '_blank','width=800 height=500');
}

function changeActiveQuiz(quizId) {
	var active  = document.getElementById("qActive" + quizId); 
	$.ajax({
	    url: "/ztel/Quizes/jax/changeactivequiz", 
	    type: 'POST', 
	    dataType: 'json', 
	    data: "{\"idQuiz\":\"" + quizId + "\", \"activated\":\""+ active.innerHTML +"\", \"code\":\"0\"}", 
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
	    		var y = document.getElementById("activateBtn" + data.idQuiz);
		    	y.disabled = 'disabled';
	    	}
	    	
    		
	    	var x=document.getElementById("Q" + data.idQuiz);
	    	x.innerHTML = state;
	    	var y = document.getElementById("activateBtn" + data.idQuiz);
	    	y.innerHTML = btnTxt;
	    	var z = document.getElementById("qActive" + data.idQuiz);
	    	z.innerHTML = data.activated;
	    
	    },
	    error:function(data,status,er) { 
	        alert("error: "+data+" status: "+status+" er:"+er);
	    }
	});
	};
	
//id pitanja se salje normalno pod idQuestion, id kviza pod textQuestion
function deleteQuestion(questionId, quizId) {
	$.ajax({
	    url: "/ztel/Questions/jax/deletequestion", 
	    type: 'POST', 
	    dataType: 'json', 
	    data: "{\"idQuestion\":\"" + questionId + "\", \"textQuestion\":\"" + quizId + "\"}", 
	    contentType: 'application/json',
	    mimeType: 'application/json',
	    success: function(data) { 
	    	
	    	document.getElementById("questionOfQuiz"+questionId).remove();
	    	
	    
	    },
	    error:function(data,status,er) { 

	        document.getElementById("questionOfQuiz"+questionId).remove();
	    }
	});
	};
	
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
	};
	
function newQuestion(){
	var sc="${selectedCategory.idCategory}";
	if (sc==""){
		alert("Please select category first!");
	}
	else{
		window.open('/ztel/NewQuestion?idCategory=${selectedCategory.idCategory}','newwindow','width=500 height=500');
	}
}
function newQuiz(){
	var sc="${selectedCategory.idCategory}";
	if (sc==""){
		alert("Please select category first!");
	}
	else{
		window.open('/ztel/AddQuiz/${selectedCategory.idCategory}','newwindow','width=500 height=500');
	}
}

function deleteQuiz(quizId) {
	$.ajax({
	    url: "/ztel/Quiz/jax/deletequiz", 
	    type: 'POST', 
	    dataType: 'json', 
	    data: "{\"idQuiz\":\"" + quizId + "\"}", 
	    contentType: 'application/json',
	    mimeType: 'application/json',
	    success: function(data) { 
	    	
	    	document.getElementById("questionsQuizId"+quizId).remove();
	    	document.getElementById("quizTable"+quizId).remove();
	    	document.getElementById("btnShowQuestions"+quizId).remove();
	    
	    },
	    error:function(data,status,er) { 

	    	document.getElementById("questionsQuizId"+quizId).remove();
	    	document.getElementById("quizTable"+quizId).remove();
	    	document.getElementById("btnShowQuestions"+quizId).remove();
	    }
	});
	};
	
	function showStatistics(quizCode)
	{
		alert(quizCode);
		window.open("/ztel/SolveQuiz/"+quizCode);
	}
	
	function reactivateQuiz(quizId)
	{
		window.open("/ztel/ReactivateQuiz/" + quizId, "_blank", "width=500 height=500");
	}
</script>
</head>

<body>
	<div class="row">
		<div class="large-10 columns">
			<h1>Sudjelovanje u nastavi #${selectedCategory.categoryName}</h1>
		</div>
		<div class="small-2 columns">
			<h5 id="logout">${userName}
				|<a href="<c:url value="/j_spring_security_logout" />"> Logout</a>
			</h5>
		</div>
		<hr>
		<br>
	</div>

	<div class="row">
		<div class="twelve columns">
			<div class="row" id="fouterContainer">
				<div class="larger-12 columns" id="buttonContainer">
					<form:form action="/ztel/Categories" method="GET">
						<c:forEach items="${categories}" var="category" varStatus="status">
							<button id="BButtons" name="idCategory"
								value="${category.idCategory }">${category.categoryName}</button>
						</c:forEach>
					</form:form>
					<hr>
				</div>
			</div>
			<div class="row" id="souterContainer">
				<div class="larger-12 columns" id="CContent">
					<div id="mainWindow">

						<div id="bouterContainer">
							<p>Mogućnosti:</p>
							<c:set var="pokazi" scope="session"
								value="${selectedCategory.categoryName}"></c:set>
							<c:if test="${not empty pokazi}">
								<input id="mogucnostBtn" type="button" class="alert button"
									onclick="newQuestion()" value="Dodaj pitanje" />
								<input id="mogucnostBtn" type="button" class="alert button"
									onclick="window.open('/ztel/Questions/overview?idCategory=${selectedCategory.idCategory}','newwindow','width=500 height=500'); return false;"
									value="Pregled pitanja" />
								<input id="mogucnostBtn" type="button" class="alert button"
									onclick="newQuiz()" value="Dodaj kviz" />
							</c:if>
							<input id="mogucnostBtn" type="button" class="alert button"
								onclick="window.open('/ztel/AddCategory','newwindow','width=500 height=500'); return false;"
								value="Dodaj kategoriju" /> <input id="mogucnostBtn"
								type="button" class="alert button"
								onclick="window.open('/ztel/Categories/overview','newwindow','width=500 height=500'); return false;"
								value="Pregled kategorija" /> <input id="mogucnostBtn"
								type="button" class="alert button"
								onclick="window.open('/ztel/AddUser','newwindow','width=500 height=500'); return false;"
								value="Dodaj korisnika" />
						</div>
						<br> <br> <br>

						<h4>Raspoloživi kvizevi:</h4>
						<br> <br>

						<c:forEach items="${quizesByUser }" var="quiz">
							<div class="panel" id="quizTable${quiz.idQuiz }">
								<b>Ime kviza:</b>
								<c:out value="${quiz.quizName}" />
								<br> <br> <b>Kod kviza:</b> ${quiz.code} <br> <br>
								<div id="quiz${quiz.idQuiz }">
									<c:set value="${quiz.activated }" var="active" />
								</div>
								<div id="bouterContainer">
									<button class="small button" id="activateBtn${quiz.idQuiz}"
										type="button" onclick="startQuiz(${quiz.idQuiz})"
										<c:if test="${quiz.activated }">disabled="disabled"</c:if>>
										Upravljaj</button>


									<button class="small button" type="button"
										onclick="startQuiz(${quiz.idQuiz})"
										<c:if test="${!quiz.activated }">disabled="disabled"</c:if>>
										Statistike</button>
									<button class="small button" type="button"
										onclick="reactivateQuiz(${quiz.idQuiz})">
										Reaktivacija</button>
									<button class="small button" type="button"
										onclick="deleteQuiz(${quiz.idQuiz})">Izbriši</button>

									<br>

									<button class="small button"
										id="btnShowQuestions${quiz.idQuiz }"
										onclick="showQuestions(${quiz.idQuiz})">+</button>

									<div id="questionsQuizId${quiz.idQuiz }"
										style="display: none;">
											<b>Pitanja u kvizu:</b>
											<br>
											<br>
											<div class="pitanjaUKvizu">
												<c:forEach items="${quiz.questions }" var="question">
													<div id="questionOfQuiz${question.idQuestion }">
														<c:out value="${question.textQuestion}" />
														<br>
														<br>
														<button class="small button" type="button"
																onclick="deleteQuestion(${question.idQuestion}, ${quiz.idQuiz })">Obriši</button>
													</div>
												</c:forEach>
											</div>

								</div>
							</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
		</div>
	</div>


	<hr>



</body>


</html>
