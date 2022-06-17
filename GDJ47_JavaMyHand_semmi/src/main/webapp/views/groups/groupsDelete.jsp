<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/groups/groupsDeleteEnd.do" method="post">
		<input type="text" name="groupTitle" placeholder="삭제할 그룹명 입력" required>
		<input type="submit" value="확인">
		<input type="reset" value="취소">
	</form>
</body>
</html>