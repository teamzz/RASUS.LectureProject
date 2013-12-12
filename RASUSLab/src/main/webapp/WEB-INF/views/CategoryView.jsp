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
<script>

function sendCategoryToServer(categoryId,categoryName){
	$.ajax({ 
	    url: "/ztel/Categories/jax/getCategory", 
	    type: 'POST', 
	    dataType: 'json', 
	    data: "{\"categoryName\": \"noname\",\"idCategory\":"+categoryId+"}", 
	    contentType: 'application/json',
	    mimeType: 'application/json',
	    success: function(data) { //add quizes to quizesDiv
	    	var newHTML = "<tr><th>ID</th><th>Quiz Name</th><th>Status</th></tr>";
	    	for (index = 0; index < data.length; index++){ 
	    		var quizRow = "<tr><td>"+ data[index].idQuiz +"</td><td>"+data[index].quizName+"</td><td>"+data[index].activated+"</td></tr>"
	    		newHTML = newHTML + quizRow;
	    	}
	    	
	        document.getElementById("quizesTable").innerHTML=newHTML;
	    },
	    error:function(data,status,er) { 
	        alert("error: "+data+" status: "+status+" er:"+er);
	        alert("{\"categoryName\": noname,\"idCategory\":"+categoryId+"}");

	    }
	});

}



</script>
</head>
<body>
<c:forEach items="${categories}" var="category" varStatus="status" >
<button onclick="sendCategoryToServer(${category.idCategory})" >${category.categoryName}</button>
</c:forEach>
<hr>
Quizzes : 
<hr>
<table id="quizesTable">



</table>

</body>


</html>