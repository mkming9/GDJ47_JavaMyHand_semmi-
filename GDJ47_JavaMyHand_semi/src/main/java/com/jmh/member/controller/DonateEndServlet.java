package com.jmh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jmh.member.model.service.MemberService;
import com.jmh.member.model.vo.Member;

/**
 * Servlet implementation class DonateEndServlet
 */
@WebServlet("/donate/donateEnd.do")
public class DonateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DonateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		
		
		String memberId=request.getParameter("memberId");
		int point =Integer.parseInt(request.getParameter("point"));
		
		String saveId = (String) session.getAttribute("saveId");
		Member m = new MemberService().memberIdCheck(saveId);
		int result=new MemberService().UpdateDonate(point, memberId);
		m = new MemberService().memberIdCheck(saveId);
		
		if(m!=null) {
			session = request.getSession();
			session.setAttribute("loginMember", m);
			response.sendRedirect(request.getContextPath()+"/views/donate/donateeEnd.jsp");
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
