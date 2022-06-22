<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.jmh.product.model.vo.Product,java.util.List,com.jmh.member.model.vo.Member" %>
    <%
    
     List<Product> products=(List<Product>)request.getAttribute("products"); 
     String pageBar=(String)request.getAttribute("pageBar");
     
     String searchType=request.getParameter("searchType");
 	String keyword=request.getParameter("searchKeyword");
 	
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
<meta charset="UTF-8">
<title>아나바다</title>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<style>
div#pageBar{margin-top:10px; text-align:center;}
 div#search-container {margin:0 0 10px 0; padding:3px; 
   }
    div#search-A_CODE{display:inline-block;}
    div#search-ANA_NAME{display:none;}
    div#numPerpage-container{float:right;}
    form#numperPageFrm{display:inline;}
</style>

<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
	<div id="search-container">
        	검색 : 
        	<select id="searchType">
        		<option value="A_CODE" >카테고리</option>
        		<option value="ANA_NAME" >상품이름</option>
        		
        	</select>
        	<div id="search-A_CODE">
        		<form action="<%=request.getContextPath()%>/productsearch.do">
        			<input type="hidden" name="searchType" value="A_CODE" >
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 카테고리를 입력하세요" >
        			<button type="submit">검색</button>
        		</form>
        	</div>
        	<div id="search-ANA_NAME">
        		<form action="<%=request.getContextPath()%>/productsearch.do">
        			<input type="hidden" name="searchType" value="ANA_NAME">
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 상품이름을 입력하세요">
        			<button type="submit">검색</button>
        		</form>
        	</div>
        	
        </div>
       
        

	<div>
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
      <!-- <th scope="col">회원이름</th> -->
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
 
     <%if(!products.isEmpty()) {
		for(Product p : products) {%>
		<tr>
			<td><%=p.getANA_NO()%></td>			
			<%-- <td><%=p.getMEMBER_ID()%></td> 		 --%>	
			<td><%=p.getA_CODE()%></td>			
			<td><a href="<%=request.getContextPath()%>/product/productview.do?no=<%=p.getANA_NO()%>"><%=p.getANA_NAME()%></a></td>
			<td><%=p.getANA_PRICE()%></td>
			<%-- <td><%=p.getANA_CONTENT()%></td> --%>
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
 </div>
</body>
 <script>
        $(()=>{
        	$("#searchType").change(e=>{
        		/* alert("type이 변경됨"); */
        		const type=$(e.target).val();
        		console.log(type);
        		$("#search-container>div[id!=search-]").hide();
        		$("#search-"+type).css("display","inline-block");
        	});
        })      
        </script>
</html>
