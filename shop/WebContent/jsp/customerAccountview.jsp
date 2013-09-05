<script type="text/javascript" >
function showCustList() {
	searchCustomers();
	$("#CustUpdateSection").hide();
	$("#AccountStatement").hide();
	
}
function showStatementInDetail()
{
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

function printCustomerAccStmt()
{
	$('[name="showStatement"]').hide();
	$('[name="payAmount"]').hide();
	 var mywindow = window.open('', 'CustUpdateSection', 'height=400,width=600');
     mywindow.document.write('<html><head><title>Account Details</title>');
     mywindow.document.write('</head><body >');
     //mywindow.document.write('<link rel="stylesheet" href="css/print.css" type="text/css" media="print"/>');
     mywindow.document.write($('#CustUpdateSection').html());
     mywindow.document.write('</body></html>');
      mywindow.print();
      mywindow.close();
     $('[name="showStatement"]').show();
     $('[name="payAmount"]').show();
	}

function payCreditAmount()
{
	var amount = prompt("Pelase enter amount to be paid","0.0");
	if(amount == null || amount == '0.0')
		{
		alert("No payement done !");
		}else if(amount.search(/^[A-Za-z\s]+$/) != -1)
			{
			alert("Enter a valid amount !");
			}
		else
			{
			alert("Amount: "+amount+" Payement done !");
			}
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
<div id="AccountStatement" style="width: 57%;">
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