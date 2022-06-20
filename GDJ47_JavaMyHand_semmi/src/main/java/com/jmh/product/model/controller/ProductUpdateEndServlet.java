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
 * Servlet implementation class ProductUpdateEndServlet
 */
@WebServlet("/productupdateEndServlet.do")
public class ProductUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int ANA_NO=Integer.parseInt(request.getParameter("ANA_NO"));
		String A_CODE=request.getParameter("A_CODE");
		String ANA_NAME=request.getParameter("ANA_NAME");
		int ANA_PRICE=Integer.parseInt(request.getParameter("ANA_PRICE"));
		String ANA_CONTENT=request.getParameter("ANA_CONTENT");
		
		
//		System.out.println(ANA_NO+" "+MEMBER_ID+" "+A_CODE+" "+ANA_NAME+" "+ANA_PRICE+" "+ANA_CONTENT);
		
		Product p=Product.builder().ANA_NO(ANA_NO)
				.A_CODE(A_CODE)
				.ANA_NAME(ANA_NAME)
				.ANA_PRICE(ANA_PRICE)				
				.ANA_CONTENT(ANA_CONTENT)
				.build();
		int result=new ProductService().updataProduct(p);
		System.out.println(result);
			
		String msg="";
		String loc="";
		if(result>0) {
			msg="상품수정완료";
			loc="/product/productlist.do";
		}else {
			msg="상품수정실패";
			loc="/productUpdateServlet.do"+ANA_NO;
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
