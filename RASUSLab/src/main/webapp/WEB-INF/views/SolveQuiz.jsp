<%@page
	import="org.hibernate.hql.internal.ast.util.ASTUtil.IncludePredicate"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	// Create cookies for first and last names. 
  	Object id_question = request.getAttribute("id_question");
	
   // Set expiry date after 24 Hrs for both the cookies.
     

   // Add both the cookies in the response header.
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script type="text/javascript">

function refresh()
{
	location.reload();
}


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
	
	days=30; // number of days to keep the cookie
	   myDate = new Date();
	   myDate.setTime(myDate.getTime()+(days*24*60*60*1000));
    document.cookie = 'id_question=' + questionId + '; expires=' + myDate.toString + ';';
   
	}
	
	function disableSave()
	{
		alert("blabla");
		document.getElementById("save").disabled = "disabled";
	}
</script>

<title>Rješavanje kviza</title>
</head>
<body>

	<%
	if (request.getCookies() != null)
	{
		Long id_quest = (Long) request.getAttribute("idQuestionCook");
		if(id_quest == Long.parseLong(request.getCookies()[0].getValue()))
		{
			out.print("Već ste rješavali ovo pitanje!");
			out.print("<script>disableSave();<script>");
			
		}
	}
	%>

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
					<input id="userAnswer" />
				</c:if>
			</div>

			<input id="send" type="button" class="small button"
				onclick="submitAnswer(${questionInQuiz.question.idQuestion },${idQuiz})"
				value="Save" id="save"/> <input id="refresh" type="button"
				class="small button" onclick="refresh()" value="Refresh" />

		</div>
	</div>
	<script src="/resources/js/jquery.js"></script>
	<script src="/resources/js/foundation.min.js"></script>
	<script>
		$(document).foundation();
	</script>
</body>
</html>