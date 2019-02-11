/**
 * Written by - Vipul Mirajkar at 08:40 pm on 16/07/2018
 */
package com.neighborhood.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.neighborhood.model.DBConnection;

/**
 * @author Vipul Dev
 * 
 */
public class EmailVerification {

	/**
	 * Writing logic for checking duplicate email Address
	 */
	public EmailVerification() {
	}

	public boolean verifyEmail(String email) {
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
				System.out.println("User Already exists");
			} else {
				flag = false;
				System.out.println("New user");
			}
		} catch (Exception e) {
			System.out.println("Error: " + e);
		}
		return flag;
	}
}