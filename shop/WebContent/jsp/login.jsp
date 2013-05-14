<html>
<head>
<title>Login</title>
</head>
 <link rel="stylesheet" href="./css/loginStylesheet.css" type="text/css">
<body>

<form id="login" action="validate" method="GET">
    <h1>Log In</h1>
    <fieldset id="inputs">
        <input id="username" name="username" type="text" placeholder="Username" autofocus required>   
        <input id="password" name="password" type="password" placeholder="Password" required>
    </fieldset>
    <fieldset id="actions">
        <input type="submit" id="submit" value="Log in">
        <a href="./jsp/forget-password.jsp">Forgot your password?</a><a href="./jsp/register.jsp">Register</a>
    </fieldset>
</form>

</body>
</html>
