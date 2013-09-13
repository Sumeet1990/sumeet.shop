<table  id="AccountsTable" style="width: 80%;">
<tr>
<td align="right" style="width: 20%;">
Customer Name:
</td>
<td > 
<input style="width: 100%;" id="entrys"  name="CustNameAdd" type="text" placeholder="Customer Name">
</td>
<td align="right">
Mobile Number:
</td>
<td> 
<input style="width: 100%;" id="entrys"  name="MobileNoAdd" onkeyup="checkNumberOnly('MobileNoAdd','Please enter a valid mobile number !')" type="text" placeholder="Mobile Number">
</td>
</tr>
<tr>
<td align="right">
Credit:
</td>
<td align="right">
 <INPUT style="width: 100%;" id="entrys"  name="CreditAdd" onkeyup="checkNumberOnly('CreditAdd','Please enter a valid credit amount !')" type="text"	placeholder="Credit" />
  <INPUT type="hidden" name="CustId" type="text"/>
</td>
</tr>
</table>
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
	<input type="button" id="buttonAddDel" name="addCustomer" value="Add">
</td>
</tr>
</table>