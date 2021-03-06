package com.jmh.member.model.dao;

import static com.jmh.common.JDBCTemplate.close;

//github.com/mkming9/GDJ47_JavaMyHand_semmi-.git
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.jmh.member.model.vo.Member;

import oracle.jdbc.proxy.annotation.Pre;

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
	
	
	public int memberSignUp(Connection conn,Member m) { //회원가입
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("memberSignUp"));
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getGender());
			pstmt.setInt(5, m.getAge());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getPhone());
			pstmt.setString(8, m.getEmail());
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
	
	
	public Member memberIdCheck(Connection conn ,String memberId) {
		PreparedStatement pstmt= null;
		ResultSet rs =null;
		Member m =null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("memberIdCheck"));
			pstmt.setString(1, memberId);
			rs=pstmt.executeQuery();
			if(rs.next()) m=getMember(rs);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
	
	public int UpdateMemberPoint(Connection conn, String saveId, int updatePoint) {
		PreparedStatement pstmt = null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("UpdateMemberPoint"));
			pstmt.setInt(1, updatePoint);
			pstmt.setString(2, saveId);
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int UpdateDonate(Connection conn,int point,String memberId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("UpdateDonate"));
			pstmt.setInt(1, point);
			pstmt.setString(2, memberId);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
		
	public int memberEdit(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("memberEdit"));
			pstmt.setString(1, m.getMemberName());
			pstmt.setString(2, m.getGender());
			pstmt.setInt(3, m.getAge());
			pstmt.setString(4, m.getAddress());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getMemberId());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updatePassword(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("updatePassword"));
			pstmt.setString(1, m.getPassword());
			pstmt.setString(2, m.getMemberId());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
		
	}
	
	public int memberDelete(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("memberDelete"));
			pstmt.setString(1, m.getMemberId());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
		
	}
	
	public static Member getMember(ResultSet rs) throws SQLException{
		return Member.builder()
					.memberId(rs.getString("member_id"))
					.password(rs.getString("password"))
					.memberName(rs.getString("member_name"))
					.gender(rs.getString("gender"))
					.age(rs.getInt("age"))
					.address(rs.getString("address"))
					.phone(rs.getString("phone"))
					.point(rs.getInt("point"))
					.enrollDate(rs.getDate("enroll_date"))
					.email(rs.getString("email"))
					.build();
				}
	
}
