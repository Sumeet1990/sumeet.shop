package sumeet.shop.beans;

public class Item {

	String itemCode;
	Integer perPrice;
	Integer quantity;
	
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public Integer getPerPrice() {
		return perPrice;
	}
	public void setPerPrice(Integer perPrice) {
		this.perPrice = perPrice;
	}
	
}
