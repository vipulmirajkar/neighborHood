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
public class ChangePasswordDAO {
	/**
	 * DAO Logic for changing password and setting new password in database
	 */
	public boolean flag = false;

	public ChangePasswordDAO() {
	}

	public String getOldPassword(String emailAddress) {
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

	public boolean changePassword(String emailAddress, String password) {
		try {
			Connection conn = null;
			PreparedStatement updateStatement = null;
			String updateQuery = "update users set passwrd = ? where emailaddress = ?";
			conn = DBConnection.createConnection();
			updateStatement = conn.prepareStatement(updateQuery);

			updateStatement.setString(1, password);
			updateStatement.setString(2, emailAddress);

			int status = updateStatement.executeUpdate();
			if (status != 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (Exception ex) {
			System.out.println("Error in changing password: " + ex);
		}
		return flag;
	}
}