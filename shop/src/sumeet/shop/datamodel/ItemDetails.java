package sumeet.shop.datamodel;

import java.util.Date;

public class ItemDetails {
	
	Integer item_id;
	String item_name;
	String item_desc;
	Integer buy;
	Integer sale;
	Date date;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

}
