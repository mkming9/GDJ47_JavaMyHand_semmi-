package com.jmh.product.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Product {
	
	private int ANA_NO;
	private String MEMBER_ID;
	private String A_CODE;
	private String ANA_NAME;
	private int ANA_PRICE;
	private String ANA_CONTENT;
	private Date ANA_DATE;
	private int ANA_VIEW;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int aNA_NO, String mEMBER_ID, String a_CODE, String aNA_NAME, int aNA_PRICE, String aNA_CONTENT,
			Date aNA_DATE, int aNA_VIEW) {
		super();
		ANA_NO = aNA_NO;
		MEMBER_ID = mEMBER_ID;
		A_CODE = a_CODE;
		ANA_NAME = aNA_NAME;
		ANA_PRICE = aNA_PRICE;
		ANA_CONTENT = aNA_CONTENT;
		ANA_DATE = aNA_DATE;
		ANA_VIEW = aNA_VIEW;
	}

	public int getANA_NO() {
		return ANA_NO;
	}

	public void setANA_NO(int aNA_NO) {
		ANA_NO = aNA_NO;
	}

	public String getMEMBER_ID() {
		return MEMBER_ID;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}

	public String getA_CODE() {
		return A_CODE;
	}

	public void setA_CODE(String a_CODE) {
		A_CODE = a_CODE;
	}

	public String getANA_NAME() {
		return ANA_NAME;
	}

	public void setANA_NAME(String aNA_NAME) {
		ANA_NAME = aNA_NAME;
	}

	public int getANA_PRICE() {
		return ANA_PRICE;
	}

	public void setANA_PRICE(int aNA_PRICE) {
		ANA_PRICE = aNA_PRICE;
	}

	public String getANA_CONTENT() {
		return ANA_CONTENT;
	}

	public void setANA_CONTENT(String aNA_CONTENT) {
		ANA_CONTENT = aNA_CONTENT;
	}

	public Date getANA_DATE() {
		return ANA_DATE;
	}

	public void setANA_DATE(Date aNA_DATE) {
		ANA_DATE = aNA_DATE;
	}

	public int getANA_VIEW() {
		return ANA_VIEW;
	}

	public void setANA_VIEW(int aNA_VIEW) {
		ANA_VIEW = aNA_VIEW;
	}

	@Override
	public String toString() {
		return "Product [ANA_NO=" + ANA_NO + ", MEMBER_ID=" + MEMBER_ID + ", A_CODE=" + A_CODE + ", ANA_NAME="
				+ ANA_NAME + ", ANA_PRICE=" + ANA_PRICE + ", ANA_CONTENT=" + ANA_CONTENT + ", ANA_DATE=" + ANA_DATE
				+ ", ANA_VIEW=" + ANA_VIEW + "]";
	}

	
	
	
}
