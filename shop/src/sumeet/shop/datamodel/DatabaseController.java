package sumeet.shop.datamodel;

import java.sql.Types;

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
		
		//int[] argtypes = {Types.INTEGER,Types.VARCHAR,Types.VARCHAR,Types.INTEGER,Types.INTEGER,Types.DATE};
		jdbcTemplate.update(sql, args );
		
		return 1;
	}
}
