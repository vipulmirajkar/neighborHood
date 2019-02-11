/**
 * 
 */
package com.neighborhood.model;

import java.io.Serializable;

/**
 * @author Vipul Dev
 * 
 */
@SuppressWarnings("serial")
public class Product implements Serializable {

	/**
	 * This is my plain old java object class for creating instance of product
	 */
	public Product() {
	}

	private String category;
	private String subCategory;
	private String productName;
	private String productDescription;
	private int productRate;
	private String address;
	private String ProductImage;
	private String imageName;
	private String emailAddress;

	/**
	 * @return the emailAddress
	 */
	public String getEmailAddress() {
		return emailAddress;
	}

	/**
	 * @param emailAddress the emailAddress to set
	 */
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	/**
	 * @return the imageName
	 */
	public String getImageName() {
		return imageName;
	}

	/**
	 * @param imageName the imageName to set
	 */
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	/**
	 * @return the category
	 */
	public String getCategory() {
		return category;
	}

	/**
	 * @param category
	 *            the category to set
	 */
	public void setCategory(String category) {
		this.category = category;
	}

	/**
	 * @return the subCategory
	 */
	public String getSubCategory() {
		return subCategory;
	}

	/**
	 * @param subCategory
	 *            the subCategory to set
	 */
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}

	/**
	 * @param productName
	 *            the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}

	/**
	 * @return the productDescription
	 */
	public String getProductDescription() {
		return productDescription;
	}

	/**
	 * @param productDescription
	 *            the productDescription to set
	 */
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	/**
	 * @return the productRate
	 */
	public int getProductRate() {
		return productRate;
	}

	/**
	 * @param productRate
	 *            the productRate to set
	 */
	public void setProductRate(int productRate) {
		this.productRate = productRate;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address
	 *            the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the productImage
	 */
	public String getProductImage() {
		return ProductImage;
	}

	/**
	 * @param productImage
	 *            the productImage to set
	 */
	public void setProductImage(String productImage) {
		ProductImage = productImage;
	}
}