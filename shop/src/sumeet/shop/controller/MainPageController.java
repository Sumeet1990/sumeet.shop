package sumeet.shop.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sumeet.shop.beans.Customer;
import sumeet.shop.beans.Item;

@Controller
public class MainPageController {

	@RequestMapping(value="/makeBill", method=RequestMethod.GET)
	public String makeBillAndUpdateRecord(HttpServletRequest request, ModelMap map)
	{
		String customerName = request.getParameter("customername");
		String phNm = request.getParameter("phonenumber");
		
		Customer customer = new Customer();
		customer.setCustomername(customerName);
		customer.setPhonenumber(Integer.valueOf(phNm));
		
		System.out.println(">>>>>>>>>>>>>>>>>"+customerName );
		boolean moveOut = true;
		int i = 0;
		List<Item> itemLst = customer.getItemsLst();
		
		while (moveOut) {
			String itemCode = request.getParameter("itemCode"+i);
			
			if(itemCode != null)
			{
				Item item = new Item();
				item.setItemCode(itemCode);
				item.setPerPrice(Integer.valueOf(request.getParameter("quantity"+i)));
				item.setQuantity(Integer.valueOf(request.getParameter("price"+i)));
	
				itemLst.add(item);
			}
			else
				moveOut = false;
			i++;
		}
		
		map.addAttribute("billCustObj", customer);
		return "bill";
	}
}
