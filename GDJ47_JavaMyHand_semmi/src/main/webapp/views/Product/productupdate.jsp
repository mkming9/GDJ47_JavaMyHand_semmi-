<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.jmh.product.model.vo.Product,com.jmh.member.model.vo.Member"
    %>
    
    <%
    Product p =(Product)request.getAttribute("product"); 
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
<title>상품수정중.....</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/productupdateEndServlet.do" method="post">
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
   
     

  <td><input type="text" name="ANA_NO" value="<%=p.getAna_No() %>" readonly></td>
   <td><input type="text" name="MEMBER_ID" value="<%=p.getMember_Id() %>" readonly></td>
   <td><input type="text" name="A_CODE" value="<%=p.getA_Code() %>"></td>
   <td><input type="text" name="ANA_NAME" value="<%=p.getAna_Name() %>"></td>
   <td><input type="text" name="ANA_PRICE" value="<%=p.getAna_Price() %>"></td>
   <td><input type="text" name="ANA_CONTENT" value="<%=p.getAna_Content() %>"></td>

      
      
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