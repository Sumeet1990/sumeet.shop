<table  id="updateTable" style="width: 80%;">
<tr>
<td align="right" style="width: 20%;">
Item Name:
</td>
<td > 
<input style="width: 100%;" id="entrys"  name="ItemnameAdd" type="text" placeholder="Item Name">
</td>
<td align="right">
Item Code:
</td>
<td> 
<input style="width: 100%;" id="entrys"  name="ItemCodeAdd" type="text" placeholder="Item Code">
</td>
</tr>
<tr>
<td align="right">
Item Description:
</td>
<td align="right">
 <INPUT style="width: 100%;" id="entrys"  name="DescriptionAdd" type="text"	placeholder="Item Description" />
</td>
<td align="right">
Per Price:
</td>
<td> 
<INPUT style="width: 100%;" id="entrys"  onkeyup="checkNumberOnly('PerPriceAdd','Please enter a valid per price !')" name="PerPriceAdd" type="text" placeholder="Per Price" />
</td>
</tr>
<tr>
<td align="right">
Buy:
</td>
<td>
 <INPUT style="width: 100%;" id="entrys"  onkeyup="checkNumberOnly('BuyAdd','Please enter a buy value !')" name="BuyAdd" type="text" placeholder="Buy" />
</td>
<td align="right">
Sell:
</td>
<td>
<INPUT style="width: 100%;" id="entrys" onkeyup="checkNumberOnly('SellAdd','Please enter a valid sell value !')" name="SellAdd" type="text" placeholder="Sell" />
</td>
</tr>
</table>
<table style="width: 80%;">
<tr>
<td style="width: 110%;">
&nbsp;
</td>
<td align="right">
	<input type="button" id="buttonAddDel" value="Save" name="submitAddate" onclick="changeButton()">
</td>
</tr>
</table>