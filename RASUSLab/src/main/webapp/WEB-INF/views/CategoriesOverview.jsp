<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="<c:url value="/resources/css/lookCss.css" />"
	type="text/css" rel="stylesheet">


<script>
function deleteCategory(categoryId){
	window.open("/ztel/Categories/overview/delete?id="+categoryId,'_self',false);
}
</script>

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

	<div class="row">
		<div class="twelve columns">
			<p>Popis svih kategorija:</p>
			<br> <br>
			<div class="row">
				<div class="twelve columns">
					<div class="row" id="bouterContainer">
						<c:forEach 
							items="${categories}" var="category" varStatus="status">
							<div class="large-10 columns">
							${category.categoryName}
							</div>
							<div class="small-2 columns">
							<input class="small button" type="button"
								onclick="deleteCategory(${category.idCategory})" value="Obriši" />
							</div>
							<hr>
						</c:forEach>
					</div>
					</div>
			</div>
		</div>
	</div>

</body>
</html>