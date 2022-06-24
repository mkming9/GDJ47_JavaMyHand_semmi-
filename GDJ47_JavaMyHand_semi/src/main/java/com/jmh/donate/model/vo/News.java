package com.jmh.donate.model.vo;

import java.sql.Date;

import com.jmh.groups.model.vo.Groups;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class News {
	private String title;
	private String link;
	private String img;
}
