package com.jmh.notice.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class NoticeBoard {
	private int noticeNo;
	private String memberId;
	private String  noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private int noticeView;
	
}

