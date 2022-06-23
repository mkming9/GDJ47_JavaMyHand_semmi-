package com.jmh.product.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Product {
	
	private int ana_No;
	private String member_Id;
	private String a_Code;
	private String ana_Name;
	private int ana_Price;
	private String ana_Content;
	private Date ana_Date;
	private int ana_View;
	//private String gdsThumbImg;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int aNA_NO, String mEMBER_ID, String a_CODE, String aNA_NAME, int aNA_PRICE, String aNA_CONTENT,
			Date aNA_DATE, int aNA_VIEW) {
		super();
		ana_No = aNA_NO;
		member_Id = mEMBER_ID;
		a_Code = a_CODE;
		ana_Name = aNA_NAME;
		ana_Price = aNA_PRICE;
		ana_Content = aNA_CONTENT;
		ana_Date = aNA_DATE;
		ana_View = aNA_VIEW;
		
	}
//	public String getgDSTHUMBIMG() {
//		return  gdsThumbImg;
//	}
//	public void setgDSTHUMBIMG(String gDSTHUMBIMG) {
//		gdsThumbImg = gDSTHUMBIMG;
//	}
	

	public int getANA_NO() {
		return ana_No;
	}

	public void setANA_NO(int aNA_NO) {
		ana_No = aNA_NO;
	}

	public String getMEMBER_ID() {
		return member_Id;
	}

	public void setMEMBER_ID(String mEMBER_ID) {
		member_Id = mEMBER_ID;
	}

	public String getA_CODE() {
		return a_Code;
	}

	public void setA_CODE(String a_CODE) {
		a_Code = a_CODE;
	}

	public String getANA_NAME() {
		return ana_Name;
	}

	public void setANA_NAME(String aNA_NAME) {
		ana_Name = aNA_NAME;
	}

	public int getANA_PRICE() {
		return ana_Price;
	}

	public void setANA_PRICE(int aNA_PRICE) {
		ana_Price = aNA_PRICE;
	}

	public String getANA_CONTENT() {
		return ana_Content;
	}

	public void setANA_CONTENT(String aNA_CONTENT) {
		ana_Content = aNA_CONTENT;
	}

	public Date getANA_DATE() {
		return ana_Date;
	}

	public void setANA_DATE(Date aNA_DATE) {
		ana_Date = aNA_DATE;
	}

	public int getANA_VIEW() {
		return ana_View;
	}

	public void setANA_VIEW(int aNA_VIEW) {
		ana_View = aNA_VIEW;
	}

	@Override
	public String toString() {
		return "Product [ANA_NO=" + ana_No + ", MEMBER_ID=" + member_Id + ", A_CODE=" + a_Code + ", ANA_NAME="
				+ ana_Name + ", ANA_PRICE=" + ana_Price + ", ANA_CONTENT=" + ana_Content + ", ANA_DATE=" + ana_Date
				+ ", ANA_VIEW=" + ana_View + "]";
	}

	
	
	
}
