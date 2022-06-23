package com.jmh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

/**
 * Servlet implementation class OutPointServlet
 */
@WebServlet("/member/outPoint.do")
public class OutPointServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OutPointServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/views/member/outPoint.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("doPost:");
//		// Step1. rest-api를 사용하기 위한 인증
//		String imp_key    = "6655372945418302";
//		String imp_secret = "68c6fe5927317443441ba9e828dbd5878194e19e036e59f58ebeb9bc4dda482160ba443b2462fc9d";
//		String authApi = "https://api.iamport.kr/users/getToken";
//		
//		JsonObject authParams = new JsonObject();
//		authParams.put("imp_key", imp_key);
//		authParams.put("imp_secret", imp_secret);
//		
//		JsonObject authTokenObj = callApi(authApi, authParams, null, "POST");
//				
//		// 인증용 access_token 추
//		// 실제 하실 때는 오류 발생시 처리도 하셔야 합니다.
//		String authToken = authTokenObj.getJSONObject("response").getString("access_token");
//		
//		
//		// Step2. 취소 api 호출하여  취소(환불)처
//		
//		String reason = request.getParameter("reason");
//		String imp_uid = request.getParameter("imp_uid");
//		String cancelApi = "https://api.iamport.kr/payments/cancel";
//		
//		JsonObject params = new JsonObject();
//		params.put("reason", reason);
//		params.put("imp_uid", imp_uid);
//		
//		JsonObject cancelResult = callApi(cancelApi, params,authToken, "POST");
//		
//		
//		System.out.println("취소결과:" + cancelResult.toString());
	}
	
//	public JsonObject callApi(String urlstr, JsonObject params,String authToken ,String type){
//		
//		
//	}

}
