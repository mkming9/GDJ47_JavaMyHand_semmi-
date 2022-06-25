package com.jmh.member.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Member {
	private String memberId;
	private String email;
	private String password;
	private String memberName;
	private String gender;
	private int age;
	private String address;
	private String phone;
	private int point;
	private Date enrollDate;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String memberId, String email, String password, String memberName, String gender, int age,
			String address, String phone, int point, Date enrollDate) {
		super();
		this.memberId = memberId;
		this.email = email;
		this.password = password;
		this.memberName = memberName;
		this.gender = gender;
		this.age = age;
		this.address = address;
		this.phone = phone;
		this.point = point;
		this.enrollDate = enrollDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
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

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", email=" + email + ", password=" + password + ", memberName="
				+ memberName + ", gender=" + gender + ", age=" + age + ", address=" + address + ", phone=" + phone
				+ ", point=" + point + ", enrollDate=" + enrollDate + "]";
	}
}
