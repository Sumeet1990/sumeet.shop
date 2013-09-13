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