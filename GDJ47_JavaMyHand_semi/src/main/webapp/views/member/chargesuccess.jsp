<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>충전완료</title>
</head>
<body>
	<script>
		alert("포인트 충전완료");
		location.replace("<%=request.getContextPath()%><%="/"%>");
	</script>
</body>
</html>
