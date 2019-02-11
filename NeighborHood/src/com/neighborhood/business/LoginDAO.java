/**
 * 
 */
package com.neighborhood.business;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.xml.bind.DatatypeConverter;

import com.neighborhood.model.AuthBean;
import com.neighborhood.model.DBConnection;

/**
 * @author Vipul Dev
 * 
 */
public class LoginDAO {

	/**
	 * Class for Logging in a person, writing logic with database
	 * connection.
	 */
	public LoginDAO() {
	}

	public boolean flag = false;

	public boolean authUser(AuthBean user) {
		String emailAddress = user.getEmailAddress();
		String password = user.getPassword();

		Connection conn = null;
		Statement statement = null;
		ResultSet result = null;
		String userQuery = "select emailaddress, passwrd from users";

		try {
			conn = DBConnection.createConnection();
			statement = conn.createStatement();
			result = statement.executeQuery(userQuery);

			while (result.next()) {
				String email = result.getString("emailaddress");
				String passwrd = result.getString("passwrd");

				/* Code for Decrypting password */
				byte[] decoded = DatatypeConverter.parseBase64Binary(passwrd);
				/*	
				 * System.out.print("Decoded message: "); System.out.println(new
				 * String(decoded, "UTF-8"));
				 */
				String decodedPassword = new String(decoded);

				if (email.equals(emailAddress)
						&& password.equals(decodedPassword)) {
					System.out.println("Got user");
					flag = true;
				}
			}
		} catch (Exception e) {
			System.out.println("Error in LoginDAO: " + e);
		}
		return flag;
	}
}