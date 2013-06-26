<%
String user = (String)request.getAttribute("Username");
if(session.getAttribute(user) == null)
{
	response.sendRedirect("${pageContext.request.contextPath}/jsp/PageNotFound.jsp");
	}

%>