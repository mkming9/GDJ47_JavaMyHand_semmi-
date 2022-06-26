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
 * Servlet implementation class UpdatePasswordEndServlet
 */
@WebServlet("/updatePasswordEnd.do")
public class UpdatePasswordEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePasswordEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		String oriPw = request.getParameter("password");
		String newPw = request.getParameter("password_new");
		
		Member m = Member.builder().memberId(memberId)
				.password(newPw)
				.build();
		
		
		
		String msg="", loc="";
		if(m!=null) {
			//맞는 비밀번호
			int result = new MemberService().updatePassword(m);
			System.out.println(result);
			
			if(result>0) {
				msg = "비밀번호가 변경되었습니다.";
				String script = "close();";
				request.setAttribute("script", script);
			}else {
				msg = "비밀번호 변경을 실패했습니다. 다시 시도해주세요";
				loc = "/updatePassword.do?memberId="+memberId;
			}
		}else {
			//틀린 비밀번호
			msg = "현재 비밀번호를 다시 입력해주세요.";
			loc = "/updatePassword.do?memberId="+memberId;
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
