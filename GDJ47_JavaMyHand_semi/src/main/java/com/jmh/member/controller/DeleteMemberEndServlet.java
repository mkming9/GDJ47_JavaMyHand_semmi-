package com.jmh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jmh.member.model.service.MemberService;
import com.jmh.member.model.vo.Member;

/**
 * Servlet implementation class DeleteMemberEndServlet
 */
@WebServlet("/deleteMemberEnd.do")
public class DeleteMemberEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String memberId = request.getParameter("memberId");
		String oriPw = request.getParameter("password");
		
		Member m = Member.builder().memberId(memberId)
				.password(oriPw)
				.build();
		
		String msg="", loc="";
		if(m!=null) {
			//맞는 비밀번호
			int result = new MemberService().deleteMember(m);
			
			if(result>0) {
				msg = "탈퇴가 정상적으로 되었습니다. 감사합니다.";
				loc = "/index.jsp";
			}else {
				msg = "오류";
			}
		}else {
			//틀린 비밀번호
			msg="비밀번호가 일치하지 않습니다.";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
