package com.jmh.member.model.dao;

import static com.jmh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.jmh.member.model.vo.Member;

public class MemberDao {

	private Properties prop = new Properties();
	
	public MemberDao() {
		String path = MemberDao.class.getResource("/sql/member_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public Member loginMember(Connection conn, String memberId, String password) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("loginMember"));
			pstmt.setString(1, memberId);
			pstmt.setString(2,password);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m = getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	
	public static Member getMember(ResultSet rs) throws SQLException{
		return Member.builder()
								.memberId(rs.getString("member_id"))
//								.password(rs.getString("password"))
								.memberName(rs.getString("member_name"))
								.gender(rs.getString("gender"))
								.age(rs.getInt("age"))
								.address(rs.getString("address"))
								.phone(rs.getString("phone"))
								.point(rs.getInt("point"))
								.enrollDate(rs.getDate("enroll_date"))
								.build();
				}
}
