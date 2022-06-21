<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.jmh.product.model.vo.Product,java.util.List,com.jmh.member.model.vo.Member" %>
    <%
    
     List<Product> products=(List<Product>)request.getAttribute("products"); 
     String pageBar=(String)request.getAttribute("pageBar");
   	List<Product> list=(List<Product>)request.getAttribute("list");
   	String searchType=request.getParameter("searchType");
   	String keyword=request.getParameter("searchkeyword");
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
<style>

div#pageBar{margin-top:10px; text-align:center;}
</style>

<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
 <div id="search-container">
 		<h2>상세검색</h2>
        	검색타입 : 
        	<select id="searchType">
        		<option value="MEMBER_ID" <%=searchType!=null&&searchType.equals("MEMBER_ID")?"SELECT":""%>>아이디</option>
        		<option value="A_CODE" <%=searchType!=null&&searchType.equals("A_CODE")?"SELECT":""%>>카테고리</option>
        		<option value="ANA_NAME" <%=searchType!=null&&searchType.equals("ANA_NAME")?"SELECT":""%>>상품이름</option>
        	</select>
        	<div id="search-userId">
        		<form action="<%=request.getContextPath()%>/productsearch.do">
        			<input type="hidden" name="searchType" value="MEMBER_ID" >
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 아이디를 입력하세요" list="prs">
        			<datalist id="prs">
        			</datalist>
        			<button type="submit">검색</button>
        		</form>
        		<script>
        		$("input[placeholder*=아이디]").keyup(e=>{
    				$.ajax({
    					url:"<%=request.getContextPath()%>/ajaxautocomplete",
    					data:{"keyword":e.target.value},
    					success:data=>{
    						$("#prs").html("");
    						/* console.log(data); */
    						data.forEach(v=>{
    							const op=$("<option>").attr("value",v).text(v);
    							$("#prs").append(op);
    						});
    					}
    				});
    			});
        		</script>
        	</div>
        	<div id="search-userName">
        		<form action="<%=request.getContextPath()%>/productsearch.do">
        			<input type="hidden" name="searchType" value="A_CODE">
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 카테고리를 입력하세요">
        			<button type="submit">검색</button>
        		</form>
        	</div>
        	<div id="search-gender">
        		<form action="<%=request.getContextPath()%>/productsearch.do">
        			<input type="hidden" name="searchType" value="ANA_NAME">
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 상품이름 입력하세요">
        			<button type="submit">검색</button>
        		</form>
        		</form>
        	</div>
        </div>
        <div id="numPerpage-container">
        	페이지당 회원수 : 
        	<form id="numPerFrm" action="">
        		<select name="numPerpage" id="numPerpage">
        			<option value="10">10</option>
        			<option value="5" >5</option>
        			<option value="3" >3</option>
        		</select>
        	</form>
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