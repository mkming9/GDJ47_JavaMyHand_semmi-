<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.jmh.product.model.vo.Product,java.util.List,com.jmh.member.model.vo.Member" %>
    <%
    
     Product p=(Product)request.getAttribute("product"); 
     String pageBar=(String)request.getAttribute("pageBar");
   
    Member loginMember = (Member)session.getAttribute("loginMember");
	Cookie[] cookies = request.getCookies();
	String saveId = null;
	if(cookies != null){
		for(Cookie c : cookies){
			if(c.getName().equals("saveId")){
				saveId = c.getValue();
			}
		}
	}
    %>

<body>

	<style>
    section#board-container{width:600px; margin:0 auto; text-align:center;}
    section#board-container h2{margin:10px 0;}
    table#tbl-board{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-board th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-board td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
    </style>

		<section id="board-container">
		<div class="anabadabanner"></div>
		
		<h2>상품 게시판</h2>
		<table id="tbl-board">
			<tr>
				<th>상품번호</th>
				<td><%=p.getAna_No() %></td>
			</tr>
			<tr>
				<th>상품이름</th>
				<td><%=p.getAna_Name() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=p.getMember_Id() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=p.getAna_View() %></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><%=p.getAna_Price() %></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><%=p.getAna_Content() %></td>
			</tr>
			<%-- <%--글작성자/관리자인경우 삭제 가능 --%>
		 <%if(loginMember!=null &&
			(loginMember.getMemberId().equals(p.getMember_Id())
				||loginMember.getMemberId().equals("admin1"))) {%> 
			<tr>
				 <th colspan="3">					
					<button id="deleteProduct" onclick="location.assign('<%=request.getContextPath() %>/product/productdelete.do?no=<%=p.getAna_No()%>')">상품삭제</button>
					<%}%>
					<!-- 글작성자만 수정만가능 -->
					  <% if(loginMember!=null &&loginMember.getMemberId().equals(p.getMember_Id())) {%>
					<button id="alterProduct" onclick="location.assign('<%=request.getContextPath() %>/productUpdateServlet.do?no=<%=p.getAna_No()%>')">상품수정</button>
					<%} %>
					
					
					<!-- <td><img src="/productImg/LostArk.png"></td> -->
				</th> 
			</tr> 
			
		
			
		</table>
    </section>
</body>
</html>