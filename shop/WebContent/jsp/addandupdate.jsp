<table  id="updateTable" style="width: 80%;">
<tr>
<td align="right" style="width: 20%;">
Item Name:
</td>
<td > 
<input style="width: 100%;" id="entrys"  name="Itemname" type="text" placeholder="Item Name">
</td>
<td align="right">
Item Code:
</td>
<td> 
<input style="width: 100%;" id="entrys"  name="ItemCodeUpd" type="text" placeholder="Item Code">
</td>
</tr>
<tr>
<td align="right">
Item Description:
</td>
<td align="right">
 <INPUT style="width: 100%;" id="entrys"  name="Description" type="text"	placeholder="Item Description" />
</td>
<td align="right">
Per Price:
</td>
<td> 
<INPUT style="width: 100%;" id="entrys"  name="PerPrice" type="text" placeholder="Per Price" />
</td>
</tr>
<tr>
<td align="right">
Buy:
</td>
<td>
 <INPUT style="width: 100%;" id="entrys"  name="Buy" type="text" placeholder="Buy" />
</td>
<td align="right">
Sell:
</td>
<td>
<INPUT style="width: 100%;" id="entrys"name="Sell" type="text" placeholder="Sell" />
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