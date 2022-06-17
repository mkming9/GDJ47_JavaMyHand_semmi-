<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.jmh.product.model.vo.Product"
    %>
    
    <%
    Product p =(Product)request.getAttribute("product"); 
    %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
crossorigin="anonymous">
<meta charset="UTF-8">
<title>상품등록중.....</title>
</head>
<body>
	<from action="<%=request.getContextPath() %>/ProductWriteEndServlet" method="post">
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
     
     
    </tr>
  </thead>
  <tbody>
   <tr>
   
     
      <td><input type="text" ></td>
       <td><input type="text"></td>
      <td><input type="text"></td>
      <td><input type="text"></td>
      <td><input type="text"></td>
      <td><input type="text"></td>
      
      
  </tbody>
 
</table>
		 <input type="submit" value="등록" onclick="<%=request.getContextPath()%>/ProductWriteEndServlet">
		<input type="reset" value="취소">
		
				</from>	
</body>
</html>