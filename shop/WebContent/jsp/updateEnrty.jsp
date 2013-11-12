<script type="text/javascript"
	src="${pageContext.request.contextPath}/javascript/jQuery1.9.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/commonfuctions.js"></script>
<table  id="updateTable" style="width: 80%;">
<tr>
<td align="right" style="width: 20%;">
Item Name:
</td>
<td > 
<input style="width: 100%;" id="entrys" onkeyup="upperCaseThetext('ItemnameUpd')" name="ItemnameUpd" type="text" placeholder="Item Name">
</td>
<td align="right">
Buy:
</td>
<td>
 <INPUT style="width: 100%;" id="entrys"  onkeyup="checkNumberOnly('BuyUpd','Please enter a buy value !')" name="BuyUpd" type="text" placeholder="Buy" />
</td>
</tr>
<tr>
<td align="right">
Item Description:
</td>
<td align="right">
 <INPUT style="width: 100%;" id="entrys" onkeyup="upperCaseThetext('DescriptionUpd')" name="DescriptionUpd" type="text"	placeholder="Item Description" />
</td>
<td align="right">
Per Price:
</td>
<td> 
<INPUT style="width: 100%;" id="entrys"  onkeyup="checkNumberOnly('PerPriceUpd','Please enter a valid per price !')" name="PerPriceUpd" type="text" placeholder="Per Price" />
</td>
</tr>
<tr>
<td> 
<INPUT name="itemIdUpd" type="hidden" />
</td>
</tr>
</table>
<table style="width: 80%;">
<tr>
<td style="width: 110%;">
&nbsp;
</td>
<td align="right">
	<input type="button" id="buttonAddDel" name="submitUpdate" onclick="changeButton()">
</td>
<td align="left">
	<input type="button" id="buttonAddDel" name="backToList" value="Back" onclick="showList()">
</td>
</tr>
</table>