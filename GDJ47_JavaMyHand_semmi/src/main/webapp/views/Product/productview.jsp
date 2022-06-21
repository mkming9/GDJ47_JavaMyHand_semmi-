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
				<td><%=p.getANA_NO() %></td>
			</tr>
			<tr>
				<th>상품이름</th>
				<td><%=p.getANA_NAME() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=p.getMEMBER_ID() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=p.getANA_VIEW() %></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><%=p.getANA_PRICE() %></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><%=p.getANA_CONTENT() %></td>
			</tr>
			<%-- <%--글작성자/관리자인경우 삭제 가능 --%>
		 <%if(loginMember!=null &&
			(loginMember.getMemberId().equals(p.getMEMBER_ID())
				||loginMember.getMemberId().equals("admin1"))) {%> 
			<tr>
				 <th colspan="3">					
					<button id="deleteProduct" onclick="location.assign('<%=request.getContextPath() %>/product/productdelete.do?no=<%=p.getANA_NO()%>')">상품삭제</button>
					<%}%>
					<!-- 글작성자만 수정만가능 -->
					  <% if(loginMember!=null &&loginMember.getMemberId().equals(p.getMEMBER_ID())) {%>
					<button id="alterProduct" onclick="location.assign('<%=request.getContextPath() %>/productUpdateServlet.do?no=<%=p.getANA_NO()%>')">상품수정</button>
					<%} else {%>
					<td>수정불가</td>
					<%} %> 
				</th> 
			</tr> 
			
		
			
		</table>
    </section>
</body>
</html>