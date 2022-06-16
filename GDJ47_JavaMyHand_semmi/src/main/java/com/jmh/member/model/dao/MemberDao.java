package com.jmh.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.jmh.member.model.vo.Member;
import com.jmh.notice.model.dao.NoticeBoardDao;

import static com.jmh.common.JDBCTemplate.close;

public class MemberDao {

	private Properties prop = new Properties();
	
	public  MemberDao() {
		String path=NoticeBoardDao.class.
			getResource("/sql/member_sql.properties").getPath();
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
	
	
	public int memberSignUp(Connection conn,Member m) { //회원가입
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("memberSignUp"));
			pstmt.setString(1,m.getMemberId());
			pstmt.setString(2,m.getPassword());
			pstmt.setString(3,m.getMemberName());
			pstmt.setString(4,m.getGender());
			pstmt.setInt(5,m.getAge());
			pstmt.setString(6,m.getAddress());
			pstmt.setString(7,m.getPhone());
			result =pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				close(pstmt);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	
	
	public static Member getMember(ResultSet rs) throws SQLException{
		return Member.builder()
								.memberId(rs.getString("member_id"))
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
