package com.beans;

public class Register {
	private String userName;
	private String password;
	private int amount;
	private String address;
	private String phone;
	
	public Register(){}

	public Register(String userName, String password){
		this.userName = userName;
		this.password = password;
	}
	
	public Register(String userName, String password, int amount, String address, String phone) {
		super();
		this.userName = userName;
		this.password = password;
		this.amount = amount;
		this.address = address;
		this.phone = phone;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
}
