function search()
{
	var itemName = $('[name="Itemname"]').val();
	var itemCd = $('[name="ItemCode"]').val();
	var itemDesc = $('[name="Description"]').val();
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
$("#searchResults").show();
}


function updateRecord(itemCodeNo)
{
	$("#searchResults").hide();
	$("#updateSection").show();	
	$('[name="submitUpdate"]').prop('value','Edit');
	$("#updateTable :input").attr("disabled","disabled");

	var itemCodeVal = $("#itemCode"+itemCodeNo).html();	
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
	  $('[name="Itemname"]').val(xmlhttp.responseText);
    /*document.getElementById("ItemCodeUpd").innerHTML=xmlhttp.responseText;*/
    }
  }

xmlhttp.open("GET","/shop/getItemDetails?itemCd="+itemCodeVal,true);
xmlhttp.send();
}

function changeButton()
{
	try{
	$('[name="submitUpdate"]').prop('value','Update');
	$("#updateTable :input").removeAttr("disabled");
	}catch(err)
	{
		alert(err);
	}
/*	try{
	$('[name="submitUpdate"]' ).val('Update');
}catch(err)
{
	alert(err);
}*/
}
function showList()
{
	$("#updateSection").hide();	
	search();
}