<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@page import="java.util.Date"%>
<html dir="ltr" lang="en">
<head>
<%  
response.setHeader("Pragma","no-cache");  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Expires","0");  
response.setDateHeader("Expires",-1);  
%> 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
	<title>Main</title>
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/domtab.css" type="text/css">
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/searchContainer.css" type="text/css">
	
<!--[if gt IE 6]>
	<style type="text/css">
		html>body ul.domtabs a:link,
		html>body ul.domtabs a:visited,
		html>body ul.domtabs a:active,
		html>body ul.domtabs a:hover{
			height:3em;
		}
	</style>
<![endif]-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/domtab.js"></script>
	<script type="text/javascript">
		function startTime()
		{
		var today=new Date();

	    var curr_year = today.toDateString();
		var h=today.getHours();
		var m=today.getMinutes();
		var s=today.getSeconds();
		// add a zero in front of numbers<10
		m=checkTime(m);
		s=checkTime(s);
		document.getElementById('top1').innerHTML=curr_year+"  "+"   "+h+":"+m+":"+s;
		t=setTimeout(function(){startTime()},500);
		}
	
		function checkTime(i)
		{
		if (i<10)
		  {
		  i="0" + i;
		  }
		return i;
		}
		
		 function addRow(tableID) {
			 
	            var table = document.getElementById(tableID);
	 
	            var rowCount = table.rows.length;
	            var row = table.insertRow(rowCount);
	 
	            var cell1 = row.insertCell(0);
	            var element1 = document.createElement("input");
	            element1.type = "checkbox";
	            element1.name="chkbox[]";
	            cell1.appendChild(element1);
	 
	            var cell2 = row.insertCell(1);
	            cell2.innerHTML ='<input type="text" name="txtbox[]" id="tableInputs" size="30"/>';

	            var cell3 = row.insertCell(2);
	            cell3.innerHTML ='<input type="text" name="txtbox[]" id="quantityTab" size="30"/>';
	 
	 
	        }
	 
	        function deleteRow(tableID) {
	            try {
	            var table = document.getElementById(tableID);
	            var rowCount = table.rows.length;
	 
	            for(var i=0; i<rowCount; i++) {
	                var row = table.rows[i];
	                var chkbox = row.cells[0].childNodes[0];
	                if(null != chkbox && true == chkbox.checked) {
	                    table.deleteRow(i);
	                    rowCount--;
	                    i--;
	                }
	 
	 
	            }
	            }catch(e) {
	                alert(e);
	            }
	        }
	        
		document.write('<style type="text/css">');    
		document.write('div.domtab div{display:none;}<');
		document.write('/s'+'tyle>');    
    </script>
</head>
<body onload="startTime()">

<h1 style="text-align:center;"><a name="top" id="top">Wellcome <%= request.getAttribute("Username") %>,  Have a great day!!! </a></h1>
<h1  style="text-align:right;"><a name="top" id="top1"></a></h1>
<p id="domtabprintview"></p>
<div id="other" class="domtab doprevnext">
	<ul class="domtabs">
		<li><a href="#billing">Billing</a></li>
		<li><a href="#accounts">Accounts</a></li>
		<li><a href="#materialentry">Material Entry</a></li>
	</ul>
	<div>
		<h2><a name="billing" id="billing">Billing</a></h2>
		<form action="validate" method="GET">
		
		      <input id="inputs" name="customername" type="text" placeholder="Customer Name" autofocus required><br>
		      <input id="inputs" name="phonenumber" type="text" placeholder="Phone Number" ><br>
		      <INPUT id="buttonAddDel" type="button" value="Add Row" onclick="addRow('background-image')" />&nbsp;&nbsp; 
    		<INPUT id="buttonAddDel" type="button" value="Delete Row" onclick="deleteRow('background-image')" />   
		     <br/>
<table id="background-image" summary="Meeting Results">
    <thead>
    	<tr>
        	<th scope="col">Item Description</th>
            <th scope="col">Quantity</th>
            <th scope="col">Price</th>
        </tr>
    </thead>
</table>
		    <fieldset id="actions">
		        <input type="submit" id="submit" value="Done">&nbsp;&nbsp;
		        <input type="button" id="submit" value="Print">
		    </fieldset>
		</form>
	</div>
	<div>
		<h2><a name="accounts" id="accounts">How to use DOMtab</a></h2>
		<form class="search" method="post" action="index.html">
      <input type="search" name="q" placeholder="Search..." autocomplete="off">
      <ul class="search-ac">
        <li><a href="index.html">Search Result #1<br><span>Description...</span></a></li>
        <li><a href="index.html">Search Result #2<br><span>Description...</span></a></li>
        <li><a href="index.html">Search Result #3<br><span>Description...</span></a></li>
        <li><a href="index.html">Search Result #4</a></li>
      </ul>
    </form>
  </section>
  <br/>
	</div>
	<div>
		<h2><a name="materialentry" id="materialentry">Material Entry</a></h2>
	</div>

	<!-- <div id="other" class="domtab doprevnext">
	<ul class="domtabs">
		<li><a href="#t1">Test 1</a></li>
		<li><a href="#t2">Test 2</a></li>
		<li><a href="#t3">Test 3</a></li>
		<li><a href="#t4">Test 4</a></li>
	</ul>
	<h2>You can use content in between the tabs and the sections</h2>
	<div>
		<h2><a name="t1" id="t1">Proof 1</a></h2>
		<p>Test to prove that more than one menu is possible</p>
		<p><a href="#top">back to menu</a></p>
	</div>
	<div>
		<h2><a name="t2" id="t2">Proof 2</a></h2>
		<p>Test to prove that more than one menu is possible</p>
		<p><a href="#top">back to menu</a></p>
	</div>
	<div>
		<h2><a name="t3" id="t3">Proof 3</a></h2>
		<p>Test to prove that more than one menu is possible</p>
		<p><a href="#top">back to menu</a></p>
	</div>
	<div>
		<h2><a name="t4" id="t4">Proof 4</a></h2>
		<p>Test to prove that more than one menu is possible</p>
		<p><a href="#top">back to menu</a></p>
	</div>
</div> -->
</div>
</body>
</html>
