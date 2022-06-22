<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp" %>

<body>
	<div class="productbanner"></div>
	<table class="table">
	
	
	
	
 	<thead>
  	<tr>
  	<%if(loginMember!=null) {%>
	
  	<td colspan="8"><button id="addProduct"
	onclick="location.assign('<%=request.getContextPath() %>/ProductWriteServlet')" >상품등록</button></td>
  	<%}%>
  	</tr>
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
 
	<%if(!products.isEmpty()) {
		for(Product p : products) {%>
		<tr>
			<td><%=p.getANA_NO()%></td>			
			<td><%=p.getMEMBER_ID()%></td> 			
			<td><%=p.getA_CODE()%></td>			
			<td><a href="<%=request.getContextPath()%>/product/productview.do?no=<%=p.getANA_NO()%>"><%=p.getANA_NAME()%></a></td>
			<td><%=p.getANA_PRICE()%></td>
			<td><%=p.getANA_CONTENT()%></td>
			<td><%=p.getANA_DATE()%></td>
			<td><%=p.getANA_VIEW()%></td>
		</tr>
	 <%} 
	 } %>  
  	</tbody>
</table>  
<div id="pageBar">
			<%=pageBar %>
		</div>
 
</body>
</html>