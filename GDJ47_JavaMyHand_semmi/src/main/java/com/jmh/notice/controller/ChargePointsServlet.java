package com.jmh.notice.controller;

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
 * Servlet implementation class ChargePointsServlet
 */
@WebServlet("/notice/chargePoints.do")
public class ChargePointsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChargePointsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
					
		String imp_uid = request.getParameter("imp_uid");
		String amount = request.getParameter("amount");
		String merchant_uid = request.getParameter("merchant_uid");
		
		System.out.println("amount : "+ amount + " merchant_uid : " + merchant_uid + " imp_uid : " + imp_uid);
		
		String saveId = (String) session.getAttribute("saveId");
		Member m = new MemberService().memberIdCheck(saveId);
		
		System.out.println(m);
		int updatePoint = m.getPoint() + Integer.parseInt(amount);
		
		System.out.println(updatePoint);
		
		int result = new MemberService().UpdateMemberPoint(saveId, updatePoint);
		m = new MemberService().memberIdCheck(saveId);
		
		if(m!=null) {
			session = request.getSession();
			session.setAttribute("loginMember", m);
			response.sendRedirect(request.getContextPath()+"/views/member/chargesuccess.jsp")	;
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
