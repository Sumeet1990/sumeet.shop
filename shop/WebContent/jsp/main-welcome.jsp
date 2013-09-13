<%@page import="java.util.Date"%>
<html dir="ltr" lang="en">
<head>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Expires", "0");
	response.setDateHeader("Expires", -1);
	/*
	String user = (String)request.getAttribute("Username");
	HttpSession ses = request.getSession();
	session.setAttribute(user, ses); */
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Main</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/domtab.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/searchContainer.css"
	type="text/css">

<!--[if gt IE 6]>
	<style type="text/css">
		html>body ul.domtabs a:link,
		html>body ul.domtabs a:visited,
		html>body ul.domtabs a:active,
		html>body ul.domtabs a:hover{
			height:3em;
		}
	</style>
<![endif]-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/javascript/domtab.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/javascript/jQuery1.9.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/commonfuctions.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/javascript/searchandupd.js"></script>
<script type="text/javascript">
	var hide = true;
	var valueArr = new Array("Armani","Box","Saab", "Volvo", "BMW", "Vorvo");
	var valuePriceArr = new Array("50,000","50","1,200", "12,53,42,000", "2,53,00,000", "30,000");

	$(document).click(function(event) {
		if (event.target.nodeName == "LI") {
			hide = false;
		}
	});

	$(document).ready(function() {
		$("#CustUpdateSection").hide();
		$("#Add").hide();
		$("#View").hide();
		$("#CustomerView").hide();
		$("#CustomerAdd").hide();
		$("#CustsearchOption").hide();
		$('[name="dontDisplay"]').hide();
		$('body').on("keyup", '.numberOnly', function() {
			if (this.value.search(/^[A-Za-z\s]+$/) != -1) {
				if (!(this.value.replace(/^\s+|\s+$/g, '') == '')) {
					alert("Please enter number");
					this.value = this.value.replace(/[^0-9\.]/g, '');
				}
			} else
				this.value = this.value.replace(/[^0-9\.]/g, '');
		});
	});

	var count = -1;
	var downKeyCount = 0;
	function hideTab(tabId) {
		resetSearch();
		if (tabId == "View") {
			$("#Add").hide();
			$("#searchResults").hide();
			$("#updateSection").hide();
			$("#searchOption").show();
		} else if(tabId == "Add") {
			$("#View").hide();
		}
		$("#" + tabId).show();
	}
	function updatePrice(id) {
		try {
			var quantity = $("[name='quantity" + id + "']").val();
			var perprice = $("[name='price" + id + "']").val().replace(/,/g,"");
			$("#totalValue" + id).text(quantity * perprice);

		} catch (err) {
			alert("Total--" + err);
		}
	}
	function setItemCode(liId, inputsearchBxId) {

		try {
			var liIdin = 'liEll' + liId;
			var inputSearchId = 'inputSearch' + inputsearchBxId;

			var li = document.getElementById(liIdin).innerHTML;

			document.getElementById(inputSearchId).value = li;
			$("#textbx" + inputsearchBxId).hide();
			setPrice(li,inputsearchBxId);
		} catch (err) {
			alert("Error ===" + err);
		}
	}

	function checkItemExist(e, id) {
		try {
			$('#noItemInfo'+id).html("");
			var textBxId = 'textbx' + id;
			var ul = document.getElementById(textBxId);
			var inputsearchBx = 'inputSearch' + id;
			var value = document.getElementById(inputsearchBx).value;
			var lis = document.getElementsByName("liEll");
			
			$("#" + inputsearchBx).unbind('blur');
			
			if (e.which == 40) {

				if (downKeyCount == 0) {
					$('#' + textBxId).children('li').eq(downKeyCount).addClass(
							"liJqeryDown");
					var inputitmcd = $('#' + textBxId).children('li').eq(downKeyCount).text();
					$("#" + inputsearchBx).val(inputitmcd);
					setPrice(inputitmcd,id);
					
					$("#" + inputsearchBx).blur(function() {
						  $('#' + textBxId).hide();
						});

				} else {
					//alert($('#'+textBxId).children('li').eq(downKeyCount));
					if ($('#' + textBxId).children('li').eq(downKeyCount).length > 0) {
						$('#' + textBxId).children('li').eq((downKeyCount - 1))
								.removeClass("liJqeryDown");
						$('#' + textBxId).children('li').eq(downKeyCount)
								.addClass("liJqeryDown");
						var iputitemCd = $('#' + textBxId).children('li').eq(
								downKeyCount).text();
						$("#" + inputsearchBx).val(iputitemCd);
						setPrice(iputitemCd,id);
					} else {
						downKeyCount--;
					}
					$("#" + inputsearchBx).blur(function() {
						  $('#' + textBxId).hide();
						});
				}
				downKeyCount++;
			} else if (e.which == 38) {
				if (!downKeyCount == 0)
					downKeyCount--;
				if ($('#' + textBxId).children('li').eq(downKeyCount).length > 0) {
					$('#' + textBxId).children('li').eq((downKeyCount + 1))
							.removeClass("liJqeryDown");
					$('#' + textBxId).children('li').eq(downKeyCount).addClass(
							"liJqeryDown");
					var inputitemcode = $('#' + textBxId).children('li').eq(downKeyCount).text();
					$("#" + inputsearchBx).val(inputitemcode);
					
					setPrice(inputitemcode,id);
				}
			} else if (e.which == 13) {
				$("#" + textBxId).hide();
			} else {
				downKeyCount = 0;

				if (lis != null) {
					while (ul.firstChild) {
						ul.removeChild(ul.firstChild);
					}
				}

				if (!(value.replace(/^\s+|\s+$/g, '') == '')) {
					$("#" + textBxId).show();
					for ( var i = 0; i < valueArr.length; i++) {

						var singleVal = valueArr[i];
						if ((singleVal.toUpperCase().indexOf(value
								.toUpperCase())) == 0) {
							var li = document.createElement('li');

							ul.appendChild(li);
							li.innerHTML = "<li class='liImageClass' name='liEll' id='liEll"
									+ i
									+ "' onclick='setItemCode("
									+ i
									+ ","
									+ id + ")'>" + valueArr[i] + "</li>";
						}
					}
					if(ul.firstChild == null)
						{
						$("#" + textBxId).hide();
						var inputval = $('#inputSearch'+id).val();
						$('#inputSearch'+id).val(inputval.substring(0, inputval.length-1));
						$('#noItemInfo'+id).html("No item exist for: "+inputval);
						$('[name="price'+id+'"]').val("0.0");
						}
				}else
					{
						$("#" + textBxId).hide();
					}
			}
		} catch (err) {
			alert(err);
		}
	}
	
	function setPrice(inputitemcode,idPrice)
	{

		for ( var i = 0; i < valueArr.length; i++) {

			var singleVal = valueArr[i];
			if (singleVal == inputitemcode){
				$("[name='price"+idPrice+"']").val(valuePriceArr[i]);
					}
			}
	}
	
	function startTime() {
		var today = new Date();

		var curr_year = today.toDateString();
		var h = today.getHours();
		var m = today.getMinutes();
		var s = today.getSeconds();
		// add a zero in front of numbers<10
		m = checkTime(m);
		s = checkTime(s);
		document.getElementById('top1').innerHTML = curr_year + "  " + "   "
				+ h + ":" + m + ":" + s;
		t = setTimeout(function() {
			startTime();
		}, 500);
	}

	function checkTime(i) {
		if (i < 10) {
			i = "0" + i;
		}
		return i;
	}

	function addRow(tableID) {
		downKeyCount = 0;
		var table = document.getElementById(tableID);

		var rowCount = table.rows.length;
		var row = table.insertRow(rowCount);

		/*var cell1 = row.insertCell(0);
		 var element1 = document.createElement("input");
		element1.type = "checkbox";
		element1.name = "chkbox[]";
		cell1.appendChild(element1); */

		var cell2 = row.insertCell(0);
		count++;
		cell2.innerHTML = '<li name="dontDisplay" style="color: red;" id="noItemInfo'+count+'"></li><span class="search" >'
				+ '<input type="search" name="itemCode'
				+ count
				+ '" id="inputSearch'
				+ count
				+ '" onKeyup="checkItemExist(event,'
				+ count
				+ ')"   placeholder="Search..." autocomplete="off" size="30"/>'
				+ ' <ul name="ulHidden" class="search-ac" id="textbx'+count+'">'
				+ '</span>';

		var cell3 = row.insertCell(1);
		cell3.innerHTML = '<input type="text" value="0.0" name="quantity'
				+ count + '" onchange="updatePrice(' + count
				+ ')" class="numberOnly" id="quantityTab" size="30"/>';
		var cell4 = row.insertCell(2);
		cell4.innerHTML = '<input type="text" class="priceTab" value="0.0" disabled="disabled" name="price' + count
				+ '" onchange="updatePrice(' + count
				+ ')" class="numberOnly" id="quantityTab" size="30"/>';
		var cell5 = row.insertCell(3);
		cell5.innerHTML = '<span style="color:black" id="totalValue'+count+'">0.0 </span>';

		$("#textbx" + count).hide();
	}
