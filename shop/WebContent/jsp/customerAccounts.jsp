<script type="text/javascript">

function custShowView(tabId)
{
	resetCustomerSearch();
	if(tabId == "CustomerView") {
		
		$("#CustomerAdd").hide();
		$("#CustsearchOption").show();
		$("#CustUpdateSection").hide();
		$("#CustsearchResults").hide();
	}
	else if(tabId == "CustomerAdd") {
		
		$("#CustomerView").hide();
	}
	$("#" + tabId).show();
}

function searchCustomers()
{
	var Customername = $('[name="Customername"]').val();
	var MobileNo = $('[name="MobileNo"]').val();
var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("CustsearchResults").innerHTML=xmlhttp.responseText;
    }
  }

xmlhttp.open("GET","/shop/CustomerAccList?Customername="+Customername+"&MobileNo="+MobileNo,true);
xmlhttp.send();
$("#CustsearchOption").hide();
$("#CustsearchResults").show();
}

function viewCustomerAcc(custId)
{
	$("#CustsearchResults").hide();
	$("#CustUpdateSection").show();	

	var custIdVal = $("#CustId"+custId).html();	
var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	  var val = xmlhttp.responseText;
	  $('[name="CustNameUpd"]').val(val);
	  $('[name="MobileNoUpd"]').val(val);
    /*document.getElementById("ItemCodeUpd").innerHTML=xmlhttp.responseText;*/
    }
  }

xmlhttp.open("GET","/shop/getCustomerAccDetails?custIdVal="+custIdVal,true);
xmlhttp.send();
}

function resetCustomerUpdFeilds()
{
	$("[name='CustNameUpd']").val("");
	$("[name='MobileNoUpd']").val("");
	$("[name='CreditUpd']").val("");
}

function resetCustomerSearch()
{
	$("[name='Customername']").val("");
	$("[name='MobileNo']").val("");
	resetCustomerUpdFeilds();
}

</script>

<ul style="padding: 0.1%;">
				<li><p class="SearchA" onclick="custShowView('CustomerView')">View/Search</p>
					<span id="CustomerView" class="AddAndSearchDiv">
						<h2>
							<a name="EntryView" id="EntryView">Search Add Update</a>
						</h2>
						<form action="CustomerAccList" method="GET">
						<li id="CustsearchResults">
						</li>
						<li id="CustsearchOption">
						<input id="entrys" name="Customername" type="text" placeholder="Customer Name">
						&nbsp;&nbsp;
						<input id="entrys" name="MobileNo" type="text" placeholder="Mobile Number">
						<fieldset id="actions">
							<input type="button" id="submit" onclick="searchCustomers()" value="Search">
						</fieldset> 
						</li>
						<li id="CustUpdateSection" style=" width: 100%;">
						<%@include file="/jsp/customerAccountview.jsp"%>
						</li>
						</form>
				</span></li>
				<li><p class="SearchA" onclick="custShowView('CustomerAdd')">Add</p> <span
					id="CustomerAdd" class="AddAndSearchDiv">
						<h2>
							<a name="EntryAdd" id="EntryAdd">Add</a>
						</h2>
						<form action="AddItem" method="GET">


						</form>

				</span></li>
			</ul>