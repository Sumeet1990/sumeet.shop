<html><meta style="visibility: hidden !important; display: block !important; width: 0px !important; height: 0px !important; border-style: none !important;"></meta><head>
<title>Reset Password</title>
<link rel="stylesheet" href="../css/loginStylesheet.css" type="text/css"><script type="text/javascript">

 </script><style type="text/css"></style></head>
 
 <script type="text/javascript">
function check()
{
	try{
	 var prevPass = document.forms["forgotPass"]["phonenumber"].value.trim();
	 var confirmPass = document.forms["forgotPass"]["email"].value.trim();

	  if(prevPass == "" || confirmPass == "")
		 {
		  alert("Please enter phone number or email id for getting password");
		  return false;
		 }
	  else
		  {
		 	return true;
		  }

	}catch(err) {
	
		alert(err.message);
	}
}
 </script>
<body>

<form id="forgotPass" action="sendPassword" method="GET" onsubmit="return check()">
    <h1>Forgot Password</h1>

    <input id="inputs" name="phonenumber" type="number" placeholder="PhoneNumber"><br><br>
    <input id="inputs" name="email" type="email" placeholder="EmailId" ><br>
    <br><input id="inputs" name="username" type="text" placeholder="Username" required><br><br>   
   <fieldset id="actions">
        <input type="submit" id="submit" value="Reset">
    </fieldset>

</form>



</body></html>