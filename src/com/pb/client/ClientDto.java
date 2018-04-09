package com.pb.client;

public class ClientDto {
	private String type;
	private String id;
	private String pw;
	private String name;
	private String addr;
	private String addr_detail;
	private String phone;
	private String email;
	private String job;
	private String gender;
	
	public ClientDto() { }	
	
	public ClientDto(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	public ClientDto(String type, String id, String pw, String name, String addr, String addr_detail,
			String phone, String email, String job, String gender) {
		super();
		this.type = type;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.addr = addr;
		this.addr_detail = addr_detail;
		this.phone = phone;
		this.email = email;
		this.job = job;
		this.gender = gender;
	}
	public ClientDto(String id, String pw, String name, String addr, String addr_detail, String phone,
			String email, String job, String gender) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.addr = addr;
		this.addr_detail = addr_detail;
		this.phone = phone;
		this.email = email;
		this.job = job;
		this.gender = gender;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	
}
