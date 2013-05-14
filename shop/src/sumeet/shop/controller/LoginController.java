package sumeet.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	@RequestMapping(value="/", method=RequestMethod.GET )
	public String check(ModelMap map)
	{
		
		System.out.print("Emtered into main  spring");
		return "login";
		
	}
	
	@RequestMapping(value="/validate", method=RequestMethod.GET )
	public String validateUser(@RequestParam("username") String userName,@RequestParam("password") String password,ModelMap map)
	{
		
		System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+userName);
		return "login";
		
	}
	
	@RequestMapping(value="/registerUser", method=RequestMethod.GET )
	public String registerUser(@RequestParam("username") String userName,@RequestParam("password") String password,ModelMap map)
	{
		
		System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+userName);
		return "login";
		
	}
	
}
