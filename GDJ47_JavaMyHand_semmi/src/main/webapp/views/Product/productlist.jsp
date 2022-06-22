<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ include file="/views/common/header.jsp" %>


<body>
	<div>

	<div class="productbanner"></div>
	
<div id="search-container">
        	검색 : 
        	<select id="searchType">
        		<option value="ANA_NAME" <%=searchType!=null&&searchType.equals("ANA_NAME")?"selected":"" %> >상품이름</option>
        		<option value="A_CODE"<%=searchType!=null&&searchType.equals("A_CODE")?"selected":"" %>>카테고리</option>
        		
        		
        		
        	</select>
        	<div id="search-ANA_NAME">
        		<form action="<%=request.getContextPath()%>/productsearch.do">
        			<input type="hidden" name="searchType" value="ANA_NAME">
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 상품이름을 입력하세요">
        			<button type="submit">검색</button>
        		</form>
        	</div>
        	
        	<div id="search-A_CODE">
        		<form action="<%=request.getContextPath()%>/productsearch.do">
        			<input type="hidden" name="searchType" value="A_CODE" >
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 카테고리를 입력하세요" >
        			<button type="submit">검색</button>
        		</form>
        	</div>        	
        </div>
       
       
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
      <!--  <th scope="col">회원이름</th>  -->
      <th scope="col">카테고리</th>
      <th scope="col">상품이름</th>
      <th scope="col">가격</th>
     <!--  <th scope="col">내용</th> -->
      <th scope="col">작성일</th>
      <th scope="col">조회수</th>
    </tr>
  	</thead>
  	<tbody>
   	<tr>
 
	<%if(products.isEmpty()) { %>
			<tr>
       				<td colspan="6"><h3>조회된결과가 없습니다!</h3></td>
       			</tr>
	<%}else {
		for(Product p : products) {%>
		<tr>
			<td><%=p.getANA_NO()%></td>			
			<%-- <td><%=p.getMEMBER_ID()%></td> 	 --%>	
			<td><%=p.getA_CODE()%></td>			
			<td><a href="<%=request.getContextPath()%>/product/productview.do?no=<%=p.getANA_NO()%>"><%=p.getANA_NAME()%></a></td>
			<td><%=p.getANA_PRICE()%></td>
			<%-- <td><%=p.getANA_CONTENT()%></td> --%>
			<td><%=p.getANA_DATE()%></td>
			<td><%=p.getANA_VIEW()%></td>
		</tr>
	 <% } 
	 } %>  
  	</tbody>
</table>  
<div id="pageBar">
			<%=request.getAttribute("pageBar") %>
		</div>
 </div>
</body>
 <script>
        $(()=>{
        	$("#searchType").change(e=>{
        		 /* alert("type이 변경됨");  */
        		const type=$(e.target).val();
        	 console.log(type); 
        		$("#search-container>div[id!=search-]").hide();
        		
        		$("#search-"+type).css("display","inline-block");
        	});
        	$("#searchType").change();
        })      
        </script>
</html>
