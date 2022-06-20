package com.jmh.product.model.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jmh.product.model.service.ProductService;
import com.jmh.product.model.vo.Product;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/UpdateProductServlet.do")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		Product p = new Product();
//		p.setA_CODE(request.getParameter("A_CODE"));
//		p.setANA_NAME(request.getParameter("ANA_NAME"));
//		p.setANA_PRICE(Integer.parseInt(request.getParameter("ANA_PRICE")));
//		p.setANA_CONTENT(request.getParameter("ANA_CONTENT"));
//		System.out.println(p);
//		int result=new ProductService().updataProduct(p);
//		System.out.println(p);
//		
//		request.getRequestDispatcher("/views/Product/productupdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
