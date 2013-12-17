<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Add new user</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<!-- dodati provjeru da li username vec postoji -->
	
<form:form method="POST" action="/ztel/categoryAdded" id="categoryForm"
		modelAttribute="newCategory">
		<table id="formTable">
			<tr>
				<td><label>First name: </label></td>
				<td><input name="categoryName" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit" /></td>
				<td><input type="reset" value="Reset" /></td>
			</tr>


		</table>
</form:form>

</body>
</html>