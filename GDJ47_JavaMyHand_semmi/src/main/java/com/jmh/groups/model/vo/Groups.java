package com.jmh.groups.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Groups {
	private int groupNo;
	private String memberId;
	private String gCode;
	private String groupTitle;
	private String groupContent;
	private Date groupDate;
	private int groupJoin;
	private int groupLimit;
	private String groupGender;
	private int groupView;
	private String groupLocation;
	private String groupOk;
	private double groupScore;
}
