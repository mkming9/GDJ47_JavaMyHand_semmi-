package com.jmh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jmh.member.model.service.MemberService;
import com.jmh.member.model.vo.Member;

/**
 * Servlet implementation class LoginMemberServlet
 */
@WebServlet(name="loginMemberServlet", urlPatterns = {"/member/login.do"})
public class LoginMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		// int point = Integer.parseInt(request.getParameter("point"));
		
		String saveId=request.getParameter("saveId");
		
		
		System.out.println("saveId :: "+saveId);
		
		if(saveId!=null) {
			Cookie c=new Cookie("saveId",memberId);
			c.setMaxAge(24*60*60*7);
			c.setPath("/");
			response.addCookie(c);
		}else {
			Cookie c=new Cookie("saveId",memberId);
			c.setMaxAge(0);
			c.setPath("/");
			response.addCookie(c);
			System.out.println("출력안댐");
		}
		
		Member m = new MemberService().loginMember(memberId, password);
		// Member m = new MemberService().loginMember(memberId, password, point);
		
		System.out.println(m);
		if(m!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", m);
			session.setAttribute("saveId", memberId);
			// session.setAttribute("point", point);
			response.sendRedirect(request.getContextPath()+"/views/member/loginsuccess.jsp")	;
		}else {
			
			response.sendRedirect(request.getContextPath()+"/member/loginCheck.do");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
