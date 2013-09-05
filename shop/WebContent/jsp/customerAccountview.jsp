<script type="text/javascript" >
function showCustList() {
	searchCustomers();
	$("#CustUpdateSection").hide();
	
}
function showStatementInDetail()
{
alert("Hii");
var custId = $('[name="CustNameUpd"]').val();
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
	  $('#AccountStatement').html(xmlhttp.responseText);
    /*document.getElementById("ItemCodeUpd").innerHTML=xmlhttp.responseText;*/
    }
  }

xmlhttp.open("GET","/shop/getCustomerAccStatement?custId="+custId,true);
xmlhttp.send();
$('#AccountStatement').show();
}
</script>

<table  id="AccountsTable" style="width: 80%;">
<tr>
<td align="right" style="width: 20%;">
Customer Name:
</td>
<td > 
<input style="width: 100%;" id="entrys"  name="CustNameUpd" type="text" placeholder="Customer Name">
</td>
<td align="right">
Mobile Number:
</td>
<td> 
<input style="width: 100%;" id="entrys"  name="MobileNoUpd" type="text" placeholder="Mobile Number">
</td>
</tr>
<tr>
<td align="right">
Credit:
</td>
<td align="right">
 <INPUT style="width: 100%;" id="entrys"  name="CreditUpd" type="text"	placeholder="Credit" />
  <INPUT type="hidden" name="CustId" type="text"/>
</td>
<td align="right">
Details:
</td>
<td> 
<input type="button" style="width: 100%;" id="buttonAddDel" name="showStatement" onclick="showStatementInDetail()" value="Get Statement">
</td>
</tr>
</table>
<div id="AccountStatement">
</div>
<table style="width: 80%;">
<tr>
<td>
&nbsp;
</td>
</tr>
<tr>
<td style="width: 110%;">
&nbsp;
</td>
<td align="left">
	<input type="button" id="buttonAddDel" name="backToList" value="Back" onclick="showCustList()">
</td>
</tr>
</table>