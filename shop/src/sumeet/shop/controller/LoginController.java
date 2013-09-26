package sumeet.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sumeet.shop.beans.Customer;
import sumeet.shop.datamodel.DatabaseController;
import sumeet.shop.datamodel.ItemDetails;
import sumeet.shop.datamodel.UserDetails;

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
			@RequestParam("password") String password,HttpSession session, ModelMap map) {
		System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
				+ userName);
		String passwordDB = DatabaseController.getPassFruser(userName);

		if (passwordDB.equals(password)) {
			map.addAttribute("Username", userName);
			return "SessionValidation";
		} else if(passwordDB.equals("no user")){

				map.addAttribute("Error","Username and password are invalid please try again");
				return "login";
		} else
		{
			map.addAttribute("Error", "Password is incorrect");
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

	@RequestMapping(value = "/jsp/registerUser", method = RequestMethod.POST)
	public String registerUser(@ModelAttribute("userDetails") UserDetails user,@RequestParam("user_name") String userName,
			@RequestParam("password") String password,HttpSession session, ModelMap map) {

		
		int val = DatabaseController.insertUser(user);
		logger.info("-------Insert Status----------------"+val);
		map.addAttribute("Username", userName);
		return "SessionValidation";

	}

	@RequestMapping(value = "/jsp/sendPassword", method = RequestMethod.GET)
	public String sendPassword(ModelMap map) {

		System.out
				.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Send password");
		return "password-sent";

	}
	@RequestMapping(value = "/jsp/getItemsList", method = RequestMethod.GET)
	@ResponseBody
	public List<ItemDetails> getItemsList(HttpSession session,ModelMap map) {

		List<ItemDetails> itemLst = new ArrayList<ItemDetails>();
		
		itemLst = DatabaseController.getAllTheItemsLst();
		
		return itemLst;

	}
}
