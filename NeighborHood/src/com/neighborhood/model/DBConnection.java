/**
 * 
 */
package com.neighborhood.model;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @author VipulDev
 * 
 */
public class DBConnection {
	/**
	 * Writing this class for establishing Database connection which returns
	 * connection to database
	 */
	public DBConnection() {
	}

	public static Connection createConnection() {
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/neighborhood";
		String userName = "root";
		String password = "";

		try {
			try {
				Class.forName("com.mysql.jdbc.Driver"); // Loading MySQl Driver
			} catch (Exception e) {
				System.out.println("Error: " + e);
			}
			conn = DriverManager.getConnection(url, userName, password);
		} catch (Exception e) {
			System.out.println("Error: " + e);
		}
		return conn;
	}
}