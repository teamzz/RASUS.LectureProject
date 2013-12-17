<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/foundation.css" />"
	type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="/resources/js/modernizr.js"></script>
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script>
	function sendCategoryToServer(categoryId, categoryName) {
		$
				.ajax({
					url : "/ztel/Categories/jax/getCategory",
					type : 'POST',
					dataType : 'json',
					data : "{\"categoryName\":\"" + categoryName
							+ "\",\"idCategory\":" + categoryId + "}",
					contentType : 'application/json',
					mimeType : 'application/json',
					success : function(data) { //add quizes to quizesDiv
						var quizRows = "";
						var newHTML = "Current category:"
								+ categoryName
								+ "</br><table id='quizesTable'><tr><th>ID</th><th>Quiz Name</th><th>Status</th></tr>";

						for (index = 0; index < data.length; index++) {
							var quizRow = "<tr><td>" + data[index].idQuiz
									+ "</td><td>" + data[index].quizName
									+ "</td><td>" + data[index].activated
									+ "</td></tr>"
							quizRows = quizRows + quizRow;
						}
						newHTML = newHTML + quizRows + "</table>";
						document.getElementById("mainWindow").innerHTML = newHTML;
					},
					error : function(data, status, er) {
						alert("error: " + data + " status: " + status + " er:"
								+ er);
						alert("{\"categoryName\":" + categoryName
								+ "\",\"idCategory\":" + categoryId + "}");

					}
				});
	}
</script>
</head>

<body>

	<div class="row">
		<div class="twelve columns">
			<h2>Sudjelovanje u nastavi</h2>
			<hr>
		</div>

	</div>

	<div class="row">
		<div class="twelve columns">
			<div class="row" id="fouterContainer">
				<div class="larger-12 columns" id="buttonContainer">
					<form:form action="/ztel/Category" method="POST">
						<c:forEach items="${categories}" var="category" varStatus="status">
							<button id="BButtons" name="selectedCategory"
								value="${category.idCategory }">${category.categoryName}</button>
						</c:forEach>
					</form:form>
				</div>
			</div>
			<div class="row" id="souterContainer">
				<div class="larger-12 columns" id="CContent">JEbebebe nsafsfsa
					fsakfposkafokafo pskacpodkspao kdoskakvd aoskvd poakvso dkvaodkv
					saokdposakvdo pakvdosakv o pdksavpod ksovakds dskapvkdsop
					akvdpokvodav dkspaovkdsop vkadpokvapod dksapovkdpos akvpodkavpod
					dopskapc okdspaovk</div>
			</div>
		</div>
	</div>

	<div class="row" id="souterContainer">
		<div class="larger-12 columns" id="CContent">
			<div id="mainWindow">
				<div id="controlMenu">
					<p>Mogućnosti:</p>
					<input type="button" class="alert button"
						onclick="window.open('/ztel/NewQuestion?idCategory=${selectedCategory}','newwindow','width=500 height=500'); return false;"
						value="Add new question" /> <input type="button"
						class="alert button"
						onclick="window.open('/ztel/AddQuiz/${selectedCategory}','newwindow','width=400 height=400'); return false;"
						value="Add new quiz" /> <input type="button" class="alert button"
						onclick="window.open('/ztel/AddCategory','newwindow','width=300 height=100'); return false;"
						value="Add new category" /> <input type="button"
						class="alert button"
						onclick="window.open('/ztel/AddUser','newwindow','width=300 height=300'); return false;"
						value="Add new user" />
				</div>
				<br> <br> <br>
			</div>
		</div>
	</div>

	<script src="/resources/js/jquery.js"></script>
	<script src="/resources/js/foundation.min.js"></script>
	<script>
		$(document).foundation();
	</script>

</body>


</html>