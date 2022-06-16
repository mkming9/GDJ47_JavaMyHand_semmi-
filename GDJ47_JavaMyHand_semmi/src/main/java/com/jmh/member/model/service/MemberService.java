package com.jmh.member.model.service;

import static com.jmh.common.JDBCTemplate.close;
import static com.jmh.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.jmh.member.model.dao.MemberDao;
import com.jmh.member.model.vo.Member;
public class MemberService {
	
	private MemberDao dao = new MemberDao();
	
	public Member loginMember(String memberId, String password) {
		Connection conn = getConnection();
		Member m = dao.loginMember(conn, memberId, password);
		close(conn);
		return m;
	}

}
