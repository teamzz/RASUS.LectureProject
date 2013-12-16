<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Sudjelovanje u nastavi</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/css/lookCss.css" />"
	type="text/css" rel="stylesheet">
</head>

<body>
	<div id="outerDIV">
		<div id="headerDIV">
			<h2>Sudjelovanje u nastavi</h2>
		</div>

		<div id="coreDIV">
			<div id="innerUpperDIV"></div>

			<div id="innerDownerDIV">
				<h3>Unesite korisničke podatke</h3>

				<c:if test="${not empty error}">
					<div class="errorblock">
						Your login attempt was not successful, try again.<br /> Caused :
						${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
					</div>
				</c:if>

				<form id="loginForm" name='f' action="<c:url value='j_spring_security_check' />"
					method='POST'>

					<table>
						<tr>
							<td>User:</td>
							<td><input type='text' name='j_username' value=''></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input type='password' name='j_password' /></td>
						</tr>
						<tr>
							<td colspan='2'><input name="submit" type="submit"
								value="Salji" /></td>
						</tr>
						<tr>
							<td colspan='2'><input name="reset" type="reset"
								value="Resetiraj" /></td>
						</tr>
					</table>

				</form>
			</div>
		</div>

		<div id="footerDIV">@ TeamZ</div>
	</div>
</body>

</html>