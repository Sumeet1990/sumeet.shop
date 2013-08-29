package sumeet.shop.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import sumeet.shop.beans.Customer;

@Controller
public class LoginController {

	Logger logger = Logger.getLogger(LoginController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String check(ModelMap map) {

		logger.info("Login page");
		System.out.print("Entered into main  spring");
		// map.addAttribute("customer", new Customer());
		return "login";

	}

	@RequestMapping(value = "/validate", method = RequestMethod.POST)
	public String validateUser(@RequestParam("username") String userName,
			@RequestParam("password") String password, ModelMap map) {
		System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
				+ userName);

		if (true/* userName.trim().equals("admin") && password.equals("admin") */) {
			Customer cust = new Customer();
			map.addAttribute("Username", userName);
			return "SessionValidation";
		} else {
			if (userName.trim().equals("admin"))
				map.addAttribute("Error", "Password is incorrect");
			else
				map.addAttribute("Error",
						"Username and password are invalid please try again");
			return "login";
		}

	}

	@RequestMapping(value = "/jsp/validationSucess", method = RequestMethod.GET)
	public String validationSucess(HttpSession session, ModelMap map) {
		String status = (String) session.getAttribute((String) session
				.getAttribute("Username"));
		if (status != null && status.equals("logIn")) {
			return "main-welcome";
		} else {
			return "sendTologin";
		}
	}

	@RequestMapping(value = "/jsp/registerUser", method = RequestMethod.GET)
	public String registerUser(@RequestParam("username") String userName,
			@RequestParam("password") String password, ModelMap map) {

		System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
				+ userName);
		return "login";

	}

	@RequestMapping(value = "/jsp/sendPassword", method = RequestMethod.GET)
	public String sendPassword(ModelMap map) {

		System.out
				.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Send password");
		return "password-sent";

	}

}
