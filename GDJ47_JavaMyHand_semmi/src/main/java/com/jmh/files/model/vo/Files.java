package com.jmh.files.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Files {
	
	private String member_Id;
	private String file_name;
	private String file_type;
	private Date file_Date;
}
