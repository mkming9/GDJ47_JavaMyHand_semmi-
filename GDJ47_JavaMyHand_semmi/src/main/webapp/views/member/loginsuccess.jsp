<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%
    String msg=(String)request.getAttribute("msg");
	String loc=(String)request.getAttribute("loc");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
<script>
		
		alert("로그인 성공");
		location.replace("<%=request.getContextPath()%><%="/"%>");
	</script>
</body>
</html>