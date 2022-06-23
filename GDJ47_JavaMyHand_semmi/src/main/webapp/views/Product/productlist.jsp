<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ include file="/views/common/header.jsp" %>


<body>

<div class="productbanner"></div>
	
	<table class="producttable">
		<thead>
		<div id="search-container">
        	검색 : 
        	<select id="searchType">
        		<option value="ana_Name" <%=searchType!=null&&searchType.equals("ana_Name")?"selected":"" %> >상품이름</option>
        		<option value="a_Code"<%=searchType!=null&&searchType.equals("a_Code")?"selected":"" %>>카테고리</option>
        		
        		
        		
        	</select>
        	<div id="search-ana_Name">
        		<form action="<%=request.getContextPath()%>/productsearch.do">
        			<input type="hidden" name="searchType" value="ana_Name">
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 상품이름을 입력하세요">
        			<button type="submit">검색</button>
        		</form>
        	</div>
        	
        	<div id="search-a_Code">
        		<form action="<%=request.getContextPath()%>/productsearch.do">
        			<input type="hidden" name="searchType" value="a_Code" >
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 카테고리를 입력하세요" >
        			<button type="submit">검색</button>
        		</form>
        	</div>        	
        </div>
			<tr>
		    	<%if(loginMember!=null) {%>
			    	<td colspan="8">
			    		<button id="addProduct" onclick="location.assign('<%=request.getContextPath() %>/ProductWriteServlet')" >글쓰기</button>
			    	</td>
		    	<%}%>
	    	</tr>
	    <tr>
	        <th scope="col">상품번호</th>
	        <!-- <th scope="col">회원이름</th> -->
	        <th scope="col">카테고리</th>
	        <th scope="col">상품이름</th>
	        <th scope="col">가격</th>
	        <!-- <th scope="col">내용</th> -->
	        <th scope="col">작성일</th>
	        <th scope="col">조회수</th>
	    </tr>
	    </thead>
	    
	    <tbody>
	    <tr>
	    	<%if(!products.isEmpty()) {
	    	for(Product p : products) {%>
	    <tr>
	    	<td><%=p.getAna_No()%></td>         
	        <%-- <td><%=p.getMEMBER_ID()%></td>        --%>   
	        <td><%=p.getA_Code()%></td>         
	        <td><a href="<%=request.getContextPath()%>/product/productview.do?no=<%=p.getAna_No()%>"><%=p.getAna_No()%></a></td>
	        <td><%=p.getAna_Price()%></td>
	        <%-- <td><%=p.getANA_CONTENT()%></td> --%>
	        <td><%=p.getAna_Date()%></td>
	        <td><%=p.getAna_View()%></td>
	    </tr>
	    
	    <%} 
	    } %>  
	    </tbody>
	</table>

	


       
       
	<%-- <table class="table">

	
	
	
	
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
			<td><%=p.getMEMBER_ID()%></td> 		
			<td><%=p.getA_CODE()%></td>			
			<td><a href="<%=request.getContextPath()%>/product/productview.do?no=<%=p.getANA_NO()%>"><%=p.getANA_NAME()%></a></td>
			<td><%=p.getANA_PRICE()%></td>
			<td><%=p.getANA_CONTENT()%></td>
			<td><%=p.getANA_DATE()%></td>
			<td><%=p.getANA_VIEW()%></td>
		</tr>
	 <% } 
	 } %>  
  	</tbody>
</table>   --%>
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
            /* console.log(type); */
            $("#search-container>div[id!=search-]").hide();
              
        	$("#search-"+type).css("display","inline-block");
    	});
        $("#searchType").change();
	})      
</script>
<%@ include file="/views/common/footer.jsp" %>
