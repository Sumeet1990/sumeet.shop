<%
String user = (String)request.getAttribute("Username");
HttpSession sess = (HttpSession)session.getAttribute(user);
sess.invalidate();
response.sendRedirect("${pageContext.request.contextPath}");
%>