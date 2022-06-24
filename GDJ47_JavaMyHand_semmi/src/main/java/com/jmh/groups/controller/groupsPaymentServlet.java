package com.jmh.groups.controller;

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
 * Servlet implementation class groupsPaymentServlet
 */
@WebServlet("/groupsPayment.do")
public class groupsPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public groupsPaymentServlet() {
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
		String impUid=request.getParameter("imp_uid");
		String merchantUid=request.getParameter("merchant_uid");
		String chargeAmount=request.getParameter("charge_amount");
		
		System.out.println(impUid+" "+merchantUid+" "+chargeAmount);
		
		String saveId = (String) session.getAttribute("saveId");
		Member m = new MemberService().memberIdCheck(saveId);
		
		System.out.println(m);
		
		int updatePoint = m.getPoint() + Integer.parseInt(chargeAmount);
		
		System.out.println(updatePoint);
		
		// int result=new MemberService().UpdateMemberPoint(saveId, updatePoint);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
