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
<title>상품등록중.....</title>
</head>
<body>

	<form action="<%=request.getContextPath() %>/product/productWriteEnd.do" 
	method="post" enctype="multipart/form-data">
	<table class="table">
  <thead>
    <tr>
      <th scope="col">상품번호</th>
      <th scope="col">상품이름</th>
      <th scope="col">가격</th>
      <th scope="col">내용</th>
      <th>사진</th>
    </tr>
  </thead>
  <tbody>
  	<tr>
      <td><input type="text" name="anaNo" readonly></td>
      <td><input type="text" name="memberId" value="<%=loginMember.getMemberId() %>" readonly></td>
      <td><input type="text" name="aCode"></td>
      <td><input type="text" name="anaName"></td>
      <td><input type="number" name="anaPrice"></td>
      <td><input type="text" name="anaContent"></td>
      <td><input type="file" name="upFile"></td>
 	<tr>
 	<td colspan="2">
 		<input type="submit" value="등록" >
		<input type="reset" value="취소">
 	</td>
 </tbody>
</table>
</form>
 <%-- <button id="addProduct"
	onclick="location.assign('<%=request.getContextPath() %>/ProductWriteServlet')" >상품등록</button>
	
	<button id="alterProduct" >상품수정</button>
	<button id="alterProduct">상품삭제</button>	  --%>

</body>
</html>