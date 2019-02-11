/**
 * 
 */
package com.neighborhood.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.xml.bind.DatatypeConverter;

import com.neighborhood.model.DBConnection;

/**
 * @author Vipul Dev
 * 
 */
public class ForgotPasswordDAO {

	/**
	 * getting password from database if user requests for forgot password
	 */
	public ForgotPasswordDAO() {
	}
	
	public boolean checkUserEmailAddress(String email) {
		boolean flag = false;

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet result = null;
		String query = "select emailaddress from users where emailaddress=?";
		try {
			conn = DBConnection.createConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			result = ps.executeQuery();

			if (result.next() == true) {
				flag = true;
				System.out.println("User is registered");
			} else {
				flag = false;
				System.out.println("No such user found");
			}
		} catch (Exception e) {
			System.out.println("Error: " + e);
		}
		return flag;
	}

	
	public String getUserPassword(String emailAddress) {
		String decodedPassword = "";
		try {
			Connection conn = null;
			Statement statement = null;
			String getQuery = "select passwrd from users where emailaddress='"
					+ emailAddress + "'";
			conn = DBConnection.createConnection();

			statement = conn.createStatement();

			ResultSet result = statement.executeQuery(getQuery);

			while (result.next() == true) {
				String pass = result.getString("passwrd");
				/* Code for Decrypting password */
				byte[] decoded = DatatypeConverter.parseBase64Binary(pass);
				decodedPassword = new String(decoded);
			}
		} catch (Exception ex) {
			System.out.println("Error in getting password: " + ex);
		}
		return decodedPassword;
	}
}