package com.jmh.member.model.service;

import static com.jmh.common.JDBCTemplate.close;
import static com.jmh.common.JDBCTemplate.commit;
import static com.jmh.common.JDBCTemplate.getConnection;
import static com.jmh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.jmh.member.model.dao.MemberDao;
import com.jmh.member.model.vo.Member;
public class MemberService {
	
	private MemberDao dao = new MemberDao();
	
	// public Member loginMember(String memberId, String password, int point) {
	public Member loginMember(String memberId, String password) {
		Connection conn = getConnection();
		// Member m = dao.loginMember(conn, memberId, password, point);
		Member m = dao.loginMember(conn, memberId, password);
		close(conn);
		return m;
	}

	public int memberSignUp(Member m) { //회원가입
		Connection conn =getConnection();
		int result =dao.memberSignUp(conn,m);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	public Member memberIdCheck(String memberId ) {
		Connection conn=getConnection();
		Member m =dao.memberIdCheck(conn,memberId);
		close(conn);
		return m;
		
	}
	
	
}
