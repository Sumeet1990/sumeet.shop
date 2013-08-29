<%
HttpSession sessionUsr = request.getSession();
sessionUsr.invalidate();/* setAttribute((String)sessionUsr.getAttribute("Username"), "signOut"); */
response.sendRedirect("/shop/");
%>