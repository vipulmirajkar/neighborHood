/**
 * 
 */
package com.neighborhood.model;

/**
 * @author Vipul Dev
 * 
 */
public class AuthBean {

	/**
	 * Java class for AuthUser (POJO)
	 */
	public AuthBean() {
		super();
	}

	public AuthBean(String emailAddress, String password) {
		super();
		this.emailAddress = emailAddress;
		this.password = password;
	}

	private String emailAddress;
	private String password;

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the emailAddress
	 */
	public String getEmailAddress() {
		return emailAddress;
	}

	/**
	 * @param emailAddress
	 *            the emailAddress to set
	 */
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
}