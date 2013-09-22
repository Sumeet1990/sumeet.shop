package sumeet.shop.datamodel;

import java.math.BigDecimal;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;

public class DatabaseController {

	private static JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public static void chekDB()
	{
		jdbcTemplate.queryForInt("select count(*) from user_details");
	}
	
	public static int insertUser(UserDetails user)
	{
		String getOwnrId = "select OWNR_SEQ_ID.nextval from dual";
		user.setOwner_id(jdbcTemplate.queryForInt(getOwnrId));
		String sql = "insert into user_details(name, address, company, contact_no, email, owner_id, password, user_name) values (?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] values = {user.getName(),user.getAddress(),user.getCompany(),user.getContact_no(),user.getEmail(),user.getOwner_id(),user.getPassword(),user.getUser_name()};
		
		return jdbcTemplate.update(sql, values);
		
	}

	public static String getPassFruser(String userName) {
		String sql = "select password from user_details where user_name = ?";
		String pass;
		try{
		 pass = jdbcTemplate.queryForObject(sql,new Object[]{userName} ,String.class);
		 
		}catch (Exception e)
		{
			return "no user";
		}
		return pass;
	}
	
	public static int insertItem( ItemDetails item)
	{
		String getItemId = "select ITEM_SEQ_ID.nextval from dual";
		item.setItem_id(jdbcTemplate.queryForInt(getItemId));
		item.setDate(new java.util.Date());
		String sql = "insert into item_details( item_id,  item_name, item_desc, buy, sale, ADDED_DATE ) values (?, ?, ?, ?, ?, ?)";
		
		Object[] args = {item.getItem_id(),item.getItem_name(),item.getItem_desc(),item.getBuy(),item.getSale(),item.getDate()};
		
		return jdbcTemplate.update(sql, args );
	}

	public static int insertCustomer(CustomerAccounts custAcc) {

		String getAccId = "select CUST_ACC_SEQ_ID.nextval from dual";
		custAcc.setCust_id(jdbcTemplate.queryForInt(getAccId));
		custAcc.setDate(new java.util.Date());
		String sql = "insert into customer_accounts (cust_id, cust_name, credit,contact_no, register_date) values (?,?,?,?,?)";
		
		Object[] args = {custAcc.getCust_id(),custAcc.getCust_name(), custAcc.getCredit(),custAcc.getContact_no() ,custAcc.getDate()};
		
		return jdbcTemplate.update(sql, args );
	}

	public static List<ItemDetails> getAllTheItemsLst() {
		
		String sql = "select * from item_details";
		List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);
		List<ItemDetails> itemLst = new ArrayList<ItemDetails>();
		for (Map<String, Object> row : rows) {
			ItemDetails item = new ItemDetails();
			item.setItem_id(Integer.valueOf(((BigDecimal)row.get("ITEM_ID")).toPlainString()));
			item.setItem_code((String) row.get("ITEM_CODE"));
			item.setItem_desc((String) row.get("ITEM_DESC"));
			item.setItem_name((String) row.get("ITEM_NAME"));
			item.setSale(Integer.valueOf(((BigDecimal) row.get("BUY")).toPlainString()));
			item.setBuy(Integer.valueOf(((BigDecimal) row.get("SALE")).toPlainString()));
			itemLst.add(item);
		}
		
		return itemLst;
	}
}
