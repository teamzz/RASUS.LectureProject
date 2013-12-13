<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta  >
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script type="text/javascript">
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
<script>
function sendCategoryToServer(categoryId,categoryName){
	$.ajax({ 
	    url: "/ztel/Categories/jax/getCategory", 
	    type: 'POST', 
	    dataType: 'json', 
	    data: "{\"categoryName\":\""+ categoryName+"\",\"idCategory\":"+categoryId+"}", 
	    contentType: 'application/json',
	    mimeType: 'application/json',
	    success: function(data) { //add quizes to quizesDiv
	    	var quizRows ="";
	    	var newHTML = "Current category:" +categoryName+"</br><table id='quizesTable'><tr><th>ID</th><th>Quiz Name</th><th>Status</th></tr>";
	    	
	    	for (index = 0; index < data.length; index++){ 
	    		var quizRow = "<tr><td>"+ data[index].idQuiz +"</td><td>"+data[index].quizName+"</td><td>"+data[index].activated+"</td></tr>"
	    		quizRows = quizRows+quizRow;
	    	}
	    	newHTML = newHTML + quizRows +"</table>";
	        document.getElementById("mainWindow").innerHTML=newHTML;
	    },
	    error:function(data,status,er) { 
	        alert("error: "+data+" status: "+status+" er:"+er);
	        alert("{\"categoryName\":"+ categoryName+"\",\"idCategory\":"+categoryId+"}");

	  }
	});

}



</script>
</head>
<body>
<!-- onclick="sendCategoryToServer(${category.idCategory},'${category.categoryName}')"  -->

<div id="categoryMenu">
Selected CategoryId = ${selectedCategory}
<form:form action="/ztel/Category" method="POST" >
<c:forEach items="${categories}" var="category" varStatus="status" >
<button name="selectedCategory" value="${category.idCategory }">${category.categoryName}</input></br>
</c:forEach>
</form:form>
</div>
<div id="controlMenu">
Controls:
<input type="button" onclick="window.open('/ztel/NewQuestion','newwindow','width=700 height=500'); return false;" value="Add new question" />
<input type="button" onclick="window.open('/ztel/AddQuiz','newwindow','width=500 height=500'); return false;" value="Add new quiz" />
</div>

<hr>
Quizzes : 
</br>

<hr>

<div id="mainWindow" style="border:2px solid black;">

<h1>Quizes ovo su kvizevi</h1>
	

			<c:forEach items="${quizesByUser }" var="quiz">
			<table>
		<tr bgcolor="#FFBBBB">
			<td>ID</td>
			<td>Ime</td>
			<td>Kategorija</td>
			<td>Akcija</td>
			<td>Stanje</td>
			<td>KOD</td>
		<tr>
				<tr bgcolor="#BB7878" id="quiz${quiz.idQuiz }">
					<td><c:out value="${quiz.idQuiz}" /></td>
					<td><c:out value="${quiz.quizName}" /></td>
					<td><c:out value="${quiz.category.categoryName}" /></td>
					<c:set value="${quiz.activated }" var="active" />
					<td><button id="activateBtn${quiz.idQuiz}" type="button"
							onclick="changeActiveQuiz(${quiz.idQuiz})" <c:if test="${quiz.activated == true }">disabled="disabled"</c:if>>
							
							<c:out value="${active eq false ? 'Activate': 'No Action'}" />
						</button>
					<td><div id="Q${quiz.idQuiz }">
							<c:out value="${active eq false ? 'Not active yet': 'Already activated'}" />
						</div><div id="qActive${quiz.idQuiz }" style="visibility: collapse;"><c:out value="${quiz.activated}" /></div>
						</td>
						<td>
						
						<c:if test="${quiz.activated == true }"><div>${quiz.code }</div></c:if>
						<div id="quizCode${quiz.idQuiz }" ></div>
						</td>
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
			
</div>



</body>


</html>