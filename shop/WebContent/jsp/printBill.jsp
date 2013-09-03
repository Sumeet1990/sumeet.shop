<%@page import="sumeet.shop.beans.Customer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title></title>
</head>
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
</script>
<%
Customer cust = (Customer)request.getAttribute("billCustObj");
%>
<body onload="displayTime()" style="background: none repeat scroll 0% 0% lightblue;">
	<p style="text-align: right;">
		<input name="Print"type="button" onclick="printpage()" value="Print" />
		<input name="Done" type="button" onclick="goBack()" value="Close" />
	</p>
	<h1 style="text-align: center;">Welcome</h1>
	<h3 id="displayTime" style="text-align: right;"></h3>
	<div>
		<table align="left" border="1" cellpadding="1" cellspacing="1"
			style="width: 500px; background: none repeat scroll 0% 0% lightgrey;">
			<tbody>
				<tr >
					<td style="width: 30%;">Name:</td>
					<td style="width: 50%;">&nbsp;<%=cust.getCustomername()%>&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 30%;">Mobile No:</td>
					<td style="width: 50%;">&nbsp;<%=cust.getPhonenumber() %>&nbsp;</td>
				</tr>
			</tbody>
		</table>
		<p>
			<input alt="" src="as" style="float: right;" type="image" />
		</p>
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
			<%Double totalVal = request.getAttribute("total") == null ? 0 : (Double)request.getAttribute("total");	%>
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
</body>
</html>
