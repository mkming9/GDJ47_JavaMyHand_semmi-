package com.jmh.notice.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Notice {
	private String noticeNo;
	private String memberId;
	private String noticeTitle;
	private Date noticeDate;
	private int noticeView;
	private String noticeContent;
}
