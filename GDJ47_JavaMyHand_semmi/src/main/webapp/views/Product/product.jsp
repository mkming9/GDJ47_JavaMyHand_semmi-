<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.jmh.product.model.vo.Product,java.util.List" %>
    <%
    
    List<Product> product=(List<Product>)request.getAttribute("product");
    /* Product p =(Product)request.getAttribute("product"); */
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <%if(!product.isEmpty()) {
		for(Product p : product) {%>
		<tr>
			<td><%=p.getANA_NAME()%></td>
			<td><%=p.getANA_PRICE()%></td>
			<td><%=p.getANA_DATE()%></td>
		</tr>
	  <%} 
	  } %>
     
            
</body>
</html>