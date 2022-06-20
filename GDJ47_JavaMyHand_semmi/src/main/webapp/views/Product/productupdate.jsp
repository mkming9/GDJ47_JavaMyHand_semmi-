<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.jmh.product.model.vo.Product,com.jmh.member.model.vo.Member"
    %>
    
    <%
    Product p =(Product)session.getAttribute("product"); 
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
	<form action="<%=request.getContextPath() %>/UpdateProductServlet.do" method="post">
	<table class="table">
	
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
   
     
     <td><input type="text" name="ANA_NO" readonly><%=p.getANA_NO() %></td>
      <td><input type="text" name="MEMBER_ID" readonly><%=p.getMEMBER_ID() %></td>
      <td><input type="text" name="A_CODE"><%=p.getA_CODE() %></td>
      <td><input type="text" name="ANA_NAME"><%=p.getANA_NAME() %></td>
      <td><input type="text" name="ANA_PRICE"><%=p.getANA_PRICE() %></td>
      <td><input type="text" name="ANA_CONTENT"><%=p.getANA_CONTENT() %></td>
      
      
  </tbody>
 	<tr>
 	<th colspan="2">
 			<input type="submit" value="등록" >
			<input type="reset" value="취소">
 	</th>
</table>

	
	
	
		
</form>	
</body>
</html>