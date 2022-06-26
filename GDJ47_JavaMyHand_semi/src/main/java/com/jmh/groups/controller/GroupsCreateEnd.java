package com.jmh.groups.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import com.jmh.groups.model.service.GroupsService;
import com.jmh.groups.model.vo.Groups;

/**
 * Servlet implementation class GruopsCreateEnd
 */
@WebServlet("/groups/groupsCreateEnd.do")
public class GroupsCreateEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroupsCreateEnd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String groupTitle=request.getParameter("groupTitle");
		String gCode=request.getParameter("gCode");
		String groupLocation=request.getParameter("groupLocation");
		int groupLimit=Integer.parseInt(request.getParameter("groupLimit"));
		String groupGender=request.getParameter("groupGender");
		String groupContent=request.getParameter("groupContent");
		String memberId=request.getParameter("memberId");
		System.out.println(memberId+" "+groupTitle+" "+gCode+" "+groupLocation+" "
		+groupLimit+" "+groupGender+" "+groupContent);
		
		Groups g=Groups.builder()
				.gCode(gCode)
				.groupTitle(groupTitle)
				.groupContent(groupContent)
				.groupLimit(groupLimit)
				.groupGender(groupGender)
				.groupLocation(groupLocation)
				.build();
		System.out.println(g);
		int result=new GroupsService().insertGroups(g);
		String msg="" ,loc="";
		if(result>0) {
			msg="등록에 성공하셨습니다";
			loc="/";
		}else {
			msg="등록에 실패했습니다 다시 시도하세요";
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
