package com.jmh.files.model.vo;

import java.sql.Date;



import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Files {
	private int group_No;
	private String member_Id;
	private int goods_No;
	private String file_Name;
	private String file_Type;
	private Date file_Date;
	
}
