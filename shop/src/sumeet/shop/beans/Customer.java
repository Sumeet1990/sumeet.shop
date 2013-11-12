package sumeet.shop.beans;

import java.util.ArrayList;
import java.util.List;

import sumeet.shop.datamodel.ItemDetails;

public class Customer {
	String customername;
	String phonenumber;
	List<Item> itemsLst;

	public Customer() {
		itemsLst = new ArrayList<Item>();
	}

	public List<Item> getItemsLst() {
		return itemsLst;
	}

	public void setItemsLst(List<Item> itemsLst) {
		this.itemsLst = itemsLst;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

}
