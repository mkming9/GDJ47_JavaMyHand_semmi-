package com.jmh.product.model.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.jmh.product.model.service.ProductService;
import com.jmh.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ProductWriteEndServlet
 */
@MultipartConfig(
		maxFileSize=1024*1024*50,
		maxRequestSize=1024*1024*50*5
		)

@WebServlet("/product/productWriteEnd.do")
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
//		Part file= request.getPart("file");
//		//사용자가 업로드한 파일 이름 알아오기
//		String originName=file.getSubmittedFileName();
//		//사용자가 업로드한 파일에 input 스트림연결
//		InputStream fis = file.getInputStream();
//		//저장할 경로
//		String realPath=request.getServletContext().getRealPath("/upload/productImg");
//		//파일 경로 
//		String filePath=realPath + File.separator+originName;
//		System.out.println(filePath);
//		System.out.println(file);
//		//파일 저장
//		FileOutputStream fos=new FileOutputStream(filePath);
//		
//		byte[] buf=new byte[1024];
//		int size=0;
//		while((size = fis.read(buf)) !=-1) {
//			fos.write(buf,0,size);
//		}
//		fis.close();
//		fos.close();
//		
//		request.setAttribute("path", "LostArk.png");
//		request.getRequestDispatcher("/views/product/productview.jsp").forward(request, response);
		
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg","상품등록 오류");
			request.setAttribute("loc", "/product/productWrite.do");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		} else {
			// 1. 파일 저장위치
			String path=request.getServletContext().getRealPath("/upload/product/");
			
			// 2. 파일 Max크기 설정
			int maxSize=1024*1024*10;
			
			// 3. 파일 인코딩설정
			String encoding="UTF-8";
			
			DefaultFileRenamePolicy dfp=new DefaultFileRenamePolicy();
			
			MultipartRequest mr = new MultipartRequest(request,path,maxSize,encoding,dfp);
			
			Product p=Product.builder()
					.memberId(mr.getParameter("memberId"))
					.aCode(mr.getParameter("aCode"))
					.anaName(mr.getParameter("anaName"))
					.anaPrice(Integer.parseInt(mr.getParameter("anaPrice")))
					.anaContent(mr.getParameter("anaContent"))
					.fileType(mr.getFilesystemName("upFile"))
					.build();
			
			System.out.println(p);
			
			int result=new ProductService().insertProduct(p);
			
			String msg="";
			String loc="";
			
			if(result>0) {
				msg="상품등록완료";
				loc="/product/productList.do";
			}else {
				msg="상품등록실패";
				loc="/product/productWrite.do";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
