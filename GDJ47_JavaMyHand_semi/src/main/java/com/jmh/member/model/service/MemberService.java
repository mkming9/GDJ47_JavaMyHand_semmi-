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
	
	public Member memberIdCheck(String memberId) {
		Connection conn=getConnection();
		Member m =dao.memberIdCheck(conn,memberId);
		close(conn);
		return m;
	}
	
	public int UpdateMemberPoint(String saveId, int updatePoint) {
		Connection conn = getConnection();
		int result = dao.UpdateMemberPoint(conn, saveId, updatePoint);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int memberEdit(Member m) {//회원 정보 수정
		Connection conn = getConnection();
		int result = dao.memberEdit(conn, m);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updatePassword(Member m) {//비밀번호 수정
		Connection conn = getConnection();
		int result = dao.updatePassword(conn, m);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteMember(Member m) {//회원 탈퇴
		Connection conn = getConnection();
		int result = dao.memberDelete(conn, m);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
}
