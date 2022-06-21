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
 * Servlet implementation class LogincheckServlet
 */
@WebServlet(name = "LoginCheckServlet", urlPatterns = {"/member/loginCheck.do" })
public class LogincheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogincheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		
		Member m =new MemberService().loginMember(memberId,password);

		String msg="" ,loc="";
		if(m!=null){
			msg="로그인의 성공했습니다";
			loc="/";
		}else{
			msg="아이디와 비밀번호를 확인해주세요";
//			loc="/index.jsp";
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
