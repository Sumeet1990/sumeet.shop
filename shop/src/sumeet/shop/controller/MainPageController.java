package sumeet.shop.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sumeet.shop.beans.Customer;
import sumeet.shop.beans.Item;
import sumeet.shop.datamodel.CustomerAccounts;
import sumeet.shop.datamodel.DatabaseController;
import sumeet.shop.datamodel.ItemDetails;

@Controller
public class MainPageController {
	
	HashMap<Integer, ItemDetails> searchedItemsMap = null;
	HashMap<Integer, CustomerAccounts> searchedCustomerMap = null;

	@RequestMapping(value = "/jsp/makeBill", method = RequestMethod.GET)
	public String makeBillAndUpdateRecord(HttpServletRequest request,
			ModelMap map) {
		String customerName = request.getParameter("customername");
		String phNm = request.getParameter("phonenumber");

		Customer customer = new Customer();
		customer.setCustomername(customerName);
		customer.setPhonenumber(Integer.valueOf(phNm.trim().equals("") ? "0" : phNm));

		System.out.println(">>>>>>>>>>>>>>>>>" + customerName);
		boolean moveOut = true;
		int i = 0;
		double total = 0;
		List<Item> itemLst = customer.getItemsLst();

		while (moveOut) {
			String itemCode = request.getParameter("itemCode" + i);

			if (itemCode != null) {
				Item item = new Item();
				if(!itemCode.equals(""))
				{
					item.setItemCode(itemCode);
					String priceStr = request.getParameter("price" + i);
					Double price = Double.valueOf(priceStr.replace(",", ""));
					Double quant = Double.valueOf(request
							.getParameter("quantity" + i));
					total += price * quant;
					item.setPerPrice(new BigDecimal(price).toPlainString());
					item.setQuantity(new BigDecimal(quant).toPlainString());
	
					itemLst.add(item);
				}
			} else
				moveOut = false;
			i++;
		}
		int customerId = getCustId(customer);
		map.addAttribute("total", new BigDecimal(total).toPlainString());
		map.addAttribute("billCustObj", customer);
		map.addAttribute("list", customer.getItemsLst());
		map.addAttribute("custId", customerId);
		return "printBill";
	}
	
	private int getCustId(Customer customer) {
		int value = DatabaseController.getCustomerId(customer.getCustomername(),customer.getPhonenumber());
		return value;
	}

	@RequestMapping(value = "/SearchUpdItem", method = RequestMethod.GET)
	@ResponseBody
	public String searchItem(@RequestParam("itemDesc") String itemDesc,
							@RequestParam("itemName") String itemName,
								HttpServletRequest request, ModelMap map) {

		List<ItemDetails> itemsLst = DatabaseController.getAllTheItemsLst();
		String table = "";
		int count = 1;

			searchedItemsMap = new HashMap<Integer, ItemDetails>();
			table ="<table id=\"searchtable\">"+
					"<thead>"
					+"<tr>"
					+"<th scope=\"col\">SNO</th>"
					+"<th scope=\"col\">Item Name</th>"
					+"<th scope=\"col\">Description</th>"
					+"<th scope=\"col\" style=\"width: 15%;\">Action</th>"
					+"</thead>"
					+"<tbody >";
		for(ItemDetails item : itemsLst)
		{
			String desc =  item.getItem_desc().trim() ;
			String name =  item.getItem_name().trim() ;
			itemDesc = (itemDesc.trim().equals(""))? "No item found" : itemDesc.trim() ;
			 itemName = (itemName.trim().equals(""))? "No item found" : itemName.trim() ;
			
			if(name.startsWith(itemName) || desc.startsWith(itemDesc))
			{
				table = table	+"<tr>"
								+"	<td align=\"right\">"+count+"</td>"
								+"	<td align=\"center\">"+name+"</td>"
								+"	<td align=\"center\">"+desc+"</td>"
								+"	<td align=\"right\"><input type=\"button\" onclick=\"updateRecord("+item.getItem_id()+")\" id=\"buttonAddDel\" value=\"View\"></td>"
								+"</tr>"
								+"<tr>";
				searchedItemsMap.put(item.getItem_id(), item);
				count++;
			}
		}
		
		if(count > 1 )
		{
		table = table	+"</tbody>"
						+"</table>";
		}else
		{
			table = "No item found !";
		}
		
		return table;
	}
	
	@RequestMapping(value = "/getItemDetails", method = RequestMethod.GET)
	@ResponseBody
	public ItemDetails getItemDetails(@RequestParam("itemId") String itemCode, ModelMap map) {
		
		
		return searchedItemsMap.get(Integer.valueOf(itemCode));
	
	}
	
