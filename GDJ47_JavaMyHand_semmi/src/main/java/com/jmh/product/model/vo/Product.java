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
	public Product(int ana_No, String member_Id, String a_Code, String ana_Name, int ana_Price, String ana_Content,
			Date ana_Date, int ana_View) {
		super();
		this.ana_No = ana_No;
		this.member_Id = member_Id;
		this.a_Code = a_Code;
		this.ana_Name = ana_Name;
		this.ana_Price = ana_Price;
		this.ana_Content = ana_Content;
		this.ana_Date = ana_Date;
		this.ana_View = ana_View;
	}
	@Override
	public String toString() {
		return "Product [ana_No=" + ana_No + ", member_Id=" + member_Id + ", a_Code=" + a_Code + ", ana_Name="
				+ ana_Name + ", ana_Price=" + ana_Price + ", ana_Content=" + ana_Content + ", ana_Date=" + ana_Date
				+ ", ana_View=" + ana_View + "]";
	}
	
	
	
}
