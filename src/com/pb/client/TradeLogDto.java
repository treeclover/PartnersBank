package com.pb.client;

public class TradeLogDto {
	private int no;
	private String account_number;
	private String corporation_name;
	private int input_money;
	private int output_money;
	private int type;
	private String note;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getAccount_number() {
		return account_number;
	}
	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}
	public String getCorporation_name() {
		return corporation_name;
	}
	public void setCorporation_name(String corporation_name) {
		this.corporation_name = corporation_name;
	}
	public int getInput_money() {
		return input_money;
	}
	public void setInput_money(int input_money) {
		this.input_money = input_money;
	}
	public int getOutput_money() {
		return output_money;
	}
	public void setOutput_money(int output_money) {
		this.output_money = output_money;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
}
