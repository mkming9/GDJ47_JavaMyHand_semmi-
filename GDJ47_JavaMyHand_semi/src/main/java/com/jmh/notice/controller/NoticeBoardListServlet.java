package com.jmh.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jmh.notice.model.service.NoticeBoardListService;
import com.jmh.notice.model.vo.NoticeBoard;

/**
 * Servlet implementation class NoticeListServlet1
 */
@WebServlet("/noticeList.do")
public class NoticeBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		List<NoticeBoard> result = new NoticeBoardListService().noticeBoardList();
//		request.setAttribute("result", result);
//		System.out.println(result);
		request.getRequestDispatcher("/views/noticeboard/noticeBoardList.jsp")
		.forward(request,response);
	}

		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
