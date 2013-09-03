package sumeet.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sumeet.shop.beans.Customer;
import sumeet.shop.beans.Item;

@Controller
public class MainPageController {

	@RequestMapping(value = "/jsp/makeBill", method = RequestMethod.GET)
	public String makeBillAndUpdateRecord(HttpServletRequest request,
			ModelMap map) {
		String customerName = request.getParameter("customername");
		String phNm = request.getParameter("phonenumber");

		Customer customer = new Customer();
		customer.setCustomername(customerName);
		customer.setPhonenumber(Integer.valueOf(phNm));

		System.out.println(">>>>>>>>>>>>>>>>>" + customerName);
		boolean moveOut = true;
		int i = 0;
		double total = 0;
		List<Item> itemLst = customer.getItemsLst();

		while (moveOut) {
			String itemCode = request.getParameter("itemCode" + i);

			if (itemCode != null) {
				Item item = new Item();
				item.setItemCode(itemCode.equals("") ? "No item selected" : itemCode);
				Double price = Double.valueOf(request.getParameter("price" + i));
				Double quant = Double.valueOf(request
						.getParameter("quantity" + i));
				total += price * quant;
				item.setPerPrice(price);
				item.setQuantity(quant);

				itemLst.add(item);
			} else
				moveOut = false;
			i++;
		}
		map.addAttribute("total", total);
		map.addAttribute("billCustObj", customer);
		map.addAttribute("list", customer.getItemsLst());
		return "printBill";
	}
	
	@RequestMapping(value = "/SearchUpdItem", method = RequestMethod.GET)
	@ResponseBody
	public String searchItem(@RequestParam("itemCd") String itemCode,
							@RequestParam("itemDesc") String itemDesc,
							@RequestParam("itemName") String itemName,
								HttpServletRequest request, ModelMap map) {

		int count =1;
		String table ="<table id=\"searchtable\">"+
				"<thead>"
				+"<tr>"
				+"<th scope=\"col\">SNO</th>"
				+"<th scope=\"col\">Item Code&nbsp;</th>"
				+"<th scope=\"col\">Description</th>"
				+"<th scope=\"col\">Item Name</th>"
				+"<th scope=\"col\">Action</th>"
				+"</thead>"
				+"<tbody >"
				+"<tr>"
				+"	<td align=\"right\">"+count+"</td>"
				+"	<td id=\"itemCode"+count+"\">"+itemCode+"</td>"
				+"	<td >"+itemDesc+"</td>"
				+"	<td >"+itemName+"</td>"
				+"	<td align=\"right\"><input type=\"button\" onclick=\"updateRecord("+count+")\" id=\"buttonAddDel\" value=\"View\"></td>"
				+"</tr>"
				+"<tr>"
				+"	<td align=\"right\">"+2+"</td>"
				+"	<td id=\"itemCode"+2+"\">"+itemCode+"2</td>"
				+"	<td >"+itemDesc+"2</td>"
				+"	<td >"+itemName+"2</td>"
				+"	<td align=\"right\"><input type=\"button\" onclick=\"updateRecord("+2+")\" id=\"buttonAddDel\" value=\"View\"></td>"
				+"</tr>"
				+"</tbody>"
				+"</table>";
		
		return table;
	}
	
	@RequestMapping(value = "/getItemDetails", method = RequestMethod.GET)
	@ResponseBody
	public String getItemDetails(@RequestParam("itemCd") String itemCode, ModelMap map) {
		return itemCode;
	
	}
}
