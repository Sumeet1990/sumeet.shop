<script type="text/javascript"
	src="${pageContext.request.contextPath}/javascript/jQuery1.9.js"></script>
<script type="text/javascript">
function saveItem()
{
	$('#saveItemForm').ajaxSubmit();

	}


</script>

<table  id="updateTable" style="width: 80%;">
<tr>
<td align="right" style="width: 20%;">
Item Name:
</td>
<td > 
<input style="width: 100%;" id="entrys"  name="item_name" type="text" placeholder="Item Name">
</td>
<td align="right">
Item Code:
</td>
<td> 
<input style="width: 100%;" id="entrys"  name="item_code" type="text" placeholder="Item Code">
</td>
</tr>
<tr>
<td align="right">
Item Description:
</td>
<td align="right">
 <INPUT style="width: 100%;" id="entrys"  name="item_desc" type="text"	placeholder="Item Description" />
</td>
<td align="right">
Per Price:
</td>
<td> 
<INPUT style="width: 100%;" id="entrys"  onkeyup="checkNumberOnly('PerPriceAdd','Please enter a valid per price !')" name="sale" type="text" placeholder="Per Price" />
</td>
</tr>
<tr>
<td align="right">
Buy:
</td>
<td>
 <INPUT style="width: 100%;" id="entrys"  onkeyup="checkNumberOnly('BuyAdd','Please enter a buy value !')" name="buy" type="text" placeholder="Buy" />
</td>
<!-- <td align="right">
Sell:
</td>
<td>
<INPUT style="width: 100%;" id="entrys" onkeyup="checkNumberOnly('SellAdd','Please enter a valid sell value !')" name="sale" type="text" placeholder="Sell" />
</td> -->
</tr>
</table>
<table style="width: 80%;">
<tr>
<td style="width: 110%;">
&nbsp;
</td>
<td align="right">
	<input type="submit" id="buttonAddDel" value="Save" name="submitAddate" onclick="saveItem()" >
</td>
</tr>
</table>