	@RequestMapping(value = "/CustomerAccList", method = RequestMethod.GET)
	@ResponseBody
	public String searchCustomerAccount(@RequestParam("Customername") String Customername,
							@RequestParam("MobileNo") String MobileNo,
								HttpServletRequest request, ModelMap map) {

		List<CustomerAccounts> customerAcc = DatabaseController.getAllCustomers(Customername, MobileNo);
		String table = "";
		int count = 1;
		searchedCustomerMap = new HashMap<Integer, CustomerAccounts>();

			table ="<table id=\"searchtable\">"+
					"<thead>"
					+"<tr>"
					+"<th scope=\"col\">SNO</th>"
					+"<th scope=\"col\">Customer Name</th>"
					+"<th scope=\"col\">Mobile Number</th>"
					+"<th scope=\"col\" style=\"width: 15%;\">Action</th>"
					+"</thead>"
					+"<tbody >";
			
		for(CustomerAccounts customer : customerAcc)
		{
			
				table = table	+"<tr>"
						+"	<td align=\"right\">"+count+"</td>"
						+"	<td id=\"CustId"+count+"\" align=\"center\">"+customer.getCust_name()+"</td>"
						+"	<td align=\"center\">"+customer.getContact_no()+"</td>"
						+"	<td align=\"right\"><input type=\"button\" onclick=\"viewCustomerAcc("+customer.getCust_id()+")\" id=\"buttonAddDel\" value=\"View\"></td>"
						+"</tr>";
				searchedCustomerMap.put(customer.getCust_id(), customer);
				count++;
		}
		
		if(count > 1 )
		{
		table = table	+"</tbody>"
						+"</table>";
		}else
		{
			table = "No item found !";
		}
		
		return table;
	}
	
	@RequestMapping(value = "/getCustomerAccDetails", method = RequestMethod.GET)
	@ResponseBody
	public CustomerAccounts getCustomerAccDetails(@RequestParam("custIdVal") String custIdVal, ModelMap map) {
		
		
		CustomerAccounts customer = searchedCustomerMap.get(Integer.valueOf(custIdVal));
		
		return customer;
	
	}
	
	@RequestMapping(value = "/getCustomerAccStatement", method = RequestMethod.GET)
	@ResponseBody
	public String getCustomerAccStatement(@RequestParam("custId") String custId,
								HttpServletRequest request, ModelMap map) {

		CustomerAccounts customer = searchedCustomerMap.get(custId);
		
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
				+"<tr style=\"background-color: lightgreen;\">"
				+"	<td style=\"background: none repeat scroll 0% 0% transparent;\">-</td>"
				+"	<td style=\"background: none repeat scroll 0% 0% transparent;\" align=\"center\" style=\"color: darkgreen;\" >Payment's made</td>"
				+"	<td style=\"background: none repeat scroll 0% 0% transparent;\">-</td>"
				+"	<td style=\"background: none repeat scroll 0% 0% transparent;\">-</td>"
				+"</tr>"
				+Paid
				+"<tr style=\"background-color: pink;\">"
				+"	<td style=\"background: none repeat scroll 0% 0% transparent;\">-</td>"
				+"	<td style=\"background: none repeat scroll 0% 0% transparent;\" align=\"center\" style=\"color: red;\" >Credit left</td>"
				+"	<td style=\"background: none repeat scroll 0% 0% transparent;\">-</td>"
				+"	<td style=\"background: none repeat scroll 0% 0% transparent;\">-</td>"
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
	
	@RequestMapping(value = "/jsp/addItem", method = RequestMethod.GET)
	@ResponseBody
	public String saveItemDetails(@ModelAttribute("addItemObj") ItemDetails itemDtls, ModelMap map) {

		DatabaseController.insertItem(itemDtls );
		
		return "Saved sucessfully !";
	
	}
	
	@RequestMapping(value = "/jsp/addCustomer", method = RequestMethod.GET)
	@ResponseBody
	public String saveCustomerDetails(@ModelAttribute("saveCustomerObj") CustomerAccounts custAcc, ModelMap map) {

		DatabaseController.insertCustomer(custAcc );
		
		return "Saved sucessfully !";
	
	}
	@RequestMapping(value = "/jsp/payCredit", method = RequestMethod.GET)
	@ResponseBody
	public String payCredit(@RequestParam("custId") Integer custId ,@RequestParam("createStatus") boolean createStatus, @RequestParam("custName") String custName ,@RequestParam("phoneNumber") Integer phoneNumber , @RequestParam("totalamt") Integer totalamt  ,ModelMap map) {

		CustomerAccounts custAcc = new CustomerAccounts();
		custAcc.setContact_no(phoneNumber);
		custAcc.setCust_name(custName);
		custAcc.setCredit(totalamt);
		custAcc.setTrans_type_id(1);
		
		if(createStatus)
		{
		 custId = DatabaseController.insertCustomer(custAcc );
		}
		int stst = DatabaseController.makeBillingEntry( totalamt, custId,  0, 0 ,0,  1 );
		
		return stst+"";
	
	}
}
