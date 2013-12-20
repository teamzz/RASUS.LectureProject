<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Statistika kviza</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Statistika</title>
<link href="<c:url value="/resources/css/foundation.css" />"
	type="text/css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="/resources/js/modernizr.js"></script>
<link href="<c:url value="/resources/css/lookCss.css" />"
	type="text/css" rel="stylesheet">
</head>
<body>
<div class="row">
	<div class="twelve columns">
		<c:forEach items="${quiz.questions}" var="question">
			<img src="/ztel/getStatistic/${question.idQuestion}/${quiz.idQuiz}"/>
		</c:forEach>
	</div>
</div>



</body>
</html>