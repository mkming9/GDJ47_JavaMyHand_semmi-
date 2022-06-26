package com.jmh.product.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Product {
	
	private int anaNo;
	private String memberId;
	private String aCode;
	private String anaName;
	private int anaPrice;
	private String anaContent;
	private Date anaDate;
	private String fileType;
	private int anaView;
	
}
