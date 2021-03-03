package com.model;

public class item {
	
	private int itemID;
	private String itemCode;
	private String itemName;
	private float price;
	private String description;
	
	
	
	public int getItemID() {
		return itemID;
	}
	public String getItemCode() {
		return itemCode;
	}
	
	public String getItemName() {
		return itemName;
	}
	
	public float getPrice() {
		return price;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setItemID(int itemID) {
		this.itemID = itemID;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	public void setPrice(float price) {
		this.price = price;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	

}
