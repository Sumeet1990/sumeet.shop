/*function search(itemCd, itemDesc, itemName )
{
	if(itemCd== null && itemDesc==null && itemName==null)
		{
			"Please enter any criteria for searching.";
		}
	else
		{
			
			var table = "<table><thead>"+
			"<tr>"
			+"<th scope=\"col\">SNO</th>"
			+"<th scope=\"col\">Description&nbsp;</th>"
			+"<th scope=\"col\">Quantity</th>"
			+"<th scope=\"col\">Price/perItem</th>"
			+"<th scope=\"col\">Total</th>"
			+"</thead>"
			+"<tbody >"
			+"<% int count = 0;%>"
			
			+"<c:forEach items=\"${list}\" var=\"element\">"
			+"<tr>"
			+"	<td  align=\"right\"><%=++count %></td>"
			+"	<td>${element.itemCode}</td>"
			+"	<td align=\"right\">${element.quantity}</td>"
			+"	<td align=\"right\">${element.perPrice}</td>"
			+"	<td align=\"right\">${element.perPrice * element.quantity}</td>"
			+"</tr>"
			+"</c:forEach>"
			+"<tr >"
			+"<td align=\"center\">-</td>"
			+"<td align=\"center\">-</td>"
			+"<td align=\"center\">-</td>"
			+"<td>Total:</td>"
			+"<td  align=\"right\"><%=totalVal %></td>"
			+"</tr>"
			+"</tbody>"
			+"</table>";
			document.getElementById("searchResults").innerHTML= "";
		}
	
}*/
function search(itemCd, itemDesc, itemName )
{
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
    document.getElementById("searchResults").innerHTML=xmlhttp.responseText;
    }
  }

xmlhttp.open("GET","/shop/SearchUpdItem?itemCd="+itemCd+"&itemDesc="+itemDesc+"&itemName="+itemName,true);
xmlhttp.send();
$("#searchOption").hide();
}