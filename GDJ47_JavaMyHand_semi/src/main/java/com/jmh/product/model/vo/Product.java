package com.jmh.product.model.vo;

import java.sql.Date;

import javax.servlet.http.Part;

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
	private String fileOriginalFilename;
	private String fileRenamedFilename;
	private String fileType;
	//private String gdsThumbImg;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int ana_No, String member_Id, String a_Code, String ana_Name, int ana_Price, String ana_Content,
			Date ana_Date, int ana_View, String fileOriginalFilename, String fileRenamedFilename, String fileType) {
		super();
		this.ana_No = ana_No;
		this.member_Id = member_Id;
		this.a_Code = a_Code;
		this.ana_Name = ana_Name;
		this.ana_Price = ana_Price;
		this.ana_Content = ana_Content;
		this.ana_Date = ana_Date;
		this.ana_View = ana_View;
		this.fileOriginalFilename = fileOriginalFilename;
		this.fileRenamedFilename = fileRenamedFilename;
		this.fileType = fileType;
	}

	@Override
	public String toString() {
		return "Product [ana_No=" + ana_No + ", member_Id=" + member_Id + ", a_Code=" + a_Code + ", ana_Name="
				+ ana_Name + ", ana_Price=" + ana_Price + ", ana_Content=" + ana_Content + ", ana_Date=" + ana_Date
				+ ", ana_View=" + ana_View + ", fileOriginalFilename=" + fileOriginalFilename + ", fileRenamedFilename="
				+ fileRenamedFilename + ", fileType=" + fileType + "]";
	}
	
	
	
}
