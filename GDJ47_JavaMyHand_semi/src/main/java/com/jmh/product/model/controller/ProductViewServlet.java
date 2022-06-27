package com.jmh.product.model.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.jmh.product.model.service.ProductService;
import com.jmh.product.model.vo.Product;

/**
 * Servlet implementation class ProductViewServlet
 */
@WebServlet("/product/productView.do")
public class ProductViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int anaNo=Integer.parseInt(request.getParameter("no"));
		
		boolean isRead=false;
		String preProduct="";
		Cookie[] cookies=request.getCookies();
		if(cookies!=null) {
			for(Cookie c :cookies) {
				String name=c.getName();
				String value=c.getValue();
				if(name.equals("readproduct")) {
					preProduct=value;
					if(preProduct.contains("|"+anaNo+"|")) {
						isRead=true;
						break;
					}
				}
			}
		}
		if(!isRead) {
			Cookie c=new Cookie("readproduct",preProduct+"|"+anaNo+"|");
			c.setMaxAge(24*60*60);
			response.addCookie(c);
		}
		
		
		//System.out.println(ANA_NO);				
		request.setAttribute("product", new ProductService().selectProductview(anaNo,isRead));
		
		System.out.println(isRead);
		request.getRequestDispatcher("/views/product/productView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
