package sumeet.shop.datamodel;

import java.util.Date;

public class CustomerAccounts {
	Integer cust_id;
	String cust_name;
	Integer contact_no;
	Integer trans_type_id;
	Date date;
	public Integer getCust_id() {
		return cust_id;
	}
	public void setCust_id(Integer cust_id) {
		this.cust_id = cust_id;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public Integer getContact_no() {
		return contact_no;
	}
	public void setContact_no(Integer contact_no) {
		this.contact_no = contact_no;
	}
	public Integer getTrans_type_id() {
		return trans_type_id;
	}
	public void setTrans_type_id(Integer trans_type_id) {
		this.trans_type_id = trans_type_id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

}
