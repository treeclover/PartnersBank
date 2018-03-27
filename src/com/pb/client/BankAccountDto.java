package com.pb.client;

public class BankAccountDto {
	private String account_number;
	private String account_name;
	private String client_id;
	private String type;
	private int remain_money;
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
	
	
}
