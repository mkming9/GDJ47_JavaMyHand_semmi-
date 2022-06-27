<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/views/common/header.jsp" %>

<body>

<div class="productbanner"></div>
<div>
	<button id="addProduct" onclick="location.assign('<%=request.getContextPath()%>/product/productWrite.do')" >글쓰기</button>
</div>
 <section id="content">
 	<%if(products.isEmpty()) { %>
      <h3>조회된결과가 없습니다!</h3>
	<%} else {
		for(Product p : products) {%>
        <div class="post">
            <div class="pic">
                <img src="<%=request.getContextPath()%>/images/noimage.jpg">
            </div>
            <div class="description">
                <h3><a href="<%=request.getContextPath()%>/product/productView.do?no=<%=p.getAnaNo()%>"><%=p.getAnaName()%></a></h3>
                <p><%=p.getAnaContent()%></p>
                <p><%=p.getAnaPrice()%> 원</p>
            </div>
        </div>
        <% }
	 } %>  
  </section>
  
<div id="pageBar">
	<%=request.getAttribute("pageBar") %>
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