<html>
<head>
<title>Login</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/loginStylesheet.css"
	type="text/css">
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/javascript/jQuery1.9.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/commonfuctions.js"></script>
<body>
	<form id="login" action="validate" method="POST">
		<h1>Log In</h1>
		<fieldset id="inputs">
			<input id="username" name="username" type="text" onkeyup="upperCaseThetext('username')"
				placeholder="Username" autofocus required> <input
				id="password" name="password" type="password" placeholder="Password"
				required>
			<% String check = (String) request.getAttribute("Error"); 
		if(check != null)
		{ %>
			<h2 style="color: red; font-size: 12px;"><%=check %></h2>
			<% }%>
		</fieldset>
		<fieldset id="actions">
			<input type="submit" id="submit" value="Log in"> <a
				href="${pageContext.request.contextPath}/jsp/forget-password.jsp">Forgot
				your password?</a><a
				href="${pageContext.request.contextPath}/jsp/register.jsp">Register</a>
		</fieldset>
	</form>
</body>
</html>
