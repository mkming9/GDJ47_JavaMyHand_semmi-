<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.jmh.product.model.vo.Product,java.util.List,com.jmh.member.model.vo.Member" %>
    <%
    
     List<Product> product=(List<Product>)request.getAttribute("product"); 
 
   
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


<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
	<table class="table">
	
  <thead>
    <tr>
      <th scope="col">상품번호</th>
      <th scope="col">회원이름</th>
      <th scope="col">카테고리</th>
      <th scope="col">상품이름</th>
      <th scope="col">가격</th>
      <th scope="col">내용</th>
      <th scope="col">작성일</th>
      <th scope="col">조회수</th>
    </tr>
  </thead>
  <tbody>
   <tr>
 
     <%if(!product.isEmpty()) {
		for(Product p : product) {%>
		<tr>
			<td><a href=""><%=p.getANA_NO()%></a></td>			
			<td><%=p.getMEMBER_ID()%></td> 			
			<td><%=p.getA_CODE()%></td>			
			<td><%=p.getANA_NAME()%></td>
			<td><%=p.getANA_PRICE()%></td>
			<td><%=p.getANA_CONTENT()%></td>
			<td><%=p.getANA_DATE()%></td>
			<td><%=p.getANA_VIEW()%></td>
		</tr>
	  <%} 
	  } %>  
  </tbody>
</table>  

 <%if(loginMember!=null) {%>
<button id="addProduct"
	onclick="location.assign('<%=request.getContextPath() %>/ProductWriteServlet')" >상품등록</button>
	
	<button id="alterProduct" onclick="location.assign('<%=request.getContextPath() %>/UpdateProductServlet.do')">상품수정</button>
	<button id="alterProduct">상품삭제</button>	
	<%}%>
</body>
</html>