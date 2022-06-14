package com.member.model.vo;

import java.sql.Date;

public class Member {

	private String memberId;
	private String password;
	private String memberName;
	private String phone;
	private int age;
	private String gender;
	private String address;
	private Date enrollDate;
	
	public Member() {
		// TODO Auto-generated constructor stub
		//test
	}

	public Member(String memberId, String password, String memberName, String phone, int age, String gender,
			String address, Date enrollDate) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.memberName = memberName;
		this.phone = phone;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.enrollDate = enrollDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", password=" + password + ", memberName=" + memberName + ", phone="
				+ phone + ", age=" + age + ", gender=" + gender + ", address=" + address + ", enrollDate=" + enrollDate
				+ "]";
	}
	
}
