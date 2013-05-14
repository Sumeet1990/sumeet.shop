<html>
<head>
<title>Register</title>
<script type="text/javascript">
function checkFrSamePassword()
{
	alert("Entered");
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
 <link rel="stylesheet" href="../css/loginStylesheet.css" type="text/css">
<body>

<form id="register" action="registerUser" method="GET" onsubmit="return checkFrSamePassword()">
    <h1>Register</h1>

    <input id="inputs" name="name" type="text" placeholder="Name/Owner" autofocus required><br><br>
    <input id="inputs" name="company" type="text" placeholder="Company" required><br><br>
    <input id="inputs" name="phonenumber" type="text" placeholder="PhoneNumber"><br><br>
    <input id="inputs" name="email" type="text" placeholder="EmailId"><br>
    <br><input id="inputs" name="username" type="text" placeholder="Username" required><br>   
    <br><input id="inputs" name="password" type="password" placeholder="Password" required><br><br>
    <input id="inputs" name="confirmpassword" type="password" placeholder="Confirm Password" required><br><br><br><br>

    <fieldset id="actions">
        <input type="submit" id="submit" value="Submit">
    </fieldset>

</form>



</body></html>