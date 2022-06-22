package com.jmh.notice.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.jmh.notice.model.vo.NoticeBoard;

import static com.jmh.common.JDBCTemplate.*;

public class NoticeBoardDao {
	
	private Properties prop = new Properties();

	public  NoticeBoardDao() {
		String path=NoticeBoardDao.class.
			getResource("/sql/noticeboard_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<NoticeBoard> noticeBoardList(Connection conn ){
		ResultSet rs =null;
		PreparedStatement pstmt=null;
		List<NoticeBoard> result =new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectNoticeBoardList"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getNoticeBoard(rs));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}try {
			
			close(rs);
			close(pstmt);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	private NoticeBoard getNoticeBoard(ResultSet rs) throws SQLException{
		return NoticeBoard.builder()
				.noticeNo(rs.getInt("notice_no"))
				.memberId(rs.getString("member_id"))
				.noticeTitle(rs.getString("notice_title"))
				.noticeContent(rs.getString("notice_title"))
				.noticeDate(rs.getDate("notice_date"))
				.noticeView(rs.getInt("notice_view"))
				.build();
				
	}
}
