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
 * Servlet implementation class SignUpEndServlet
 */
@WebServlet("/signupend.do")
public class SignUpEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			//회원가입
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		String memberName = request.getParameter("memberName");
		String gender = request.getParameter("gender");
		int age =Integer.parseInt(request.getParameter("age"));
		String address= request.getParameter("address");
		String phone = request.getParameter("phone");
		
		
		
		System.out.println("아이디 : "+memberId+"\n비번 : "+password
						+"\n이름 : "+memberName+"\n성별 : "+gender+"\n나이 : "+age
						+"\n주소 : "+address+"\n번호 : "+phone);

		Member m = Member.builder().memberId(memberId)
						.password(password)
						.memberName(memberName)
						.gender(gender)
						.age(age)
						.address(address)
						.phone(phone)
						.point(0)
						.enrollDate(null)
						.build();
	
		int result =new MemberService().memberSignUp(m); 
		System.out.println(result);
		
		String msg="" ,loc="";
		if(result>0) {
			msg="회원가입을 성공하셨습니다";
			loc="/";
		}else {
			msg="회원가입을 실패했습니다 다시 시도하세요";
			loc="/signup.do";
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
