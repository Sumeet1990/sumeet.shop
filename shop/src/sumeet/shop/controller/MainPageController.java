package sumeet.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainPageController {

	@RequestMapping(value="/makeBill", method=RequestMethod.POST)
	public String makeBillAndUpdateRecord(ModelAndView view)
	{
		return "";
	}
}
