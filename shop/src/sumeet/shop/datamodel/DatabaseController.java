package sumeet.shop.datamodel;

import java.math.BigDecimal;
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
		
		Object[] args = {item.getItem_id(),item.getItem_name().toUpperCase(),item.getItem_desc().toUpperCase(),item.getBuy(),item.getSale(),item.getDate()};
		
		return jdbcTemplate.update(sql, args );
	}

	public static int insertCustomer(CustomerAccounts custAcc) {

		String getAccId = "select CUST_ACC_SEQ_ID.nextval from dual";
		custAcc.setCust_id(jdbcTemplate.queryForInt(getAccId));
		custAcc.setDate(new java.util.Date());
		String sql = "insert into customer_accounts (cust_id, cust_name, credit,contact_no, register_date,TRANS_TYPE_ID) values (?,?,?,?,?,?)";
		
		Object[] args = {custAcc.getCust_id(),custAcc.getCust_name(), custAcc.getCredit(),custAcc.getContact_no() ,custAcc.getDate(),custAcc.getTrans_type_id()
				};
		
		jdbcTemplate.update(sql, args );
		return custAcc.getCust_id();
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
			//item.setDate((String) row.get("ADDED_DATE"));
			item.setSale(Integer.valueOf(((BigDecimal) row.get("BUY")).toPlainString()));
			item.setBuy(Integer.valueOf(((BigDecimal) row.get("SALE")).toPlainString()));
			itemLst.add(item);
		}
		
		return itemLst;
	}

	public static int getCustomerId(String customername, String phonenumber) {
		
		String sql = "select cust_id from customer_accounts where contact_no = ? and cust_name = ? ";
		Object[] values = {phonenumber,customername};
		try{
			return jdbcTemplate.queryForInt(sql,values);
		}catch (Exception e)
		{
			return -1;
		}
	}

	public static int makeBillingEntry(Integer totalamt, Integer custId, Integer discount, String itemCode , String quantiy, Integer transType) {
		String billId = "select BILL_ID_SEQ.nextval from dual";
		int billIdVal = jdbcTemplate.queryForInt(billId);
		String sql = "insert into billing_entry(bill_id, cust_id, discount, ITEM_DESC, quantity, total_amount, trans_type_id) values (?,?,?,?,?,?,?)";
		Object[] values = {billIdVal,custId,discount,itemCode,quantiy,totalamt,transType};
		try{
			return jdbcTemplate.update(sql,values);
		}catch (Exception e)
		{
			org.apache.log4j.Logger.getLogger(DatabaseController.class).error(e);
			return -1;
		}
	}

	public static List<CustomerAccounts> getAllCustomers(String customername, String mobileNo) {
		
		String whereClause = "";
		
		if(customername != null && !customername.trim().equals(""))
		{
			whereClause = "cust_name like '%"+customername+"%' "; 
		}else
		{
			whereClause ="contact_no = "+mobileNo;
		}
		

		String sql = "select * from customer_accounts where "+whereClause;

		List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);
		List<CustomerAccounts> custLst = new ArrayList<CustomerAccounts>();
		for (Map<String, Object> row : rows) {
			CustomerAccounts cust = new CustomerAccounts();
			cust.setCust_id(Integer.valueOf(((BigDecimal) row.get("CUST_ID")).toPlainString()));
			cust.setCust_name((String)row.get("CUST_NAME"));
			cust.setContact_no((String)row.get("CONTACT_NO"));
			cust.setCredit(Integer.valueOf(((BigDecimal) row.get("CREDIT")).toPlainString()));
			cust.setDate((String)row.get("REGISTER_DATE"));
			cust.setTrans_type_id(Integer.valueOf(((BigDecimal) row.get("TRANS_TYPE_ID")).toPlainString()));
			custLst.add(cust);
		}
		return custLst;
	}

	public static String getCustomerStmt(String custId) {
		
		String sql = "select get_cust_stmt_dtils_fn(?) from dual";
		Object[] values = {Integer.valueOf(custId)};
		String table = jdbcTemplate.queryForObject(sql,values, String.class);
		
		return table;
		
	}

	public static String updateItemDetails(Integer itemIdUpd,
			String itemnameUpd, Integer buyUpd, String perPriceUpd,
			String descriptionUpd) {

		String sql = "UPDATE ITEM_DETAILS SET ITEM_DESC = ? , item_name= ? , buy = ?,  sale = ? where item_id = ? ";
		Object[] values = {descriptionUpd,itemnameUpd,buyUpd,perPriceUpd,itemIdUpd};
		
		int status =  jdbcTemplate.update(sql, values);
		
		return "Updated--"+status;
	}

	public static String updateCustomerDetails(String custUpdId,
			String custNameUpd, String mobileNoUpd, Long creditUpd) {
		
		String sql = "UPDATE CUSTOMER_ACCOUNTS SET CUST_NAME = ?, CONTACT_NO = ? , credit = ? WHERE cust_id = ?";
		Object[] values = {custNameUpd,mobileNoUpd,creditUpd,custUpdId};
		
		int status =  jdbcTemplate.update(sql, values);
		
		return "Updated--"+status;
	}
}
