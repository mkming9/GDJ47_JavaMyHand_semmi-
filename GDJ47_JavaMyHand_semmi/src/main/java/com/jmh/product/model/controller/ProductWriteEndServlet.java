package com.jmh.product.model.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.jmh.Files.model.vo.Files;
import com.jmh.Files.model.vo.Files.FilesBuilder;

import com.jmh.product.model.service.ProductService;
import com.jmh.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ProductWriteEndServlet
 */
@WebServlet("/ProductWriteEndServlet")
public class ProductWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		 
		
		String MEMBER_ID=request.getParameter("MEMBER_ID");
		String A_CODE=request.getParameter("A_CODE");
		String ANA_NAME=request.getParameter("ANA_NAME");
		int ANA_PRICE=Integer.parseInt(request.getParameter("ANA_PRICE"));
		String ANA_CONTENT=request.getParameter("ANA_CONTENT");
		
		
//		System.out.println(ANA_NO+" "+MEMBER_ID+" "+A_CODE+" "+ANA_NAME+" "+ANA_PRICE+" "+ANA_CONTENT);
		
		Product p=Product.builder().member_Id(MEMBER_ID)
				.a_Code(A_CODE)
				.ana_Name(ANA_NAME)
				.ana_Price(ANA_PRICE)				
				.ana_Content(ANA_CONTENT)
				.build();
		int result=new ProductService().insertProduct(p);
		//System.out.println(result);
			
		String msg="";
		String loc="";
		if(result>0) {
			msg="상품등록완료";
			loc="/product/productlist.do";
		}else {
			msg="상품등록실패";
			loc="/ProductWriteServlet.do";
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
