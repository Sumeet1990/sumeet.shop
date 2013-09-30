<%@page import="sumeet.shop.beans.Customer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<html>
<head>
<title></title>
</head>
<%
Customer cust = (Customer)request.getAttribute("billCustObj");
%>
<script type="text/javascript">
function printpage()
{
window.print();
}

function goBack()
{
window.history.back();
}

function displayTime()
{
var today = new Date();

var curr_year = today.toDateString();
var h = today.getHours();
var m = today.getMinutes();

document.getElementById("displayTime").innerHTML = curr_year+" "+h+":"+m;
}
function cashPay()
{
	
}
	
function creditPay()
{
	var custId = <%=request.getAttribute("custId")%>;
	var exitStatus;
	var createStatus;
if( custId == -1)
	{
		 createStatus = confirm("Do you want to create a new cutomer account !");
	}else
		{
		 exitStatus = confirm("Customer already exist, Please select Cancel for creating new account !");
		}
var status = createStatus || !exitStatus;
	if(window.XMLHttpRequest)
		{
		xmlhttp = new XMLHttpRequest(); 
		}
	else
		{
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	xmlhttp.onreadystatechange=function(){
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
			alert(xmlhttp.responseText);
			}
	};
	xmlhttp.open('GET','/shop/jsp/payCredit?custId='+custId+'&createStatus='+status,false);
	xmlhttp.send();
}
</script>

<body onload="displayTime()" style="background: none repeat scroll 0% 0% lightblue;">
	<p style="text-align: right;">
		<input name="Print" id="buttonAddDel" type="button" onclick="printpage()" value="Print" />
		<input name="Done"  id="buttonAddDel" type="button" onclick="goBack()" value="Close" />
	</p>
	<h1 style="text-align: center;">Welcome</h1>
	<h3 id="displayTime" style="text-align: right;"></h3>
	<div>
		<table align="left" cellpadding="1" cellspacing="1"
			style="width: 500px;">
			<tbody>
				<tr >
					<td style="width: 30%;">Name:</td>
					<td style="width: 50%;">&nbsp;<%=cust.getCustomername()%>&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 30%;">Mobile No:</td>
					<td style="width: 50%;">&nbsp;<%=cust.getPhonenumber() == 0 ? "-" : cust.getPhonenumber() %>&nbsp;</td>
				</tr>
			</tbody>
		</table>
	</div>
	</br>
	</br>
	</br>
	</br>
	</br>
	</br>
	<table border="1" cellpadding="1" cellspacing="1" style="width: 70%; background: none repeat scroll 0% 0% lightgrey;">
		<thead>
			<tr>
				<th scope="col">SNO</th>
				<th scope="col">Description&nbsp;</th>
				<th scope="col">Quantity</th>
				<th scope="col">Price/perItem</th>
				<th scope="col">Total</th>
		</thead>
		<tbody >
			<% int count = 0;%>
			<%String  totalVal = request.getAttribute("total") == null ? "0" : (String)request.getAttribute("total");	%>
			<c:forEach items="${list}" var="element">
				<tr>
					<td  align="right"><%=++count %></td>
					<td>${element.itemCode}</td>
					<td align="right">${element.quantity}</td>
					<td align="right">${element.perPrice}</td>
					<td align="right">${element.perPrice * element.quantity}</td>
				</tr>
			</c:forEach>

			<tr >
				<td align="center">-</td>
				<td align="center">-</td>
				<td align="center">-</td>
				<td align="right">Total:</td>
				<td  align="right"><%=totalVal %></td>
			</tr>
			

		</tbody>
	</table>
	<table>
	<tr>
			<td style="width:678px"></td>
			<td></td>
			<td></td>
			<td><input type="button" id="buttonAddDel"  onclick="cashPay()" value="Cash"></td>
			<td><input type="button" id="buttonAddDel" onclick="creditPay()" value="Credit"></td>
			</tr>
	</table>
</body>
</html>
