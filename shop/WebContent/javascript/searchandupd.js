function search() {
	var itemName = $('[name="Itemname"]').val();
	var itemDesc = $('[name="Description"]').val();
	if (itemName.trim() == '' && itemDesc.trim() == '') {
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

		xmlhttp.open("GET", "/shop/SearchUpdItem?itemDesc=" + itemDesc + "&itemName=" + itemName, true);
		xmlhttp.send();
		$("#searchOption").hide();
		$("#searchResults").show();
	}
}

function updateRecord(itemId) {
	$("#searchResults").hide();
	$("#updateSection").show();
	$('[name="submitUpdate"]').prop('value', 'Edit');
	$("#updateTable :input").attr("disabled", "disabled");

	var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			 var json = JSON.parse(xmlhttp.responseText);

				  $('[name="ItemnameUpd"]').val(json.item_name);
				  $('[name="BuyUpd"]').val(json.buy);
				  $('[name="DescriptionUpd"]').val(json.item_desc);
				  $('[name="PerPriceUpd"]').val(json.sale);
				  $('[name="itemIdUpd"]').val(json.item_id);
					
		};
	};

	xmlhttp.open("GET", "/shop/getItemDetails?itemId=" + itemId, true);
	xmlhttp.send();
}

function changeButton() {
	try {
		if ($('[name="submitUpdate"]').val() == 'Edit') {
			$('[name="submitUpdate"]').prop('value', 'Update');
			$("#updateTable :input").removeAttr("disabled");
		}else if ($('[name="submitUpdate"]').val() == 'Update') 
			{
			 $("#updateTable :input").attr("disabled", "disabled");
			 $('[name="submitUpdate"]').css('background', 'none');
			 $('[name="submitUpdate"]').attr('disabled', 'disabled');
			updateItemDetails();
			$('[name="submitUpdate"]').css('background', '');
			$('[name="submitUpdate"]').removeAttr('disabled');
			$('[name="submitUpdate"]').prop('value', 'Edit');
			}
	} catch (err) {
		alert(err);
	}
	/*
	 * try{ $('[name="submitUpdate"]' ).val('Update'); }catch(err) { alert(err); }
	 */
}
function updateItemDetails()
{
	var ItemnameUpd = $('[name="ItemnameUpd"]').val();
	var BuyUpd = $('[name="BuyUpd"]').val();
	var DescriptionUpd = $('[name="DescriptionUpd"]').val();
	var PerPriceUpd = $('[name="PerPriceUpd"]').val();
	var itemIdUpd  = $('[name="itemIdUpd"]').val();

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

	xmlhttpItem.open("GET", "/shop/updateItemDetails?ItemnameUpd=" + ItemnameUpd+"&BuyUpd="+BuyUpd+"&DescriptionUpd="+DescriptionUpd+"&PerPriceUpd="+PerPriceUpd+"&itemIdUpd="+itemIdUpd, true);
	xmlhttpItem.send();
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
