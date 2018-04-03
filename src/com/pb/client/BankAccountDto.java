package com.pb.client;

public class BankAccountDto {
	private String account_number;
	private String account_name;
	private String client_id;
	private String name;
	private String password;
	private String type;
	private int remain_money;
	private int day_transfer_limit;
	private int once_transfer_limit;
	private int day_transfer_limit_remain;
	private int incorrect_count;
	
	public String getAccount_number() {
		return account_number;
	}
	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}
	public String getAccount_name() {
		return account_name;
	}
	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getRemain_money() {
		return remain_money;
	}
	public void setRemain_money(int remain_money) {
		this.remain_money = remain_money;
	}
	public int getDay_transfer_limit() {
		return day_transfer_limit;
	}
	public void setDay_transfer_limit(int day_transfer_limit) {
		this.day_transfer_limit = day_transfer_limit;
	}
	public int getOnce_transfer_limit() {
		return once_transfer_limit;
	}
	public void setOnce_transfer_limit(int once_transfer_limit) {
		this.once_transfer_limit = once_transfer_limit;
	}
	public int getDay_transfer_limit_remain() {
		return day_transfer_limit_remain;
	}
	public void setDay_transfer_limit_remain(int day_transfer_limit_remain) {
		this.day_transfer_limit_remain = day_transfer_limit_remain;
	}
	public int getIncorrect_count() {
		return incorrect_count;
	}
	public void setIncorrect_count(int incorrect_count) {
		this.incorrect_count = incorrect_count;
	}
	
}
