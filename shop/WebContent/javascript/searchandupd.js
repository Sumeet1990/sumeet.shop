function search() {
	var itemName = $('[name="Itemname"]').val();
	var itemCd = $('[name="ItemCode"]').val();
	var itemDesc = $('[name="Description"]').val();
	if (itemName.trim() == '' && itemCd.trim() == '' && itemDesc.trim() == '') {
		alert('Please enter atleast on search criteria !');
	} else {
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
									// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("searchResults").innerHTML = xmlhttp.responseText;
			}
		}

		xmlhttp.open("GET", "/shop/SearchUpdItem?itemCd=" + itemCd
				+ "&itemDesc=" + itemDesc + "&itemName=" + itemName, true);
		xmlhttp.send();
		$("#searchOption").hide();
		$("#searchResults").show();
	}
}

function updateRecord(itemCodeNo) {
	$("#searchResults").hide();
	$("#updateSection").show();
	$('[name="submitUpdate"]').prop('value', 'Edit');
	$("#updateTable :input").attr("disabled", "disabled");

	var itemCodeVal = $("#itemCode" + itemCodeNo).html();
	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var val = xmlhttp.responseText;
			$('[name="ItemnameUpd"]').val(val);
			$('[name="ItemCodeUpd"]').val(val);
		}
	}

	xmlhttp.open("GET", "/shop/getItemDetails?itemCd=" + itemCodeVal, true);
	xmlhttp.send();
}

function changeButton() {
	try {
		if ($('[name="submitUpdate"]').val() == 'Add') {
			$('[name="submitUpdate"]').prop('value', 'Done');
		} else if ($('[name="submitUpdate"]').val() == 'Edit') {
			$('[name="submitUpdate"]').prop('value', 'Update');
		}
		$("#updateTable :input").removeAttr("disabled");
	} catch (err) {
		alert(err);
	}
	/*
	 * try{ $('[name="submitUpdate"]' ).val('Update'); }catch(err) { alert(err); }
	 */
}
function showList() {
	$("#updateSection").hide();
	search();
}
function resetFeilds() {
	$("[name='ItemCodeUpd']").val("");
	$("[name='ItemnameUpd']").val("");
	$("[name='DescriptionUpd']").val("");
	$("[name='PerPriceUpd']").val("");
	$("[name='BuyUpd']").val("");
	$("[name='SellUpd']").val("");
}

function resetSearch() {
	$("[name='Itemname']").val("");
	$("[name='ItemCode']").val("");
	$("[name='Description']").val("");
	resetFeilds();
}
