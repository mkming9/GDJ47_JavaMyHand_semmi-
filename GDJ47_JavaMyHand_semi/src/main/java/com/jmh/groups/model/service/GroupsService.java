package com.jmh.groups.model.service;

import static com.jmh.common.JDBCTemplate.close;
import static com.jmh.common.JDBCTemplate.getConnection;
import static com.jmh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.jmh.groups.model.dao.GroupsDao;
import com.jmh.groups.model.vo.Groups;

public class GroupsService {
	
	private GroupsDao dao=new GroupsDao(); 
	
	public List<Groups> selectGroupsAll() {
		Connection conn=getConnection();
		List<Groups> group=dao.selectGroupsAll(conn);
		close(conn);
		return group;
	}
	public List<Groups> selectGroupsList(int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<Groups> groups=dao.selectGroupsList(conn,cPage,numPerpage);
		close(conn);
		return groups;
	}
	public int selectGroupsCount() {
		Connection conn=getConnection();
		int result=dao.selectGroupsCount(conn);
		close(conn);
		return result;
	}
	
	public int insertGroups(Groups g) {
		Connection conn=getConnection();
		int result=dao.insertGroups(conn, g);
		if (result>0) close(conn);
		else rollback(conn);
		return result;
	}
	
	public int deleteGroups(String groupTitle) {
		Connection conn=getConnection();
		int result=dao.deleteGroups(conn, groupTitle);
		if (result>0) close(conn);
		else rollback(conn);
		return result;
	}
}
