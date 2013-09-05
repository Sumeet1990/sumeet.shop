package sumeet.shop.controller;

import java.util.Date;
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
				+"<th scope=\"col\" style=\"width: 15%;\">Action</th>"
				+"</thead>"
				+"<tbody >"
				+"<tr>"
				+"	<td align=\"right\">"+count+"</td>"
				+"	<td id=\"itemCode"+count+"\" align=\"center\">"+itemCode+"</td>"
				+"	<td align=\"center\">"+itemDesc+"</td>"
				+"	<td align=\"center\">"+itemName+"</td>"
				+"	<td align=\"right\"><input type=\"button\" onclick=\"updateRecord("+count+")\" id=\"buttonAddDel\" value=\"View\"></td>"
				+"</tr>"
				+"<tr>"
				+"	<td align=\"right\">"+2+"</td>"
				+"	<td id=\"itemCode"+2+"\" align=\"center\">"+itemCode+"2</td>"
				+"	<td align=\"center\">"+itemDesc+"2</td>"
				+"	<td align=\"center\" >"+itemName+"2</td>"
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
	
	@RequestMapping(value = "/CustomerAccList", method = RequestMethod.GET)
	@ResponseBody
	public String searchCustomerAccount(@RequestParam("Customername") String Customername,
							@RequestParam("MobileNo") String MobileNo,
								HttpServletRequest request, ModelMap map) {

		int count =1;
		String table ="<table id=\"searchtable\">"+
				"<thead>"
				+"<tr>"
				+"<th scope=\"col\">SNO</th>"
				+"<th scope=\"col\">Customer Name</th>"
				+"<th scope=\"col\">Mobile Number</th>"
				+"<th scope=\"col\" style=\"width: 15%;\">Action</th>"
				+"</thead>"
				+"<tbody >"
				+"<tr>"
				+"	<td align=\"right\">"+count+"</td>"
				+"	<td id=\"CustId"+count+"\" align=\"center\">"+Customername+"</td>"
				+"	<td align=\"center\">"+MobileNo+"</td>"
				+"	<td align=\"right\"><input type=\"button\" onclick=\"viewCustomerAcc("+count+")\" id=\"buttonAddDel\" value=\"View\"></td>"
				+"</tr>"
				+"<tr>"
				+"	<td align=\"right\">"+2+"</td>"
				+"	<td id=\"CustId"+2+"\" align=\"center\">"+Customername+"2</td>"
				+"	<td align=\"center\">"+MobileNo+"2</td>"
				+"	<td align=\"right\"><input type=\"button\" onclick=\"viewCustomerAcc("+2+")\" id=\"buttonAddDel\" value=\"View\"></td>"
				+"</tr>"
				+"</tbody>"
				+"</table>";
		
		return table;
	}
	
	@RequestMapping(value = "/getCustomerAccDetails", method = RequestMethod.GET)
	@ResponseBody
	public String getCustomerAccDetails(@RequestParam("custIdVal") String custIdVal, ModelMap map) {
		return custIdVal;
	
	}
	
	@RequestMapping(value = "/getCustomerAccStatement", method = RequestMethod.GET)
	@ResponseBody
	public String getCustomerAccStatement(@RequestParam("custId") String custId,
								HttpServletRequest request, ModelMap map) {

		int count =1;
		String credit = "<tr>"
				+"	<td align=\"right\">"+2+"</td>"
				+"	<td id=\"CustId"+2+"\" align=\"center\">"+new Date()+"2</td>"
				+"	<td align=\"center\">-</td>"
				+"	<td align=\"right\">342</td>"
				+"</tr>";
		String Paid = "<tr>"
				+"	<td align=\"right\">"+2+"</td>"
				+"	<td id=\"CustId"+2+"\" align=\"center\">"+new Date()+"2</td>"
				+"	<td align=\"center\">-</td>"
				+"	<td align=\"right\">342</td>"
				+"</tr>";
		String table ="<table id=\"searchtable\" style=\"width: 140%;\">"+
				"<thead>"
				+"<tr>"
				+"<th scope=\"col\">SNO</th>"
				+"<th scope=\"col\">Date</th>"
				+"<th scope=\"col\">Item Details</th>"
				+"<th scope=\"col\">Amount</th>"
				+"</thead>"
				+"<tbody >"
				+"<tr>"
				+"	<td align=\"right\">"+count+"</td>"
				+"	<td id=\"CustId"+count+"\" align=\"center\">"+new Date()+"</td>"
				+"	<td align=\"center\">Item Details</td>"
				+"	<td align=\"right\">123</td>"
				+"</tr>"
				+"<tr>"
				+"	<td align=\"right\">"+2+"</td>"
				+"	<td id=\"CustId"+2+"\" align=\"center\">"+new Date()+"2</td>"
				+"	<td align=\"center\">ItemDetails2</td>"
				+"	<td align=\"right\">342</td>"
				+"</tr>"
				+"<tr>"
				+"	<td>-</td>"
				+"	<td align=\"center\" style=\"color: darkgreen;\" >Paid</td>"
				+"	<td>-</td>"
				+"	<td>-</td>"
				+"</tr>"
				+Paid
				+"<tr>"
				+"	<td>-</td>"
				+"	<td align=\"center\" style=\"color: red;\" >Credit</td>"
				+"	<td>-</td>"
				+"	<td >-</td>"
				+"</tr>"
				+credit
				+"</tbody>"
				+"</table>"
				+"<table id=\"searchtable\" style=\"width: 140%;\">"
				+"</tbody>"
				+"<tr>"
				+"	<td style=\"width: 100%;\"></td>"
				+"	<td></td>"
				+"<td align=\"right\"><input type=\"button\" name=\"payAmount\" onclick=\"payCreditAmount()\"  id=\"buttonAddDel\" value=\"Pay\"></td>"
				+"<td> <input type=\"button\"  id=\"buttonAddDel\"  onclick=\"printCustomerAccStmt()\"  value=\"Print\"></td>"
				+"</tr>"
				+"</tbody>"
				+"</tbody>";
		
		return table;
	}
}
