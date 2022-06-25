package com.jmh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jmh.member.model.service.MemberService;
import com.jmh.member.model.vo.Member;

/**
 * Servlet implementation class MemberDetailEditServlet
 */
@WebServlet("/membereditend.do")
public class MemberEditEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEditEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member m = new Member();
		m.setMemberId(request.getParameter("memberId"));
		m.setMemberName(request.getParameter("memberName"));
		m.setGender(request.getParameter("gender"));
		m.setAge(Integer.parseInt(request.getParameter("age")));
		m.setAddress(request.getParameter("address"));
		m.setPhone(request.getParameter("phone"));
		m.setEmail(request.getParameter("email"));

		
//		String memberId = request.getParameter("memberId");
//		String password = request.getParameter("password");
//		String memberName = request.getParameter("memberName");
//		String gender = request.getParameter("gender");
//		int age =Integer.parseInt(request.getParameter("age"));
//		String address= request.getParameter("address");
//		String phone = request.getParameter("phone");
//		String email = request.getParameter("email");
//		
//		Member m = Member.builder().memberId(memberId)
//				.password(password)
//				.memberName(memberName)
//				.gender(gender)
//				.age(age)
//				.address(address)
//				.phone(phone)
//				.point(0)
//				.enrollDate(null)
//				.email(email)
//				.build();
		
		int result = new MemberService().memberEdit(m);
		
		String msg="", loc="";
//		loc = "/memberedit.do?memberId=" + m.getMemberId();		
		if(result>0) {
			msg = "정상적으로 수정되었습니다";
		}else {
			msg = "수정을 실패했습니다";
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
