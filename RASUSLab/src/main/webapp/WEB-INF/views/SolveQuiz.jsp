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
<link href="<c:url value="/resources/css/foundation.css" />"
	type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="<c:url value="/resources/css/lookCss.css" />"
	type="text/css" rel="stylesheet">

<script type="text/javascript">

function refresh()
{
	location.reload();
}


function submitAnswer(questionId, quizId) {
	var answer = document.getElementById("userAnswer").value.replace(/["]/g, "\\\"");
	$.ajax({
	    url: "/ztel/SolveQuiz/jax/submitanswer", 
	    type: 'POST', 
	    dataType: 'json', 
	    data: "{\"idQuestion\":\"" + questionId + "\", \"answer\":\""+ answer +"\", \"idQuiz\":\""+ quizId +"\"}", 
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
		document.getElementById("save").disabled = "disabled";
	}
</script>

<title>Rješavanje kviza</title>
</head>


<body>

	<div class="row">
		<div class="twelve columns">
			<h1>Sudjelovanje u nastavi</h1>
			<hr>
		</div>
	</div>
	<br>
	<br>

	
	<c:choose>
	<c:when test="${empty questionInQuiz}">
		<div class="row">
			<div class="twelve columns">
				Trenutno nema aktivnog pitanja.
				<button class="small button" id="refresh" onclick="refresh()">Osvježi</button>
			</div>
		</div>
	</c:when>
	<c:otherwise>
	
	<div class="row" id="souterContainer">
	<%
		if (request.getCookies() != null)
			{
			Long id_quest = (Long) request.getAttribute("idQuestionCook");
			Cookie[] cookies = request.getCookies();
			for (Cookie c : cookies)
			{
		if (c.getName().equals("id_question"))
		{
			
		
			 	if(id_quest == Long.parseLong(c.getValue()))
		{
			out.print("Već ste rješavali ovo pitanje!");
			out.print("<script>disableSave();<script>");
		
		}
		}
			}
		}
	%>
	</div>
	
	<div class="row">
		<div class="panel">

			<%
				if (request.getCookies() != null)
				{
				Long id_quest = (Long) request.getAttribute("idQuestionCook");
				Cookie[] cookies = request.getCookies();
				for (Cookie c : cookies)
				{
					if (c.getName().equals("id_question"))
					{
				
					
				 	if(id_quest == Long.parseLong(c.getValue()))
					{
				out.print("Već ste rješavali ovo pitanje!");
				out.print("<script>disableSave();<script>");
					
					}
					}
				}
					}
			%>

			<c:if test="${questionInQuiz == null }">Trenutno nema aktivnog pitanja.</c:if>

			<form:input path="idQuiz" style="visibility:collapse;" />

			<div>
				<label><c:out value="${questionInQuiz.question.textQuestion}" escapeXml="true"></c:out></label> <input
					value="${questionInQuiz.question.idQuestion}"
					style="display: none;" /> <br>
				<c:if test="${questionInQuiz.question.answers.size() != 1 }">
					<select id="userAnswer">
						<c:forEach items="${questionInQuiz.question.answers }"
							var="answer">

							<option><c:out value="${answer}" escapeXml="true"></c:out></option>

						</c:forEach>
					</select>
				</c:if>
				<c:if test="${questionInQuiz.question.answers.size() == 1 }">
					<input id="userAnswer" />
				</c:if>
			</div>
		</div>
		<div id="bouterContainer">
		<br> <input id="send" type="button" class="small button"
				onclick="submitAnswer(${questionInQuiz.question.idQuestion },${idQuiz})"
				value="Spremi" id="save" /> <input id="refresh" type="button"
				class="small button" onclick="refresh()" value="Osvježi" />
		</div>
	</div>
	</c:otherwise>
	</c:choose>
	<script src="/resources/js/jquery.js"></script>
	<script src="/resources/js/foundation.min.js"></script>
	<script>
		$(document).foundation();
	</script>
</body>
</html>
