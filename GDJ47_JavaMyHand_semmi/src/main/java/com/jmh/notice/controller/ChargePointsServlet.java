package com.jmh.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String saveId = (String) session.getAttribute("saveId");
		String point = (String) session.getAttribute("point");
		
	
	String imp_uid = request.getParameter("imp_uid");
	String amount = request.getParameter("amount");
	String merchant_uid = request.getParameter("merchant_uid");
	System.out.println("amount : "+ amount);
	System.out.println("merchant_uid : " + merchant_uid);
	System.out.println("imp_uid : " + imp_uid);
	System.out.println("saveId : " + saveId);
	System.out.println("point : " + point);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
