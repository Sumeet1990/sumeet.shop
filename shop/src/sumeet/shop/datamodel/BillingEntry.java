package sumeet.shop.datamodel;

public class BillingEntry {
	Integer bill_id;
	Integer cust_id;
	Integer item_id;
	Integer quantity;
	Integer total_amount;
	Integer discount;
	Integer trans_type_id;
	
	public Integer getBill_id() {
		return bill_id;
	}
	public void setBill_id(Integer bill_id) {
		this.bill_id = bill_id;
	}
	public Integer getCust_id() {
		return cust_id;
	}
	public void setCust_id(Integer cust_id) {
		this.cust_id = cust_id;
	}
	public Integer getItem_id() {
		return item_id;
	}
	public void setItem_id(Integer item_id) {
		this.item_id = item_id;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(Integer total_amount) {
		this.total_amount = total_amount;
	}
	public Integer getDiscount() {
		return discount;
	}
	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
	public Integer getTrans_type_id() {
		return trans_type_id;
	}
	public void setTrans_type_id(Integer trans_type_id) {
		this.trans_type_id = trans_type_id;
	}


}
