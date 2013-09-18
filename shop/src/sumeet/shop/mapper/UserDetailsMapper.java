package sumeet.shop.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import sumeet.shop.datamodel.UserDetails;

public class UserDetailsMapper implements RowMapper<UserDetails>{

	@Override
	public UserDetails mapRow(ResultSet result, int line) throws SQLException {
		
		UserDetails user = new UserDetails();
		user.setName(result.getString("NAME"));
		user.setOwner_id(Integer.valueOf(result.getString("OWNER_ID")));
		user.setUser_name(result.getString("USER_NAME"));
		user.setEmail(result.getString("EMAIL"));
		user.setCompany(result.getString("COMPANY"));
		user.setAddress(result.getString("ADDRESS"));
		user.setContact_no(result.getString("CONTACT_NO"));
		user.setPassword(result.getString("PASSWORD"));
		return user;
	}
	

}
