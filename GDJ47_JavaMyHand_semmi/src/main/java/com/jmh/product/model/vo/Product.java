package com.jmh.product.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Product {
	private int ANA_NO;
	private String memberId;
	private String A_CODE;
	private String ANA_NAME;
	private int ANA_PRICE;
	private String ANA_CONTENT;
	private Date ANA_DATE;
	private int ANA_VIEW;
}
