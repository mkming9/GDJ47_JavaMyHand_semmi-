package com.jmh.groups.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jmh.groups.model.service.GroupsService;

/**
 * Servlet implementation class GroupsDeleteEndServlet
 */
@WebServlet("/groups/groupsDeleteEnd.do")
public class GroupsDeleteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroupsDeleteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String groupTitle=request.getParameter("groupTitle");
		
		int result=new GroupsService().deleteGroups(groupTitle);
		
		System.out.println(result);
	
		String msg="" ,loc="";
		if(result>0) {
			msg="삭제에 성공하셨습니다";
			loc="/views/groups/groupsCreate.jsp";
		}else {
			msg="삭제에 실패했습니다 다시 시도하세요";
			loc="/views/groups/groupsCreate.jsp";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp")
		.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
