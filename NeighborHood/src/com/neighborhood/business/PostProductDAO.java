/**
 * 
 */
package com.neighborhood.business;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.neighborhood.model.DBConnection;
import com.neighborhood.model.Product;

/**
 * @author Vipul Dev
 * 
 */
public class PostProductDAO {

	/**
	 * logic for posting product
	 */
	public boolean flag = false;

	public PostProductDAO() {
	}

	public boolean postProduct(Product product) {
		String emailAddress = product.getEmailAddress();
		String categoryName = product.getCategory();
		String subCategory = product.getSubCategory();
		String productName = product.getProductName();
		String productDescription = product.getProductDescription();
		int productRate = product.getProductRate();
		String address = product.getAddress();
		String imagePath = product.getProductImage();
		String imageName = product.getImageName();

		Connection conn = null;
		PreparedStatement preparedStatement = null;
		try {
			conn = DBConnection.createConnection();
			String insertQuery = "insert into products (emailaddress, category, sub_category, product_name, product_description, rate, address, image_name, pictures) values (?,?,?,?,?,?,?,?,?)";
			preparedStatement = conn.prepareStatement(insertQuery);
			preparedStatement.setString(1, emailAddress);
			preparedStatement.setString(2, categoryName);
			preparedStatement.setString(3, subCategory);
			preparedStatement.setString(4, productName);
			preparedStatement.setString(5, productDescription);
			preparedStatement.setInt(6, productRate);
			preparedStatement.setString(7, address);
			preparedStatement.setString(8, imageName);
			preparedStatement.setString(9, imagePath);
			int result = preparedStatement.executeUpdate();
			if (result != 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (Exception e) {
			System.out.println("Sorry, Error Occured in posting the product: "
					+ e.getMessage());
		}
		return flag;
	}
}