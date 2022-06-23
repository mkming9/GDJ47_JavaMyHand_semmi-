package com.jmh.Files.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Files {
	private int group_No;
	private String member_Id;
	private int ana_No;
	private String file_name;
	private String file_type;
	private Date file_Date;
}
