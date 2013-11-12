<script type="text/javascript"
	src="${pageContext.request.contextPath}/javascript/jQuery1.9.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/commonfuctions.js"></script>

<script type="text/javascript" >
function changeButtonUpdate() {
	try {
		if ($('[name="updateButton"]').val() == 'Edit') {
			$('[name="updateButton"]').prop('value', 'Update');
			$("#AccountsTable :input").removeAttr("disabled");
		}else if ($('[name="updateButton"]').val() == 'Update') 
			{
			 $("#AccountsTable :input").attr("disabled", "disabled");
			 $('[name="updateButton"]').css('background', 'none');
			 $('[name="updateButton"]').attr('disabled', 'disabled');
			 $('[name="showStatement"]').removeAttr('disabled');
			updateCustomerDetails();
			$('[name="updateButton"]').css('background', '');
			$('[name="updateButton"]').removeAttr('disabled');
			$('[name="updateButton"]').prop('value', 'Edit');
			
			}
	} catch (err) {
		alert(err);
	}
	/*
	 * try{ $('[name="submitUpdate"]' ).val('Update'); }catch(err) { alert(err); }
	 */
}
function updateCustomerDetails()
{
	var CustNameUpd = $('[name="CustNameUpd"]').val();
	var MobileNoUpd = $('[name="MobileNoUpd"]').val();
	var CreditUpd = $('[name="CreditUpd"]').val();
	var custUpdId = $('[name="custUpdId"]').val();

	var xmlhttpItem;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttpItem = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttpItem = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttpItem.onreadystatechange = function() {
		if (xmlhttpItem.readyState == 4 && xmlhttp.status == 200) {
			
			alert(xmlhttpItem.responseText);
		};
	};

	xmlhttpItem.open("GET", "/shop/updateCustomerDetails?CustNameUpd=" + CustNameUpd+"&MobileNoUpd="+MobileNoUpd+"&CreditUpd="+CreditUpd+"&custUpdId="+custUpdId, true);
	xmlhttpItem.send();
	}
function showCustList() {
	searchCustomers();
	$("#CustUpdateSection").hide();
	$("#AccountStatement").hide();
	
}
function showStatementInDetailsUpdate()
{
var custId = $('[name="custUpdId"]').val();
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
    }
  }

xmlhttp.open("GET","/shop/getCustomerAccStatement?custId="+custId,true);
xmlhttp.send();
$('#AccountStatement').show();
}
function showItemDetails(item_desc,item_quant)
{
	var items = item_desc.split(" , ");
	var quant = item_quant.split(" , ");
	var text = 'ITEM_DESC  ( QUANTITY )\n';
	for(var i = 0;i<items.length ;i++)
		{
		text = text + '\n '+items[i]+'   ( '+quant[i]+' )';
		}
	alert (text);
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
	var amount = prompt("Please enter amount to be paid \n In Rupees: ","0.0");
	if(amount == null || amount == '0.0')
		{
		alert("No payment was done !");
		}else if(amount.search(/^[A-Za-z\s]+$/) != -1)
			{
			alert("Enter a valid amount !");
			}
		else
			{
			alert("Amount: "+amount+"\nPayment done !");
			}
	}

</script>

<table  id="AccountsTable" style="width: 80%;">
<tr>
<td align="right" style="width: 20%;">
Customer Name:
</td>
<td > 
<input style="width: 100%;" id="entrys" onkeyup="upperCaseThetext('CustNameUpd')"   name="CustNameUpd" type="text" placeholder="Customer Name">
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
<input type="button" style="width: 100%;" id="buttonAddDel" name="showStatement" onclick="showStatementInDetailsUpdate()" value="Get Statement">
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
<td>	
	<input type="button" id="buttonAddDel" name="updateButton" value="Edit" onclick="changeButtonUpdate()">
</td>
<td align="left">
<input  name="custUpdId" type="hidden">
	<input type="button" id="buttonAddDel" name="backToList" value="Back" onclick="showCustList()">
</td>
</tr>
</table>