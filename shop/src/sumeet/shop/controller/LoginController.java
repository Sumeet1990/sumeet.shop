package sumeet.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@RequestMapping(value="/", method=RequestMethod.GET )
	public String check(ModelMap map)
	{
		
		System.out.print("Entered into main  spring");
		return "login";
		
	}
	
	@RequestMapping(value="/validate", method=RequestMethod.POST )
	public ModelAndView validateUser(@RequestParam("username") String userName,@RequestParam("password") String password,ModelMap map)
	{
		System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+userName);
		ModelAndView view = new ModelAndView();
		if(userName.trim().equals("admin") && password.equals("admin"))
		{
			view.setViewName("main-welcome");
			view.addObject("Username",userName);
			return view;
		}
		else
		{
			view.setViewName("login");
			if(userName.trim().equals("admin"))
				view.addObject("Error", "Password is incorrect");
			else
				view.addObject("Error", "Username and password are invalid please try again");
			return view;
		}
		
	}
	
	@RequestMapping(value="/jsp/registerUser", method=RequestMethod.GET )
	public String registerUser(@RequestParam("username") String userName,@RequestParam("password") String password,ModelMap map)
	{
		
		System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+userName);
		return "login";
		
	}
	
	@RequestMapping(value="/jsp/sendPassword", method=RequestMethod.GET )
	public String sendPassword(ModelMap map)
	{
		
		System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Send password");
		return "password-sent";
		
	}
	
}
