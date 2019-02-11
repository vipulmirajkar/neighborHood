/**
 * 
 */
package com.neighborhood.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.Date;

import com.neighborhood.model.DBConnection;
import com.neighborhood.model.Person;

/**
 * @author VipulDev
 * 
 */
public class RegisterDAO {
	/**
	 * Class for Registering a person, writing business logic with database connection.
	 */
	public boolean flag = false;

	public RegisterDAO() {
	}
	
	public boolean registerPerson(Person person) {
		String firstName = person.getFirstName();
		String lastName = person.getLastName();
		String emailAddress = person.getEmailAddress();
		String location = person.getLocation();
		Long phoneNumber = person.getPhoneNumber();
		String password = person.getPassword();
		Timestamp date = new Timestamp(new Date().getTime());

		Connection conn = null;
		PreparedStatement preStatement = null;
		try {
			conn = DBConnection.createConnection();
			String insertQuery = "insert into users(firstname, lastname, emailaddress, address, phonenumber, passwrd, registrationdatetime) values (?,?,?,?,?,?,?)";
			preStatement = conn.prepareStatement(insertQuery);
			preStatement.setString(1, firstName);
			preStatement.setString(2, lastName);
			preStatement.setString(3, emailAddress);
			preStatement.setString(4, location);
			preStatement.setLong(5, phoneNumber);
			preStatement.setString(6, password);
			preStatement.setTimestamp(7, date);
			int result = preStatement.executeUpdate();
			if(result != 0){
				flag = true;
			}else{
				flag = false;
			}
		} catch (Exception e) {
			System.out.println("Error: " + e);
		}
		return flag;
	}
}