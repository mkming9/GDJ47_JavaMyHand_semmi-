<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 
 	boolean result =(boolean)request.getAttribute("result");
 
 %>   
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script> --%>

<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

</head>
<body>
<style>
	div#checkId-container{
		text-align : center;
		padding-top : 50px;
	}
	span#idCheck{
		color : red;
		font-weight : bolder;
	}
</style>
	<div id="checkId-container">
		<%if(result) {%>
			[<span><%=request.getParameter("memberId")%></span>]는 사용가능합니다.	
			<br><br>
			<button type="button" onclick="close();">닫기</button>
			<br>
		<%} else{%>
			[<span id="idCheck"><%=request.getParameter("memberId")%></span>]는 사용중입니다.
			<br><br>
			
			<form action="<%=request.getContextPath() %>/idCheck.do" method="post">
				<input type="text" name="memberId" id="memberId">
				<input type="submit" value="중복검사" >
			</form>
		<%} %>
	</div>	
	<script>
   				
		const btn = document.querySelector("[type=button]");
			btn.addEventListener("click",(e)=>{
			opener.sign.memberId.value='<%=request.getParameter("memberId")%>';
			opener.sign.password.focus();
			close(); 
		});
	</script>
</body>
</html>