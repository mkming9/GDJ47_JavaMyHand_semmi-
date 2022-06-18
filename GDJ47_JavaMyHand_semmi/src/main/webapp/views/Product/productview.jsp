<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.jmh.product.model.vo.Product,com.jmh.member.model.vo.Member,java.util.List" %>
    <%
    
     List<Product> product=(List<Product>)request.getAttribute("product"); 
 
   
    /*  Product p =(Product)request.getAttribute("product");  */
    %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
crossorigin="anonymous">
<meta charset="UTF-8">
<title>아나바다</title>
</head>
<body>
	<table class="table">
	<button id="addProduct"
	onclick="location.assign('<%=request.getContextPath() %>/ProductWriteServlet')" >상품등록</button>
	
	<button id="alterProduct" >상품수정</button>
	<button id="alterProduct">상품삭제</button>	
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
			<td><%=p.getANA_NO()%></td>			
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
    
    
  
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
 integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>           
</body>
</html>