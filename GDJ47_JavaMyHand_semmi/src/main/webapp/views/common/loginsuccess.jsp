<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인성공</title>
</head>
<body>
	<script>
		alert("로그인의 성공했습니다");
			location.replace("<%=request.getContextPath()%><%="/"%>");
	</script>
</body>
</html>