<html><meta style="visibility: hidden !important; display: block !important; width: 0px !important; height: 0px !important; border-style: none !important;"></meta><head>
<title>Reset Password</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginStylesheet.css" type="text/css">
<style type="text/css"></style></head>
<script type="text/javascript"	src="${pageContext.request.contextPath}/javascript/jQuery1.9.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/commonfuctions.js">
</script>
 <script type="text/javascript">
function check()
{
	try{
		if(checkNumberOnly('phonenumber','Please enter a valid phone number !'))
		{
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
		}else
			{
				return false;
			}

	}catch(err) {
	
		alert(err.message);
		return false;}
	}
 </script>
<body>

<form id="forgotPass" action="sendPassword" method="GET" onsubmit="return check()">
    <h1>Forgot Password</h1>

    <input id="inputsnormal" name="phonenumber" type="number" placeholder="PhoneNumber"><br><br>
    <input id="inputsnormal" name="email" type="email" placeholder="EmailId" ><br>
    <br><input id="inputsnormal" name="username" type="text" placeholder="Username" required><br><br>   
   <fieldset id="actions">
        <input type="submit" id="submit" value="Reset">
        <a href="${pageContext.request.contextPath}">Back</a>
    </fieldset>

</form>



</body></html>