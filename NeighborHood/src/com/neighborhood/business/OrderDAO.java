/**
 * 
 */
package com.neighborhood.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import com.neighborhood.model.DBConnection;
import com.neighborhood.model.Order;

/**
 * @author Vipul Dev
 * 
 */
public class OrderDAO {

	/**
	 * DAO Class for placing orders
	 */
	public OrderDAO() {
	}

	public boolean flag = false;

	public boolean placeOrder(Order order) {
		String emailAddress = order.getEmailAddress();
		String productName = order.getProductName();
		Date startDate = order.getStartDate();
		Date endDate = order.getEndDate();
		int rate = order.getRate();

		Connection conn = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement insertInOrdersMap = null;
		Statement statement = null;
		int pId = 0;
		String query = "insert into orders(emailaddress, product_name, start_date, end_date, rate) values (?,?,?,?,?)";

		String retrieveProductId = "select * from products where product_name='" + productName + "'";
		String insertProductId = "insert into orders_map (p_id) values (?)";

		try {
			conn = DBConnection.createConnection();
			preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, emailAddress);
			preparedStatement.setString(2, productName);
			preparedStatement.setDate(3, (java.sql.Date) startDate);
			preparedStatement.setDate(4, (java.sql.Date) endDate);
			preparedStatement.setInt(5, rate);

			int result = preparedStatement.executeUpdate();

			statement = conn.createStatement();
			ResultSet getPId = statement.executeQuery(retrieveProductId);

			while (getPId.next() == true) {
				pId = getPId.getInt("p_id");
			}

			insertInOrdersMap = conn.prepareStatement(insertProductId);
			insertInOrdersMap.setInt(1, pId);

			int status = insertInOrdersMap.executeUpdate();

			if (result != 0 && status != 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (Exception e) {
			System.out.println("Error in placing order: " + e);
		}
		return flag;
	}
}