<html>
<head>
<title>Register</title>
<script type="text/javascript">
function checkFrSamePassword()
{
	try{
	 var prevPass = document.forms["register"]["password"].value;
	 var confirmPass = document.forms["register"]["confirmpassword"].value;

	  if(prevPass == confirmPass)
		 {
		  return true;
		 }
	  else
		  {
		  	alert("Password don't match Pls try again");
		 	document.forms["register"]["password"].value = "";
		 	document.forms["register"]["confirmpassword"].value = "";
		 	return false;
		  
		  }

	}catch(err) {
	
		alert(err.message);
	}
}
 </script>
 </head>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginStylesheet.css" type="text/css">
<body>

<form id="register" action="registerUser" method="GET" onsubmit="return checkFrSamePassword()">
    <h1>Register</h1>

    <input id="inputsnormal" name="name" type="text" placeholder="Name/Owner" autofocus required><br>
    <input id="inputsnormal" name="company" type="text" placeholder="Company" required><br>
    <input id="inputsnormal" name="phonenumber" type="number" placeholder="PhoneNumber"><br>
  	<input id="inputsnormal" name="address1" type="text" placeholder="Address Line 1" required>
  	<input id="inputsnormal" name="address2" type="text" placeholder="Address Line 2">
  	<input id="inputsnormal" name="address3" type="text" placeholder="Address Line 3"><br>
    <input id="inputsnormal" name="email" type="email" placeholder="EmailId"><br>
    <input id="inputsnormal" name="username" type="text" placeholder="Username" required>   
    <br><input id="inputsnormal" name="password" type="password" placeholder="Password" required><br>
    <input id="inputsnormal" name="confirmpassword" type="password" placeholder="Confirm Password" required><br>

    <fieldset id="actions">
        <input type="submit" id="submit" value="Submit">
        <a href="${pageContext.request.contextPath}">Back</a>
    </fieldset>

</form>



</body></html>