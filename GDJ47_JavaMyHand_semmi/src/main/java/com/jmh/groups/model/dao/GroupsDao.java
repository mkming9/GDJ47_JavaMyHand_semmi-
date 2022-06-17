package com.jmh.groups.model.dao;

import static com.jmh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.jmh.groups.model.vo.Groups;
import com.jmh.notice.model.vo.NoticeBoard;

public class GroupsDao {
	private Properties prop=new Properties();
	
	public GroupsDao() {
		String path=GroupsDao.class.getResource("/sql/groups_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Groups> selectGroupsAll(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Groups> groups=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectGroupsList"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				groups.add(getGroups(rs));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		} return groups;
	}
	
	public int insertGroups(Connection conn, Groups g) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertGroups"));
			pstmt.setString(1, "admin1");
			pstmt.setString(2, g.getGCode());
			pstmt.setString(3, g.getGroupTitle());
			pstmt.setString(4, g.getGroupContent());
			pstmt.setInt(5, g.getGroupLimit());
			pstmt.setString(6, g.getGroupGender());
			pstmt.setString(7, g.getGroupLocation());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}
	
	public int deleteGroups(Connection conn, String groupTitle) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteGroupsByTitle"));
			pstmt.setString(1, groupTitle);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} return result;
	}
	
	private Groups getGroups(ResultSet rs) throws SQLException{
		return Groups.builder()
				.groupNo(rs.getInt("group_no"))
				.memberId(rs.getString("member_id"))
				.gCode(rs.getString("g_code"))
				.groupTitle(rs.getString("group_title"))
				.groupContent(rs.getString("group_content"))
				.groupDate(rs.getDate("group_date"))
				.groupJoin(rs.getInt("group_join"))
				.groupLimit(rs.getInt("group_limit"))
				.groupGender(rs.getString("group_gender"))
				.groupView(rs.getInt("group_view"))
				.groupLocation(rs.getString("group_location"))
				.groupOk(rs.getString("group_ok"))
				.groupScore(rs.getDouble("group_score"))
				.build();
	}
}
