<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title></title>
</head>
<body>
	<h1 style="text-align: center;">Welcome</h1>
	<div>
		<table align="left" border="1" cellpadding="1" cellspacing="1"
			style="width: 500px;">
			<tbody>
				<tr>
					<td>Name:&nbsp;</td>
					<td>&nbsp;Sumeet&nbsp;</td>
				</tr>
				<tr>
					<td>Details:&nbsp;</td>
					<td>&nbsp;Details&nbsp;</td>
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
	<table border="1" cellpadding="1" cellspacing="1" style="width: 70%;">
		<thead>
			<tr>
				<th scope="col">SNO</th>
				<th scope="col">Description&nbsp;</th>
				<th scope="col">Quantity</th>
				<th scope="col">Price/perItem</th>
		</thead>
		<tbody>
			<% int count = 0;%>
			<%Integer totalVal = request.getAttribute("total") == null ? 0 : (Integer)request.getAttribute("total");	%>
			<c:forEach items="${list}" var="element">
				<tr>
					<td><%=++count %></td>
					<td>${element.itemCode}</td>
					<td>${element.quantity}</td>
					<td>${element.perPrice}</td>
				</tr>
			</c:forEach>

			<tr align="right">
				<td></td>
				<td></td>
				<td>Total:</td>
				<td><%=totalVal %></td>
			</tr>

		</tbody>
	</table>
	<p style="text-align: right;">
		<input name="Done" type="button" value="Done" /><input name="Print"
			type="button" value="Print" />
	</p>
</body>
</html>
