
<%
	HttpSession sessionUser = request.getSession();
	String userReq = (String) request.getAttribute("Username");
	String userSes = (String) sessionUser.getAttribute("Username");

	if (userSes != null && userReq.equals(userSes)) {
		String status = (String) sessionUser.getAttribute(userSes);
		if (status.equals("logIn")) {
			sessionUser.setAttribute("loadItems","1");
			response.sendRedirect("/shop/jsp/validationSucess");
		}/* else
			{
			sessionUser.invalidate();
			response.sendRedirect("/shop/");
			} */

	} else {
		sessionUser.setAttribute("Username", userReq);
		sessionUser.setAttribute(userReq, "logIn");
		response.sendRedirect("/shop/jsp/validationSucess");

	}
%>