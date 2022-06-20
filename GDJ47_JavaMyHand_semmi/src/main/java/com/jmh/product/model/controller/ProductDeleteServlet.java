package com.jmh.product.model.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jmh.product.model.service.ProductService;
import com.jmh.product.model.vo.Product;

/**
 * Servlet implementation class ProductDeleteServlet
 */
@WebServlet("/product/productdelete.do")
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int ANA_NO=Integer.parseInt(request.getParameter("no"));
		
		request.setAttribute("product", new ProductService().deleteProduct(ANA_NO));
		//System.out.println(ANA_NO);
		int result=new ProductService().deleteProduct(ANA_NO);
		
		System.out.println(result);
		String msg="";
		String loc="";
		if(result>0) {
			msg="삭제실패";
			loc="/product/productlist.do";		
		}else {
			msg="삭제완료";
			loc="/product/productlist.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
