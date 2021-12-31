package com.swempire.web.condition.VO;

public class EmailVO {
	int bid;
	String email;
	String name;
	String orga_name;
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getOrga_name() {
		return orga_name;
	}
	public void setOrga_name(String orga_name) {
		this.orga_name = orga_name;
	}
	@Override
	public String toString() {
		return "EmailVO [bid=" + bid + ", email=" + email + ", name=" + name + "]";
	}
}
