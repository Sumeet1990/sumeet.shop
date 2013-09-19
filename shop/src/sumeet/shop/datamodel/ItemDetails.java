package sumeet.shop.datamodel;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ItemDetails {
	
	Integer item_id;
	String item_name;
	String item_desc;
	String item_code;
	Integer buy;
	Integer sale;
	String date;
	public Integer getItem_id() {
		return item_id;
	}
	public void setItem_id(Integer item_id) {
		this.item_id = item_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_desc() {
		return item_desc;
	}
	public void setItem_desc(String item_desc) {
		this.item_desc = item_desc;
	}
	public Integer getBuy() {
		return buy;
	}
	public void setBuy(Integer buy) {
		this.buy = buy;
	}
	public Integer getSale() {
		return sale;
	}
	public void setSale(Integer sale) {
		this.sale = sale;
	}
	public String getDate() {
		return date;
	}
	public void setDate(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("EEE-MMM-dd-yyyy hh:mm");
		this.date = format.format(date);
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
}
