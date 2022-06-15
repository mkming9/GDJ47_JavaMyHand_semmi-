package com.jmh.member.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Member {
	private String memberId;
	private String password;
	private String memberName;
	private String gender;
	private int age;
	private String address;
	private String phone;
	private int point;
	private Date enrollDate;
}
