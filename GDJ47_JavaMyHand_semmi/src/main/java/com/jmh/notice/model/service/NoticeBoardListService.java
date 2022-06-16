package com.jmh.notice.model.service;

import static com.jmh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.jmh.notice.model.dao.NoticeBoardDao;
import com.jmh.notice.model.vo.NoticeBoard;

public class NoticeBoardListService {

	private NoticeBoardDao dao =new NoticeBoardDao();

	public List<NoticeBoard> noticeBoardList(){
		Connection conn =getConnection();
		List<NoticeBoard> result= dao.noticeBoardList(conn);
		close(conn); 
		return result;
	}
}
