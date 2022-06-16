package com.jmh.groups.model.service;

import static com.jmh.common.JDBCTemplate.close;
import static com.jmh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.jmh.groups.model.dao.GroupsDao;
import com.jmh.groups.model.vo.Groups;

public class GroupsService {
	
	private GroupsDao dao=new GroupsDao(); 
	
	public List<Groups> selectGroupsAll() {
		Connection conn=getConnection();
		List<Groups> groups=dao.selectGroupsAll(conn);
		close(conn);
		return groups;
	}
}
