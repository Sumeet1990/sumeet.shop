<html><meta style="visibility: hidden !important; display: block !important; width: 0px !important; height: 0px !important; border-style: none !important;"></meta><head>
<title>Register</title>
<link rel="stylesheet" href="./css/loginStylesheet.css" type="text/css"><script type="text/javascript">
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
 </script><style type="text/css"></style></head>
 
 
<body>

<form id="register" action="registerUser" method="GET" onsubmit="return checkFrSamePassword()">
    <h1 style="  text-transform: uppercase;  text-align: center;  color: #666;  margin: 0 0 30px 0;  letter-spacing: 4px;  font: normal 26px/1 Verdana, Helvetica;  position: relative;
">Register</h1>

    <input id="inputs" name="name" type="text" placeholder="Name/Owner" autofocus="" required=""><br><br>
    <input id="inputs" name="company" type="text" placeholder="Company" required=""><br><br>
    <input id="inputs" name="email" type="text" placeholder="EmailId"><br>
    <br><input id="inputs" name="username" type="text" placeholder="Username" required=""><br>   
    <br><input id="inputs" name="password" type="password" placeholder="Password" required=""><br><br>
    <input id="inputs" name="confirmpassword" type="password" placeholder="confirmpassword" required=""><br><br><br><br>

    <input id="actions" type="submit" name="submit" value="Submit" style="
    background-color: #ffb94b;      background-image: -moz-linear-gradient(top, #fddb6f, #ffb94b);  background-image: -ms-linear-gradient(top, #fddb6f, #ffb94b);  background-image: -o-linear-gradient(top, #fddb6f, #ffb94b);  background-image: linear-gradient(top, #fddb6f, #ffb94b);  -moz-border-radius: 3px;  -webkit-border-radius: 3px;  border-radius: 3px;  
    text-shadow: 0 1px 0 rgba(255,255,255,0.5);  -moz-box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;  -webkit-box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;  box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;  border-width: 1px;  border-style: solid;  border-color: #d69e31 #e3a037 #d5982d #e3a037;  float: left;  height: 35px;  padding: 0;  width: 120px;  cursor: pointer;  font: bold 15px Arial, Helvetica;  color: #8f5a0a;
    text-align: center;
">

</form>



</body></html>