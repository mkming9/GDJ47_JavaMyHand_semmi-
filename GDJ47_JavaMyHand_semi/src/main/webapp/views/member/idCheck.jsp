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

<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>

</head>
<body>
<style>
	body{
		background-color:gray;
		border: solid 1px;
		padding-bottom:110px;
	}
	div#checkId-container{
		margin-top : 60px;
		text-align : center;
		border:1px;
	}
	span#idCheck{
		color : red;
		font-weight : bolder;
	}
</style>
	<div id="checkId-container">
		<%if(result) {%>
			<strong>[<span style="color:lightgreen"><%=request.getParameter("memberId")%></span>]는 사용가능합니다.</strong>	
			<br><br>
			<button type="button" onclick="close();">닫기</button>
			<br>
		<%} else{%>
			<strong>[<span id="idCheck"><%=request.getParameter("memberId")%></span>]는 중복된 아이디입니다.</strong>
			<br><br>
			
			<form action="<%=request.getContextPath() %>/idCheck.do" method="post">
				<input type="text" name="memberId" id="memberId">
				<input type="submit" value="중복검사" >
					<br><br>
				<button type="button" onclick="close();">닫기</button>
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