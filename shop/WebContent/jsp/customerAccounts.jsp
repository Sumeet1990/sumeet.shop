<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript">
function saveCustomer()
{
	 $.ajax({
         type: "GET",
         url: '/shop/jsp/addCustomer',
         data: $("#addCustomerForm").serialize(), // serializes the form's elements.
         success: function(data)
         {
             alert(data); // show response from the php script.
         }
       });

	}
	
	function custShowView(tabId) {
		resetCustomerSearch();
		if (tabId == "CustomerView") {

			$("#CustomerAdd").hide();
			$("#CustsearchOption").show();
			$("#CustUpdateSection").hide();
			$("#CustsearchResults").hide();
			$("#CustAddSection").hide();
		} else if (tabId == "CustomerAdd") {

			$("#CustomerView").hide();
			$("#CustAddSection").show();
		}
		$("#" + tabId).show();
	}

	function searchCustomers() {
		var Customername = $('[name="Customername"]').val();
		var MobileNo = $('[name="MobileNo"]').val();

		if (Customername.trim() == '' && MobileNo.trim() == '') {
			alert('Please enter atleast one search criteria !');
		} else {
			var xmlhttp;
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp = new XMLHttpRequest();
			} else {// code for IE6, IE5
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					document.getElementById("CustsearchResults").innerHTML = xmlhttp.responseText;
				}
			};

			xmlhttp.open("GET", "/shop/CustomerAccList?Customername="
					+ Customername + "&MobileNo=" + MobileNo, true);
			xmlhttp.send();
			$("#CustsearchOption").hide();
			$("#CustsearchResults").show();
		}
	}

	function viewCustomerAcc(custId) {
		$("#CustsearchResults").hide();
		$("#CustUpdateSection").show();

		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var jsonObj = JSON.parse(xmlhttp.responseText);
				$('[name="CustNameUpd"]').val(jsonObj.cust_name);
				$('[name="MobileNoUpd"]').val(jsonObj.contact_no);
				$('[name="CreditUpd"]').val(jsonObj.credit);
			}
		};

		xmlhttp.open("GET", "/shop/getCustomerAccDetails?custIdVal="
				+ custId, true);
		xmlhttp.send();
	}

	function resetCustomerUpdFeilds() {
		$("[name='CustNameUpd']").val("");
		$("[name='MobileNoUpd']").val("");
		$("[name='CreditUpd']").val("");
		$("#AccountStatement").hide();
	}

	function resetCustomerSearch() {
		$("[name='Customername']").val("");
		$("[name='MobileNo']").val("");
		resetCustomerUpdFeilds();
	}
</script>

<ul style="padding: 0.1%;">
	<li><p class="SearchA" onclick="custShowView('CustomerView')">View/Search</p>
		<span id="CustomerView" class="AddAndSearchDiv">
			<h2>
				<a name="EntryView" id="EntryView">Search and Update</a>
			</h2>
			<form action="CustomerAccList" method="GET">
				<li id="CustsearchResults"></li>
				<li id="CustsearchOption"><input id="entrys"
					name="Customername" type="text" placeholder="Customer Name">
					&nbsp;&nbsp; <input id="entrys" name="MobileNo" type="text"
					onkeyup="checkNumberOnly('MobileNo','Please enter a valid mobile number !')"
					placeholder="Mobile Number">
					<fieldset id="actions">
						<input type="button" id="submit" onclick="searchCustomers()"
							value="Search">
					</fieldset></li>
				<li id="CustUpdateSection" style="width: 100%;"><%@include
						file="/jsp/customerAccountview.jsp"%></li>
			</form>
	</span></li>
	<li><p class="SearchA" onclick="custShowView('CustomerAdd')">Add</p>
		<span id="CustomerAdd" class="AddAndSearchDiv">
			<h2>
				<a name="EntryAdd" id="EntryAdd">Add</a>
			</h2>
			<form:form commandName="saveCustomerObj" id="addCustomerForm" action="addCustomer" method="GET">
			<li id="CustAddSection" style="width: 100%;"><%@include
						file="/jsp/addCustomerAcc.jsp"%></li>
			</form:form>
	</span></li>
</ul>