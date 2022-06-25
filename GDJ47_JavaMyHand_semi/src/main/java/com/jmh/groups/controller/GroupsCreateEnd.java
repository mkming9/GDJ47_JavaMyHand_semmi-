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
		String groupContent=request.getParameter("groupContent");
		String gCode=request.getParameter("gCode");
		int groupLimit=Integer.parseInt(request.getParameter("groupLimit"));
		String groupGender=request.getParameter("groupGender");
		String groupLocation=request.getParameter("groupLocation");
		
		System.out.println(groupTitle+" "+groupContent+" "+groupGender+" "+groupLimit+" "+groupLocation);
		Groups g=Groups.builder().gCode(gCode)
				.groupTitle(groupTitle)
				.groupContent(groupContent)
				.groupGender(groupGender)
				.groupLimit(groupLimit)
				.groupLocation(groupLocation)
				.build();
		
		int result=new GroupsService().insertGroups(g);
	
		if(g!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("result",result);
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
