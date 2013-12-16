<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta  >
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
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
Categories:
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
<hr>
<div id="mainWindow" style="border:1px solid black;">


</div>
</body>


</html>