/* 
	function deleteRow(tableID) {
		try {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;

			for ( var i = 0; i < rowCount; i++) {
				var row = table.rows[i];
				var chkbox = row.cells[0].childNodes[0];
				if (null != chkbox && true == chkbox.checked) {
					table.deleteRow(i);
					rowCount--;
					i--;
				}

			}
		} catch (e) {
			alert(e);
		}
	} */
function validateInputs()
{
try{
	var val = $(".search :first-child").val();
	var error = $("[name='dontDisplay']").html();
	var hiddenVisible = $("[name='ulHidden']").is(":visible");
	if ((val.replace(/^\s+|\s+$/g, '') == '') || error != '' || hiddenVisible)
		{
			alert("Please select at least one item.");
			return false;
		}else
			{
			$(".priceTab").removeAttr("disabled");
			return true;
			}
	return false;
}catch(err)
{
	alert("Please select a valid item. Error:"+err);
	return false;
	}
}
	document.write('<style type="text/css">');
	document.write('div.domtab div{display:none;}<');
	document.write('/s' + 'tyle>');
</script>
</head>
<body onload="startTime()">
	<a href="${pageContext.request.contextPath}/jsp/signout.jsp"
		style="float: right; color: white;">Sign out</a>
	<h1 style="text-align: center;">
	<% String userNameCamelcase = (String)request.getSession().getAttribute("Username"); 
		      userNameCamelcase = userNameCamelcase.toUpperCase().charAt(0)+userNameCamelcase.substring(1);%>
		<a style="color: white;" name="top" id="top">Wellcome <%=userNameCamelcase%>,Have a great day!!!
		</a>
		<br>
		<a name="top" style="float: right; color: blue; font-size: 22px;" id="top1"></a>
	</h1>

	<p id="domtabprintview"></p>
	<div id="other" class="domtab doprevnext">
		<ul class="domtabs">
			<li><a href="#billing">Billing</a></li>
			<li><a href="#accounts" style="width: 85%;">Customer accounts</a></li>
			<li><a href="#materialentry" >Material entry</a></li>
		</ul>
		<div>
			<h2>
				<a name="billing" id="billing">Billing</a>
			</h2>
			<form action="makeBill" onsubmit="return validateInputs();" method="GET" id="makeBillSubmit">

				<input id="inputs" name="customername" type="text"
					placeholder="Customer Name" autofocus="" required=""><br>
				<input id="inputs" name="phonenumber" type="text" class="numberOnly"
					placeholder="Phone Number"><br> <INPUT
					id="buttonAddDel" type="button" value="Add Row"
					onclick="addRow('background-image')" />&nbsp;&nbsp; 
					<!-- <INPUT
					id="buttonAddDel" type="button" value="Delete Row"
					onclick="deleteRow('background-image')" />  --><br />

				<table id="background-image" summary="Meeting Results">
					<thead>
						<tr>
							 <!-- <th scope="col"></th>  -->
							<th scope="col">Item Description</th>
							<th scope="col">Quantity</th>
							<th scope="col">Price</th>
							<th scope="col">Total</th>
						</tr>
					</thead>
				</table>

				<fieldset id="actions">
					<input type="submit" id="submit"  value="Done">
				</fieldset>

			</form>
		</div>
		<div>
			<h2>
				<a name="accounts" id="accounts">Mange customer accounts</a>
			</h2>
			<%@include file="/jsp/customerAccounts.jsp"%>
		</div>
		<div>
			<h2>
				<a name="materialentry" id="materialentry">Material Entry</a>
			</h2>
			<!-- Start -->
			<ul style="padding: 0.1%;">
				<li><p class="SearchA" onclick="hideTab('View')">View/Search</p>
					<span id="View" class="AddAndSearchDiv">
						<h2>
							<a name="EntryView" id="EntryView">Search and Update</a>
						</h2>
						<form action="SearchUpdItem" method="GET">
						<li id="searchResults">
						</li>
						<li id="searchOption">
						<input id="entrys" name="Itemname" type="text" placeholder="Item Name">
						&nbsp;&nbsp;
						<input id="entrys" name="ItemCode" type="text" placeholder="Item Code">
						&nbsp;&nbsp;
						<INPUT id="entrys" name="Description" type="text"	placeholder="Item Description" />
						<fieldset id="actions">
							<input type="button" id="submit" onclick="search()" value="Search">
						</fieldset>
						</li>
						<li id="updateSection">
						<%@include file="/jsp/updateEnrty.jsp"%>
						</li>
						</form>
				</span></li>
				<li><p class="SearchA" onclick="hideTab('Add')">Add</p> <span
					id="Add" class="AddAndSearchDiv">
						<h2>
							<a name="EntryAdd" id="EntryAdd">Add</a>
						</h2>
						<form action="AddItem" method="GET">

						<li id="AddSection">
						<%@include file="/jsp/addEnrty.jsp"%>
						</li>

						</form>

				</span></li>
			</ul>
			<!-- End -->
		</div>
	</div>
</body>
</html>
