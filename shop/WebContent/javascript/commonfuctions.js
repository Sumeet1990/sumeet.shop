function checkNumberOnly(nameTextBx,msg){
	var value = $("[name='"+nameTextBx+"']").val();
	if((value.search(/^[A-Za-z\s]+$/)) != -1)
	{
		alert(msg);
		$("[name='"+nameTextBx+"']").val("");
		return false;
		}
	else
	{
		return true;
		}
}

function upperCaseThetext(nameTextBx){
	var value = $("[name='"+nameTextBx+"']").val();

		$("[name='"+nameTextBx+"']").val(value.toUpperCase());
}
function deleteItem(itemId){
	var xmlhttpDelete;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttpDelete = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttpDelete = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttpDelete.onreadystatechange = function() {
		if (xmlhttpDelete.readyState == 4 && xmlhttpDelete.status == 200) {
			alert(xmlhttpDelete.responseText);
			search();
		}
	};

	xmlhttpDelete.open("GET", "/shop/deleteItem?itemId="
			+ itemId, true);
	xmlhttpDelete.send();
}